//
//  ContentView.swift
//  LandmarkSUI
//
//  Created by Виталий Гринчик on 21.09.23.
//

import SwiftUI

struct ContentView: View {
    
    enum Tab {
        case featured
        case list
    }

    @EnvironmentObject var modelData: ModelData
    @State private var selection: Tab = .featured
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .badge(modelData.favoriteCount)
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
