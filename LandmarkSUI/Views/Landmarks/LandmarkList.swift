//
//  LandmarkList.swift
//  LandmarkSUI
//
//  Created by Виталий Гринчик on 22.09.23.
//

import SwiftUI

struct LandmarkList: View {
    // Все экземпляры класса ModelData отслеживаются на изменение св-в
    // отмеченнных как @Published
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    private var landmarksToShow: [Landmark] {
        showFavoritesOnly
        ? modelData.favorites
        : modelData.landmarks
    }
    
    var body: some View {
        NavigationStack {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(landmarksToShow) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }

            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
