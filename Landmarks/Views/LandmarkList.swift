//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Cory McCabe on 10/29/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly: Bool = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle("Only Favorites", isOn: $showFavoritesOnly)
                    .foregroundStyle(.cyan)
                    .toggleStyle(SwitchToggleStyle(tint: Color.yellow))
                ForEach (filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
