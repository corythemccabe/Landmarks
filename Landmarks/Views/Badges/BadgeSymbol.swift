//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by Cory McCabe on 10/30/24.
//

import SwiftUI

struct BadgeSymbol: View {
    static let symbolColor = Color(red: 180.0 / 200, green: 50.0 / 50, blue: 10.0 / 20)
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width * 0.5
                let topWidth = width * 0.226
                let topHeight = height * 0.488
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                   path.addLines([
                       CGPoint(x: middle - topWidth, y: topHeight + spacing),
                       CGPoint(x: spacing, y: height - spacing),
                       CGPoint(x: width - spacing, y: height - spacing),
                       CGPoint(x: middle + topWidth, y: topHeight + spacing),
                       CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                   ])
            }
            .fill(BadgeSymbol.symbolColor)
        }
    }
}

#Preview {
    BadgeSymbol()
}
