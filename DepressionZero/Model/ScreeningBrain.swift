//
//  ScreeningBrain.swift
//  DepressionZero
//
//  Created by Eric on 2022/10/22.
//

import Foundation

struct ScreeningBrain {
    
    let question = [
        Screening(text: "Little interest or pleasure in doing things?"),
        Screening(text: "Feeling down, depressed, or hopeless?"),
        Screening(text: "Trouble falling or staying asleep, or sleeping too much?"),
        Screening(text: "Feeling tired or having little energy?"),
        Screening(text: "Poor appetite or overeating?"),
        Screening(text: "Feeling bad about yourself, or that you are a failure, or have let yourself or your family down?"),
        Screening(text: "Trouble concentrating on things, such as reading the newspaper or watching television?"),
        Screening(text: "Moving or speaking so slowly that other people could have noticed. Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual?"),
        Screening(text: "Thoughts that you would be better off dead, or of hurting yourself in some way?")
    ]
    
    let result = [
        Result(text: "Your screen results indicate that you have few or no symptoms of depression.", scoreFrom: 0, scoreTo: 9),
        Result(text: "Your screen results are consistent with minimal symptoms of depression. If these symptoms are distressing to you or are distracting you at work, or home, you may benefit from seeing your physician or a qualified mental health professional for a complete evaluation, as soon as practical.", scoreFrom: 10, scoreTo: 14),
        Result(text: "Your screen results are consistent with many symptoms of depression. You are advised to see your physician or a qualified mental health professional immediately for a complete assessment.", scoreFrom: 15, scoreTo: 27)
    ]

    var questionNumber = 0
    
    func getQuestionText() -> String {
        return question[questionNumber].text
    }
    
    func getResultText(severity: Int) -> String {
        return result[severity].text
    }
    
    func getProgress() -> Float {
        let progress = Float(questionNumber) / Float(question.count)
        return progress
    }
    
    mutating func next() {
        if questionNumber + 1 < question.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
        
}
