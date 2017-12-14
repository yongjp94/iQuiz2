//
//  Question.swift
//  iQuiz
//
//  Created by Yongjun Park on 11/12/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var answer: Int
    var answers: [String]
    
    init() {
        text = "text"
        answer = 0
        answers = ["answer 1", "answer 2"]
    }
    
    init(_ data: JSON) {
        self.text = data["text"].string!
        self.answer = Int(data["answer"].string!)! - 1
        self.answers = data["answers"].arrayObject as! [String]
    }
}
