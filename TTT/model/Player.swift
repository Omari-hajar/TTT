//
//  Player.swift
//  TTT
//
//  Created by Hajar Alomari on 06/12/2021.
//

import UIKit


class Player {
    
    var name: String
    var score: Int
    var playerMoves: [Int]
    
    init(name: String, score: Int, playerMoves: [Int]){
        self.name = name
        self.score = score
        self.playerMoves = playerMoves
    }
}

