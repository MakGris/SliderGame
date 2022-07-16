//
//  ButtonView.swift
//  SliderGame
//
//  Created by Maksim Grischenko on 15.07.2022.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Проверь меня!") {
            
        }
    }
}
