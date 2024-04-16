//
//  SavedView.swift
//  PetAPIDemo
//
//  Created by Ben Chesser on 4/15/24.
//

import SwiftUI
import SwiftData

struct SavedView: View {
    @Environment(\.modelContext) var context
    @Query var items: [AnimalDataItem]
    var body: some View {
        List {
            ForEach (items) { animal in
                Text(animal.pet.attributes.name ?? "Noah")
            }
        }
    }
}

#Preview {
    SavedView()
}
