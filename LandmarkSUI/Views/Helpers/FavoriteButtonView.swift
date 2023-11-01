//
//  FavoriteButtonView.swift
//  LandmarkSUI
//
//  Created by Виталий Гринчик on 22.09.23.
//

import SwiftUI

struct FavoriteButtonView: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label(
                "Toggle Favorites",
                systemImage: isSet ? "star.fill" : "star"
            )
            .labelStyle(.iconOnly)
            .foregroundColor(isSet ? .yellow : .gray)
            .scaleEffect(1.5)
        }

    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonView(isSet: .constant(true))
    }
}
