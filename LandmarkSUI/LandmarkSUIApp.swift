//
//  LandmarkSUIApp.swift
//  LandmarkSUI
//
//  Created by Виталий Гринчик on 21.09.23.
//

import SwiftUI

@main
struct LandmarkSUIApp: App {
    // ViewModel
    // Создаем "синглтон" - единственный объект класса ModelData в среде,
    // изменения свойства которого отслеживаются и все дочерние представления,
    // завязанные под этот объект при его изменении автоматически обновляются
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // передаем объект дальше в иерархию связанных представлений для
            // использования там, где понадобиться (не обязательно во всех)
                .environmentObject(modelData)
        }
    }
}
