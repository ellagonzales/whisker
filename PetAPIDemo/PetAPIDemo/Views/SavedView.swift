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
            ForEach (items.reversed()) { animal in
                NavigationLink {
                    SavedCardView(vm: PetCardViewModel(pet: animal))
                } label: {
                    Text(animal.name ?? "Noah")
                }
                .swipeActions() {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        context.delete(animal)
                      }
                }
            }
        }
    }
}



#Preview {
    SavedView()
}
