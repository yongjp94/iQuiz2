//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by Yongjun Park on 11/17/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var dataSourceInput: UITextField!
    var url: String = ""
    
    override func viewDidLoad() {
        dataSourceInput.text = self.url
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
            case "menu":
                let mvc = segue.destination as! ViewController
                if url.count > 0 {
                    mvc.quizUrl = self.url
                }
            default: NSLog("There was an errer with the segue: " + segue.identifier!)
        }
    }
    
    @IBAction func checkUrl(_ sender: UIButton) {
        self.url = dataSourceInput.text!
        performSegue(withIdentifier: "menu", sender: self)
    }
    
}
