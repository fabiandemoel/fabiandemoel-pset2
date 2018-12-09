//
//  ViewController.swift
//  fabiandemoel-pset2
//
//  Created by Fabian de Moel on 21/11/2018.
//  Copyright © 2018 Fabian de Moel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var storyName: String!
    
    @IBOutlet weak var storySelect: UISegmentedControl!
    @IBAction func storySelect(_ sender: UISegmentedControl) {
        switch(storySelect.selectedSegmentIndex) {
        case 0:
            storyName = "madlib1_tarzan"
        case 1:
            storyName = "madlib2_university"
        case 2:
            storyName = "madlib3_clothes"
        case 3:
            storyName = "madlib4_dance"
        default:
            storyName = "madlib0_simple"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        storyName = "madlib1_tarzan"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WordsSegue" {
            let wordsViewController = segue.destination as! WordsViewController
            wordsViewController.name = storyName
        }
    }
    
    @IBAction func unwindToStart(unwindSegue: UIStoryboardSegue) {
        
    }
}

