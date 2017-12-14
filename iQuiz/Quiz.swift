//
//  Quiz.swift
//  iQuiz
//
//  Created by Yongjun Park on 11/12/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import Foundation

struct Quiz {
    fileprivate var questions: [Question]
    fileprivate var title: String
    fileprivate var desc: String
    fileprivate var icon: String
    
    init() {
        title = "title"
        desc = "description"
        icon = "icon"
        questions = [Question()]
    }
    
    init(_ json: JSON) {
        let questionArray = json["questions"]
        self.questions = []
        
        for i in 0..<questionArray.count {
            questions.append(Question(questionArray[i]))
        }
        self.title = json["title"].string!
        self.desc = json["desc"].string!
        
        switch (self.title) {
        case "Science!":
            self.icon = "atomicmodel"
        case "Marvel Super Heroes":
            self.icon = "superman"
        default:
            self.icon = "pi"
        }
        
    }
    
    func getQuestions() -> [Question] {
        return questions
    }
    
    func getSubject() -> String {
        return title
    }
    
    func getDescription() -> String {
        return desc
    }
    
    func getIcon() -> String {
        return icon
    }
}
