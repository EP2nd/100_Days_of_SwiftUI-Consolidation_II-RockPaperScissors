//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Edwin Przeźwiecki Jr. on 26/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    private var shapes = ["🪨", "🧻", "✂️"]
    
    @State private var confrontingShape = Int.random(in: 0 ..< 3)
    @State private var winOrLose = Bool.random()
    
    @State private var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(stops: [
                .init(color: .black, location: 0),
                .init(color: .white, location: 0.7),
                .init(color: .red, location: 1)
            ], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing: 50) {
                Spacer()
                Spacer()
                Text("Rock-Paper-Scissors")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .padding()
                Text("Your score: \(score)")
                    .font(.subheadline.weight(.heavy))
                    .foregroundColor(.red)
                Text("\(shapes[confrontingShape])")
                    .font(.system(size: 200))
                Text("\(winOrLose ? "- Win!" : "- Lose!")")
                    .italic()
                    .bold()
                Spacer()
                HStack {
                    ForEach(0..<3) { emoji in
                        Button {
                            shapeTapped(emoji)
                        } label: {
                            Text("\(shapes[emoji])")
                                .font(.system(size: 100))
                        }
                    }
                }
                Spacer()
                Spacer()
            }
        }
    }

    func shapeTapped(_ emoji: Int) {
        let rock = "🪨"
        let paper = "🧻"
        let scissors = "✂️"
        
        switch confrontingShape {
        case 0:
            if shapes[emoji] == paper {
                winOrLose ? (score += 1) : (score -= 1)
            } else if shapes[emoji] == scissors {
                winOrLose ? (score -= 1) : (score += 1)
            } else {
                confrontingShape = Int.random(in: 0 ..< 3)
            }
        case 1:
            if shapes[emoji] == rock {
                winOrLose ? (score -= 1) : (score += 1)
            } else if shapes[emoji] == scissors {
                winOrLose ? (score += 1) : (score -= 1)
            } else {
                confrontingShape = Int.random(in: 0 ..< 3)
            }
        case 2:
            if shapes[emoji] == rock {
                winOrLose ? (score += 1) : (score -= 1)
            } else if shapes[emoji] == paper {
                winOrLose ? (score -= 1) : (score += 1)
            } else {
                confrontingShape = Int.random(in: 0 ..< 3)
            }
        default:
            return
        }
        
        winOrLose.toggle()
        confrontingShape = Int.random(in: 0 ..< 3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
