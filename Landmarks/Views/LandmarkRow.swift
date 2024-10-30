//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Cory McCabe on 10/29/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                landmark.image
                    .resizable()
                    .frame(width: 50, height: 50)
                Text(landmark.name)
                
                Spacer()
                
                if landmark.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }
            }
        }
    }
}

#Preview {
    LandmarkRow(landmark: ModelData().landmarks[0])
}
