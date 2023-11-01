//
//  ProfileHost.swift
//  LandmarkSUI
//
//  Created by Виталий Гринчик on 28.09.23.
//

import SwiftUI

struct ProfileHost: View {
    // SwiftUI provides storage in the environment for values you can access using the @Environment property wrapper.
    
    // Переменная editMode отражает текущее значение режима, в котором
    // находиться представление: в режиме редактирования либо нет
    // Значение берётся из среды по ключу .editMode
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                // Конопка включает илбо выключает режим редактирования
                // меняя значение переменной среды .editMode
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
