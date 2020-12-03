//
//  GameView.swift
//  RockPaperScissors
//
//  Created by Pavel Sakhanko on 3.12.20.
//

import SwiftUI

struct GameView: View {

    let possibleMoves = ["Rock", "Paper", "Scissors"]
    let possibleGameResult = ["Win", "Lose"]

    @State private var currentChoice = ""
    @State private var gameResult = ""
    @State private var gameScore = 0

    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Score: ")
                    Text("\(gameScore)")
                }
                .foregroundColor(.white)
                .font(.system(size: 30))
                
                Spacer()
                
                Image(possibleMoves.randomElement()!)
                    
                
                Spacer()
                
                Text("Your Must \(possibleGameResult.randomElement()!)")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                
                Spacer()
                
                HStack {
                    Button(action: {
                        print("Edit button was tapped")
                    }) {
                        Image(possibleMoves[0])
                    }
                    
                    Button(action: {
                        print("Edit button was tapped")
                    }) {
                        Image(possibleMoves[1])
                    }
                    
                    Button(action: {
                        print("Edit button was tapped")
                    }) {
                        Image(possibleMoves[2])
                    }
                }
                Spacer()
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
