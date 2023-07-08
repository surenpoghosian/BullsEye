//
//  GameLogic.swift
//  Bulls Eye
//
//  Created by Suren Poghosyan on 08.07.23.
//

import Foundation


public struct Game {
    var gameRound: Int;
    var score: Int;
    var numberToGuess: Int?;
    var choosenNumber: Int?;

    
    init(numberToGuess: Int? = nil, choosenNumber: Int? = nil) {
        self.gameRound = 0
        self.score = 0
        self.numberToGuess = numberToGuess
        self.choosenNumber = choosenNumber
        
        self.newGame()
    }
    
    private mutating func incrementGameRound(){
        self.gameRound += 1
    }
    
    private mutating func generateNumberForGuess(){
        self.numberToGuess = Int.random(in: 1...100)
    }
    
    mutating func checkAnswer() -> String {
        return calculateAndUpdateScore()
    }
    
    mutating func newGame(){
            self.generateNumberForGuess()
            self.incrementGameRound()
    }
    
    
    mutating func calculateAndUpdateScore() -> String {
        guard let numberToGuess = numberToGuess, let choosenNumber = choosenNumber else { return "Oops!" }
        let difference = abs(Int(numberToGuess - choosenNumber))
        switch difference {
            case 0:
                updateScore(scoreToAdd: 10)
                return "You Goddamn Right \n +10 points"
            case 1...5:
                updateScore(scoreToAdd: 3)
                return "That was close \n +3 points"
            case 5...10:
                updateScore(scoreToAdd: 1)
                return "Aim better \n +1 point for trying"
            default:
                return "Not even close"
        }
    }
    
    mutating func updateScore(scoreToAdd: Int){
        self.choosenNumber = nil
        self.score += scoreToAdd
    }
    
}
