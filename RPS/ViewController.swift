//
//  ViewController.swift
//  RPS
//
//  Created by Zachary Miller on 3/15/22.

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userGuessRock: UIButton!
    @IBOutlet weak var userGuessPaper: UIButton!
    @IBOutlet weak var userGuessScissors: UIButton!
    @IBOutlet weak var computerGuess: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resetGame: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    reset()
    }
    
    func reset() {
        computerGuess.text = "🤖"
        resultLabel.text = "Rock, Paper or Scissors?"
        userGuessRock.isEnabled = true
        userGuessRock.isHidden = false
        userGuessPaper.isEnabled = true
        userGuessPaper.isHidden = false
        userGuessScissors.isEnabled = true
        userGuessScissors.isHidden = false
        resetGame.isHidden = true
    }

    func playGame(_ humanTurn: Sign) {
        userGuessRock.isEnabled = false
        userGuessPaper.isEnabled = false
        userGuessScissors.isEnabled = false
        
        let computer = randomSign()
        computerGuess.text = computer.emoji
        let result = humanTurn.compareSign(computer)
        switch result {
        case .Draw:
            resultLabel.text = "It's a draw!"
        case .Win:
            resultLabel.text = "You Win!"
        case .Lose:
            resultLabel.text = "You lost..."
        case .Start:
            resultLabel.text = "Rock, Paper or Scissors?"
        }
        switch humanTurn {
        case .rock:
            userGuessRock.isHidden = false
            userGuessPaper.isHidden = true
            userGuessScissors.isHidden = true
        case .paper:
            userGuessPaper.isHidden = false
            userGuessRock.isHidden = true
            userGuessScissors.isHidden = true
        case .scissors:
            userGuessScissors.isHidden = false
            userGuessRock.isHidden = true
            userGuessPaper.isHidden = true
        }
        resetGame.isHidden = false
    }
    
    @IBAction func resetGameSelected(_ sender: Any) {
    reset()
    }
    @IBAction func userGuessRockSelected(_ sender: Any) {
        playGame(Sign.rock)
    }
    @IBAction func userGuessPaperSelected(_ sender: Any) {
        playGame(Sign.paper)
    }
    @IBAction func userGuessScissorsSelected(_ sender: Any) {
        playGame(Sign.scissors)
    }
    
}

