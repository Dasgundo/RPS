//
//  ViewController.swift
//  RPS
//
//  Created by TonySwan on 12.09.2018.
//  Copyright © 2018 Tony Swan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    enum GameState {
        case start, playerLoses, playerWins, draw
    }
    
    var scoreWins = 0
    var scoreLoses = 0
    
    @IBOutlet weak var appSignLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockSignButton: UIButton!
    @IBOutlet weak var paperSignButton: UIButton!
    @IBOutlet weak var scissorsSignButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        gameAction(gameState: .start)
        
    }

    func gameAction(gameState: GameState) {
        switch gameState {
        case .start :
            statusLabel.text = "Rock, Paper, Scissors"
            playAgainButton.isHidden = true
            view.backgroundColor = UIColor.darkGray
            appSignLabel.text = "🤖"
            rockSignButton.isEnabled = true
            paperSignButton.isEnabled = true
            scissorsSignButton.isEnabled = true
            rockSignButton.isHidden = false
            paperSignButton.isHidden = false
            scissorsSignButton.isHidden = false
        case .playerLoses:
            statusLabel.text = "You Lose 😢"
            playAgainButton.isHidden = false
            view.backgroundColor = UIColor.brown
            rockSignButton.isEnabled = false
            paperSignButton.isEnabled = false
            scissorsSignButton.isEnabled = false
            scoreLoses += 1
            scoreLabel.text = "\(String(scoreWins)) wins and \(scoreLoses) loses"
            
        case .playerWins:
            statusLabel.text = "You Win 😁"
            playAgainButton.isHidden = false
            view.backgroundColor = UIColor.purple
            rockSignButton.isEnabled = false
            paperSignButton.isEnabled = false
            scissorsSignButton.isEnabled = false
            scoreWins += 1
            scoreLabel.text = "\(String(scoreWins)) wins and \(scoreLoses) loses"
            
        case .draw:
            statusLabel.text = "Draw 😑"
            playAgainButton.isHidden = false
            view.backgroundColor = UIColor.gray
            rockSignButton.isEnabled = false
            paperSignButton.isEnabled = false
            scissorsSignButton.isEnabled = false
            
        }
    }
    
    func play(playerChoose: Sign, random: Sign) -> GameState {
        
        switch random {
        case .rock:
            switch playerChoose {
            case .rock:
                return .draw
            case .paper:
                return .playerWins
            case .scissors:
                return .playerLoses
            }
            
        case .paper:
            switch playerChoose {
            case .rock:
                return .playerLoses
            case .paper:
                return .draw
            case .scissors:
                return .playerWins
            }
            
        case .scissors:
            switch playerChoose {
            case .rock:
                return .playerWins
            case .paper:
                return .playerLoses
            case .scissors:
                return .draw
            }
        }
    }
    
    @IBAction func chooseRock(_ sender: UIButton) {
        let random = randomSign()
        let playerChoose = Sign.rock
        let result = play(playerChoose: playerChoose, random: random)
        paperSignButton.titleLabel?.text = playerChoose.rawValue
        appSignLabel.text = random.rawValue
        gameAction(gameState: result)
        paperSignButton.isHidden = true
        scissorsSignButton.isHidden = true
        
        
    }
    
    @IBAction func choosePaper(_ sender: UIButton) {
        let random = randomSign()
        let playerChoose = Sign.paper
        let result = play(playerChoose: playerChoose, random: random)
        paperSignButton.titleLabel?.text = playerChoose.rawValue
        appSignLabel.text = random.rawValue
        gameAction(gameState: result)
        rockSignButton.isHidden = true
        scissorsSignButton.isHidden = true
        
    }
    
    @IBAction func chooseScissors(_ sender: UIButton) {
        let random = randomSign()
        let playerChoose = Sign.scissors
        let result = play(playerChoose: playerChoose, random: random)
        paperSignButton.titleLabel?.text = playerChoose.rawValue
        appSignLabel.text = random.rawValue
        gameAction(gameState: result)
        rockSignButton.isHidden = true
        paperSignButton.isHidden = true
        
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        gameAction(gameState: .start)
    }
    
}

