//
//  ContentView.swift
//  SliderGame
//
//  Created by Maksim Grischenko on 15.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 50.0
    @State private var alertPresented = false
    @State private var targetValue = Int.random(in: 0...100)
    @State private var score = 0
   
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                .padding(.bottom, 20)
            HStack {
                Text("0")
                    .padding(.leading, 16)
                UIKitSlider(currentValue: $currentValue, score: $score)
                    .onAppear {
                        score = computeScore()
                    }
                    .onChange(of: currentValue) { _ in
                        score = computeScore()
                    }
                Text("100")
                    .padding(.trailing, 16)
            }
            
            ButtonView(title: "Проверь меня!") {
                alertPresented.toggle()
            }.alert("Your Score", isPresented: $alertPresented, actions: {}) {
                Text("\(score)")
            }
            .padding()
            
            ButtonView(title: "Начать заново") {
                targetValue = Int.random(in: 0...100)
                score = computeScore()
            }
        }
    }
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
