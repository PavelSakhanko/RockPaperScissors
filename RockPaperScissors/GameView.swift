//
//  GameView.swift
//  RockPaperScissors
//
//  Created by Pavel Sakhanko on 3.12.20.
//

import SwiftUI

struct GameView: View {

    let possibleMoves = ["Rock", "Paper", "Scissors"]
    let possibleResults = ["Win", "Lose"]

    @State private var currentChoice = 0
    @State private var gameResult = ["Win", "Lose"].randomElement()!

    @State private var gameScore = 0
    @State private var gameRoundCounter = 0

    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    HStack {
                        Text("Score: ")
                        Text("\(gameScore)")
                    }
                    .font(.system(size: 30))
                    
                    Text("Rounds Left: \(10 - gameRoundCounter)")
                    Text(gameRoundCounter == 0 ? "New Game !" : "")
                }
                .foregroundColor(.white)

                Spacer()
                Image(possibleMoves[currentChoice])
                Spacer()

                Text("Your Must \(gameResult)")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                
                Spacer()
                HStack {
                    ForEach(0...2, id: \.self) { buttonId in
                        Button(action: {
                            pressButton(id: buttonId)
                            _ = imageStringName()
                        }) {
                            Image(possibleMoves[buttonId])
                        }.tag(buttonId)
                        
                        
                    }
                }
                Spacer()
            }
        }
    }
    
    func imageStringName() -> String {
        let imageNumber = possibleMoves.randomElement()!

        for (index, value) in possibleMoves.enumerated() {
            if value == imageNumber {
                currentChoice = index
            }
        }

        return imageNumber
    }

    private func pressButton(id: Int) {
        gameRoundCounter += 1
        gameResult = possibleResults.randomElement()!

        if gameRoundCounter == 10 {
            gameRoundCounter = 0
        }
    }
}
