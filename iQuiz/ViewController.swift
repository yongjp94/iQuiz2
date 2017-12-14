//
//  ViewController.swift
//  iQuiz
//
//  Created by Yongjun Park on 11/12/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    var quizUrl: String = "https://tednewardsandbox.site44.com/questions.json"
    var data: [Quiz] = []
    var manager = QuizDataSource()
    var selectedIndex: Int = -1
    
    // var refreshControl: UIRefreshControl!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "quizsegue":
            let qvc = segue.destination as! QuestionViewController
            qvc.quiz = self.data[selectedIndex]
            qvc.questionIndex = 0
        case "settings":
            let svc = segue.destination as! SettingsViewController
            svc.url = manager.url
        default: NSLog("Bad segue: " + segue.identifier!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = QuizDataSource(tableView, self, url: self.quizUrl)
        data = QuizDataSource.quizzes
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Refresh code
        /*
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(ViewController.refresh), for: UIControlEvents.valueChanged)
        tableView.addSubview(refreshControl) // not required when using UITableViewController
         */
    }
    
    @objc func refresh() {
        self.tableView.reloadData()
        // self.refreshControl?.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        NSLog("Selected row: " + String(self.selectedIndex))
        performSegue(withIdentifier: "quizsegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quiz = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! QuizCell
        cell.title?.text = quiz.getSubject()
        cell.descr?.text = quiz.getDescription()
        cell.icon?.image = UIImage(named: quiz.getIcon())
        return cell
    }
    
}

