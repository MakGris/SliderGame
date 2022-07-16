//
//  UIKitSlider.swift
//  SliderGame
//
//  Created by Maksim Grischenko on 15.07.2022.
//

import SwiftUI

struct UIKitSlider: UIViewRepresentable {
    
    @Binding var currentValue: Double
    @Binding var score: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.value = Float(currentValue)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.moveSlider),
            for: .allTouchEvents
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = UIColor(
            red: 255,
            green: 0,
            blue: 0,
            alpha: CGFloat(score) * 0.01)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
}

extension UIKitSlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func moveSlider(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct UIKitSlider_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSlider(currentValue: .constant(100), score: .constant(50))
    }
}
