//
//  PetListView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/10/24.
//

import SwiftUI

struct PetListView: View {
    @ObservedObject var vm: PetViewModel
    
    var body: some View {
        NavigationStack {
            // List of pet card views
            List(vm.pets, id: \.self) { pet in
                PetCardView(vm: PetCardViewModel(pet: pet))
            }
        }
    }
}

#Preview {
    PetListView(vm: PetViewModel())
}
