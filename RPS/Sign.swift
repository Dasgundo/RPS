//
//  Sign.swift
//  RPS
//
//  Created by TonySwan on 12.09.2018.
//  Copyright © 2018 Tony Swan. All rights reserved.
//

import Foundation
import GameplayKit

enum Sign: String {
    case rock = "👊"
    case paper = "✋"
    case scissors = "✌️"
}

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

