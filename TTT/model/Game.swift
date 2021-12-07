//
//  Game.swift
//  TTT
//
//  Created by Hajar Alomari on 06/12/2021.
//

import UIKit

struct Game {
    
    var xPlayer = Player(name: "X", score: 0, playerMoves: [])
    var oPlayer = Player(name: "O", score: 0, playerMoves: [])
    
    var currentPlayer = "X"
  
    var winningPositions: [String: [Int]] = ["A1": [0,1,2], "A2": [3,4,5], "A3": [6,7,8], "B1": [0, 3, 6], "B2": [1,4,7], "B3": [2,5,8], "C1": [0,4,8], "C2": [2,4,6]]
    
    mutating func play(index: Int) -> String{
        if currentPlayer == xPlayer.name {
            xPlayer.playerMoves.append(index)
            print(xPlayer.playerMoves)
            currentPlayer = oPlayer.name
            return xPlayer.name
            
        } else{
            oPlayer.playerMoves.append(index)
            currentPlayer = xPlayer.name
            return oPlayer.name
        }
    }
    
    
    func checkWinner() -> Bool {
        for position in winningPositions{
            let winSet = NSSet(array: position.value)
            let playerXSet = NSSet(array: xPlayer.playerMoves)
            let playerOSet = NSSet(array: oPlayer.playerMoves)
            if winSet.isSubset(of: playerXSet as! Set<AnyHashable>){
                xPlayer.score += 1
                print("X wins")
                return true
            } else if winSet.isSubset(of: playerOSet as! Set<AnyHashable>){
                oPlayer.score += 1
                print("O Wins")
                return true
            }
        }
        return false
    }
    
    mutating func resetGame() {
        xPlayer.playerMoves = []
        oPlayer.playerMoves = []
    }
}
