//
//  ProfileSummary.swift
//  LandmarkSUI
//
//  Created by Виталий Гринчик on 28.09.23.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)

                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                ScrollView(.horizontal) {
                    HStack {
                        HikeBadge(name: "Kum")
                        HikeBadge(name: "Knot")
                            .hueRotation(Angle(degrees: 90))
                        HikeBadge(name: "Sunny")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                    .padding(.bottom)
                }
                
                Divider()

                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)

                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
