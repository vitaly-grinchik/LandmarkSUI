//
//  LandmarkListView.swift
//  LandmarkSUI
//
//  Created by Виталий Гринчик on 22.09.23.
//

import SwiftUI

struct LandmarkListView: View {
    // Все экземпляры класса ModelData отслеживаются на изменение св-в
    // отмеченнных как @Published
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    private var listToShow: [Landmark] {
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
                
                ForEach(listToShow) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)
                    } label: {
                        LandmarkRowView(landmark: landmark)
                    }
                }

            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
            .environmentObject(ModelData())
    }
}
