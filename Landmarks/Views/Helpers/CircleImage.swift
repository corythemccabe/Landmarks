//
//  CircleImage.swift
//  Landmarks
//
//  Created by Cory McCabe on 10/29/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 5)
            }
            .shadow(radius: 8, x: 6, y: 8)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
