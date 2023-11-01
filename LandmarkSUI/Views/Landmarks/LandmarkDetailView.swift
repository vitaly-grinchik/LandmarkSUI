//
//  LandmarkDetailView.swift
//  LandmarkSUI
//
//  Created by Виталий Гринчик on 22.09.23.
//

import SwiftUI

struct LandmarkDetailView: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id }) ?? 0
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)
            
            CircleImageView(image: Image(landmark.imageName))
                .offset(y: -135)
                .padding(.bottom, -140)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    Spacer()
                    FavoriteButtonView(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                VStack(alignment: .leading) {
                    Text(landmark.park)
                    Text(landmark.state)
                }
                .font(.subheadline)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title3)
                    .fontDesign(.monospaced)
                Text(landmark.description)
                
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(landmark: ModelData().landmarks[3])
            .environmentObject(ModelData())
    }
}
