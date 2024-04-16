//
//  PetAPIDemoApp.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/2/24.
//

import SwiftUI
import SwiftData

@main
struct PetAPIDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: AnimalDataItem.self)
    }
}
