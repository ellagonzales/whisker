//
//  SwipeView.swift
//  PetAPIDemo
//
//  Created by Ben Chesser on 4/10/24.
//

import SwiftUI

struct SwipeView: View {
    @StateObject var vm: PetViewModel
    
    var body: some View {
        VStack {
            ZStack {
                Image("whisker-bg")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                ForEach(vm.pets, id: \.self) { pet in
                    let index = vm.pets.firstIndex(of: pet)
                    CardView(vm: PetCardViewModel(pet: pet, included: vm.included[index!]))
                }
            }
        }
    }
}

#Preview {
    SwipeView(vm: PetViewModel())
}
