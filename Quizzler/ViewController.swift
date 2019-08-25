//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestion = QuestionBank()
    var pickedAnswer : Bool =  false
    var index = 0
    var score : Int = 0
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestion.list[0]
        questionLabel.text = firstQuestion.questionText
        progressLabel.text = "\(index + 1) / \(allQuestion.list.count)"
        scoreLabel.text = "Score= \(score)"
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1{
            pickedAnswer = true
        }
        else if sender.tag == 2{
            pickedAnswer = false
        }
        
        checkAnswer()
  
    }
    
    
    func updateUI() {
        let currentQuestion = allQuestion.list[index]
        questionLabel.text = currentQuestion.questionText
        progressLabel.text = "\(index + 1) / 13"
        scoreLabel.text = "Score= \(score)"
        
        progressBar.frame.size.width = (view.frame.size.width / 13 ) * CGFloat(index + 1)
      
    }
    

    func nextQuestion() {
        let size = allQuestion.list.count - 1
        print(index)
        
        if size > index {
            index += 1
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "Dope, you finished!", message: "would you like to restart?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
       
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestion.list[index].answer
        if pickedAnswer == correctAnswer {
            score += 100
            nextQuestion()
        }
        else {
            print("wrong")
        }
    }
    
    
    func startOver() {
        index = 0
        score = 0
        updateUI()
        
    }
    

    
}
