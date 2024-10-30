//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Cory McCabe on 10/29/24.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            MapView(coordinates: landmark.locationCoordinates)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -120)
                .padding(.bottom, -120)
            VStack (alignment: .leading) {
                Text(landmark.name)
                    .font(.largeTitle)
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                    .padding(5)
                
                Text("About \(landmark.name)")
                    .font(.title2)
                    .padding(.bottom, 5)
                Text(landmark.description)
            }
            .padding()
            Spacer()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[5])
}
