//
//  WordsViewController.swift
//  fabiandemoel-pset2
//
//  Created by Fabian de Moel on 21/11/2018.
//  Copyright © 2018 Fabian de Moel. All rights reserved.
//

import UIKit

class WordsViewController: UIViewController {

    var madlib: Story!
    var name: String!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var provideWord: UILabel!
    @IBOutlet weak var wordCount: UILabel!
    @IBOutlet weak var fillInWordStack: UIStackView!
    @IBOutlet weak var goToStory: UIButton!
    
    @IBAction func addWord(_ sender: Any) {
        if let word = textField.text {
            madlib.fillInPlaceholder(word: word)
        }
        textField.text = ""
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyPath = Bundle.main.path(forResource: name, ofType: "txt", inDirectory: "madlibs_ios")
        let text = try! String(contentsOfFile: storyPath!, encoding: .utf8)
        madlib = Story(withText: text)
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MadLib" {
            let storyViewController = segue.destination as! StoryViewController
            storyViewController.userStory = madlib.normalText
        }
    }
    
    func updateUI() {
        if madlib.isFilledIn {
            fillInWordStack.isHidden = true
            goToStory.isHidden = false
            wordCount.text = "Story is finished!"
        } else {
            fillInWordStack.isHidden = false
            goToStory.isHidden = true
            wordCount.text = "Still \(madlib.remainingPlaceholders) to go!"
            textField.placeholder = madlib.nextPlaceholder
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
