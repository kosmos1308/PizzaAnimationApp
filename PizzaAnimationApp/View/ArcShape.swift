//
//  ArcShape.swift
//  PizzaAnimationApp
//
//  Created by pavel on 25.09.22.
//

import SwiftUI

// Arc shape arrows for swipe direction
struct ArcShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let midWidth = rect.width / 2
            let width = rect.width
            path.move(to: .zero)
            path.addCurve(to: CGPoint(x: width, y: 0),
                          control1: CGPoint(x: midWidth, y: -80),
                          control2: CGPoint(x: midWidth, y: -80))
        }
    }
}

struct ArcShape_Previews: PreviewProvider {
    static var previews: some View {
        ArcShape()
    }
}
