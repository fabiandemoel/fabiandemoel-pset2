//
//  StoryViewController.swift
//  fabiandemoel-pset2
//
//  Created by Fabian de Moel on 21/11/2018.
//  Copyright © 2018 Fabian de Moel. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {

    @IBOutlet weak var viewStory: UILabel!
    
    var userStory: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewStory.text = userStory
        // Do any additional setup after loading the view.
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
