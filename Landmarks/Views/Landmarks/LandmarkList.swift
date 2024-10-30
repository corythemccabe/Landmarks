//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Cory McCabe on 10/29/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            VStack {
                // Sticky Toggle
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Only Favorites")
                        .foregroundStyle(.cyan)
                        .toggleStyle(SwitchToggleStyle(tint: Color.yellow))
                }
                .padding(.horizontal, 20)
                
                // Scrollable List
                List {
                    ForEach (filteredLandmarks) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
                .animation(.default, value: filteredLandmarks)
            }
            .navigationBarTitle("Landmarks")
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
