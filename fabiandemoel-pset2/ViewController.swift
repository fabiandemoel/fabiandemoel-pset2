//
//  ViewController.swift
//  fabiandemoel-pset2
//
//  Created by Fabian de Moel on 21/11/2018.
//  Copyright © 2018 Fabian de Moel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storySelect: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WordsSegue" {
            let wordsViewController = segue.destination as! WordsViewController
        }
    }
    
    @IBAction func unwindToStart(unwindSegue: UIStoryboardSegue) {
        
    }


}

