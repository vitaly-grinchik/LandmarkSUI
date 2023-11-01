//
//  LandmarkRow.swift
//  LandmarkSUI
//
//  Created by Виталий Гринчик on 21.09.23.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            Image(landmark.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {    
    static var previews: some View {
        LandmarkRow(landmark: ModelData().landmarks[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
