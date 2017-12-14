//
//  FinishViewController.swift
//  iQuiz
//
//  Created by Yongjun Park on 11/13/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var navMenuButton: UIBarButtonItem!
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var wrongCount: Int = 0
    var questionCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pct: Double = Double(questionCount - wrongCount) / Double(questionCount)
        var result: String = ""
        var headline: String = ""
        if pct == 1.0 {
            headline = "Perfect!"
            result = "You got all " + String(questionCount) + " questions correct."
        }
        else {
            if pct >= 0.80 {
                headline = "Close!"
                result = "You got " + String(questionCount - wrongCount) + " out of " + String(questionCount) + " questions correct."
            }
            else {
                headline = "Better luck next time!"
                result = "You only got " + String(questionCount - wrongCount) + " out of " + String(questionCount) + " questions correct."
            }
        }
        headLabel.text = headline
        scoreLabel.text = result
    }
    @IBAction func mainMenu(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "mainsegue", sender: self)
    }
}
