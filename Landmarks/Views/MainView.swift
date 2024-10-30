//
//  MainView.swift
//  Landmarks
//
//  Created by Cory McCabe on 10/29/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    MainView()
        .environment(ModelData())
}
