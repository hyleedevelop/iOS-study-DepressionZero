//
//  ViewController.swift
//  DepressionZero
//
//  Created by Eric on 2022/10/22.
//
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var screeningBrain = ScreeningBrain()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button0.tag = 0
        button1.tag = 1
        button2.tag = 2
        button3.tag = 3
        updateUI()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if screeningBrain.questionNumber < 8 {
            score += sender.tag
            
            screeningBrain.next()
            Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        } else {
            score += sender.tag

            if score >= 0 && score <= 9 {
                questionLabel.text = screeningBrain.getResultText(severity: 0)
            } else if score >= 10 && score <= 14 {
                questionLabel.text = screeningBrain.getResultText(severity: 1)
            } else {
                questionLabel.text = screeningBrain.getResultText(severity: 2)
            }
            
            progressBar.progress = 1.0
            questionLabel.font = UIFont.boldSystemFont(ofSize: 24)
            questionLabel.textColor = UIColor.systemRed
            
            button0.setTitle("", for: .normal)
            button0.isUserInteractionEnabled = false
            button0.backgroundColor = UIColor.clear
            button0.tintColor = UIColor.clear
            
            button1.setTitle("", for: .normal)
            button1.isUserInteractionEnabled = false
            button1.backgroundColor = UIColor.clear
            button1.tintColor = UIColor.clear
            
            button2.setTitle("", for: .normal)
            button2.isUserInteractionEnabled = false
            button2.backgroundColor = UIColor.clear
            button2.tintColor = UIColor.clear
            
            button3.setTitle("", for: .normal)
            button3.isUserInteractionEnabled = false
            button3.backgroundColor = UIColor.clear
            button3.tintColor = UIColor.clear
        }
    }
    
    @objc func updateUI() {
        questionLabel.text = screeningBrain.getQuestionText()
        questionLabel.numberOfLines = 0
        progressBar.progress = screeningBrain.getProgress()
        
        // the last question has different answer options from others.
        button0.setTitle("Not at all", for: .normal)
        button0.backgroundColor = UIColor.systemBlue
        button0.tintColor = UIColor.white
            
        button1.setTitle("Several days", for: .normal)
        button1.backgroundColor = UIColor.systemGreen
        button1.tintColor = UIColor.white
            
        button2.setTitle("More than half the days", for: .normal)
        button2.backgroundColor = UIColor.systemYellow
        button2.tintColor = UIColor.white
            
        button3.setTitle("Nearly every day", for: .normal)
        button3.backgroundColor = UIColor.systemRed
        button3.tintColor = UIColor.white
    }
    
}
