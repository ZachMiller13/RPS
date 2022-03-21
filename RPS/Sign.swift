//
//  Sign.swift
//  RPS
//
//  Created by Zachary Miller on 3/15/22.
//

import Foundation

//The function randomSign below is used to generate the computers response. Each response is tied to a random number, 0, 1 and 2. If 0 is generated, the result is Rock. If 1, Paper and if 2, scissors.
func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

// The enumeration Sign below is used to establish the variables in the game; Rock, Paper and Scissors. Each are tied to an emoji representing the hand motions of the in-person game.
enum Sign {
    case rock, paper, scissors
    var emoji: String {
        switch self {
        case.rock:
            return "👊"
        case.paper:
            return "✋"
        case.scissors:
            return "✌️"
        }
    }
}

//The function compareSign below is used to compare the user and computers response to determine a winner. The switch statement takes the users input and compares it to the computers. Based on the condition of the if statements, a winner is selected.
func compareSign(user: Sign, computer: Sign) -> GameState {
    switch user {
    case.rock:
        if computer == .paper {
            return GameState.Win
        } else if computer == .scissors {
            return GameState.Lose
        } else if computer == .rock {
            return GameState.Draw
        } else {
            return GameState.Start
        }
    case.paper:
    if computer == .paper {
        return GameState.Draw
    } else if computer == .scissors {
        return GameState.Lose
    } else if computer == .rock {
        return GameState.Win
    } else {
        return GameState.Start
    }
    case.scissors:
        if computer == .paper {
            return GameState.Win
        } else if computer == .scissors {
            return GameState.Draw
        } else if computer == .rock {
            return GameState.Lose
        } else {
            return GameState.Start
        }
    }
}
