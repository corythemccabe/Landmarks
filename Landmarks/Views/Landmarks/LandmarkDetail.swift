//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Cory McCabe on 10/29/24.
//

import SwiftUI


struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark


    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }


    var body: some View {
        @Bindable var modelData = modelData


        ScrollView {
            MapView(coordinates: landmark.locationCoordinates)
                .frame(height: 300)


            CircleImage(image: landmark.image)
                .offset(y: -120)
                .padding(.bottom, -120)
            VStack (alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.largeTitle)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
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
    let modelData = ModelData()
        return LandmarkDetail(landmark: modelData.landmarks[0])
            .environment(modelData)
}