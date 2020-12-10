//
//  GameView.swift
//  RockPaperScissors
//
//  Created by Pavel Sakhanko on 3.12.20.
//

import SwiftUI

enum PossibleResults: String, CaseIterable {
    case win = "Win"
    case lose = "Lose"
}

struct GameView: View {

    let possibleMoves = ["Rock", "Paper", "Scissors"]

    @State private var currentChoiceIndex = ""
    @State private var gameResult = ""
    @State private var gameScore = 0
    @State private var gameRoundCounter = 0
    @State private var roundsLeft = ""

    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 70) {
                VStack {
                    Text("Score: \(gameScore)")
                    Text(gameRoundCounter == 0 || roundsLeft == "0" ? "New Game !" : "Rounds Left: \(11 - gameRoundCounter)")
                    Spacer()

                    VStack(spacing: 20) {
                        showImage()
                        
                        Button(action: {
                            startGame()
                        }) {
                            Text(gameRoundCounter == 0 || roundsLeft == "0" ? "Start Game ! " : "Your Must \(gameResult)")
                        }
                    }
                    Spacer()
                }
                .font(.system(size: 30))

                HStack {
                    ForEach(0...2, id: \.self) { buttonId in
                        Button(action: {
                            pressButton(id: buttonId)
                        }) {
                            Image(possibleMoves[buttonId])
                        }.tag(buttonId)
                    }
                }
                Spacer()
            }
        }
        .foregroundColor(.white)
    }

    private func showImage() -> some View {
        gameRoundCounter == 0 || roundsLeft == "0" ? Image(systemName: "play") : Image(possibleMoves[Int(currentChoiceIndex)!])
    }

    private func pressButton(id: Int) {
        updateScore(id: id)
        startGame()
    }
    
    private func updateScore(id: Int) {
        guard let index = Int(currentChoiceIndex) else { return }
        switch gameResult {
        case PossibleResults.win.rawValue:
            if id > index || id < index && id == 0 && index == 2 {
                gameScore += 1
            } else {
                gameScore -= 1
            }
        case PossibleResults.lose.rawValue:
            if id < index || id > index && id == 2 && index == 0 {
                gameScore += 1
            } else {
                gameScore -= 1
            }
        default:
            break
        }
    }
    
    private func startGame() {
        gameResult = PossibleResults.allCases.randomElement()!.rawValue
        randomHandForGame()
        getRandomImageIndex()
        gameRoundCounter += 1
        roundsLeft = String(11 - gameRoundCounter)
    }

    private func randomHandForGame() {
        let imageNumber = possibleMoves.randomElement()!

        for (index, value) in possibleMoves.enumerated() {
            if value == imageNumber {
                currentChoiceIndex = String(index)
            }
        }
    }
    
    private func getRandomImageIndex() {
        if currentChoiceIndex != "" {
            guard let index = Int(currentChoiceIndex) else { return }
            currentChoiceIndex = "\(index)"
        }
    }
}
