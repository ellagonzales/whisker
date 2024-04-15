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
                Image("whisker-bg2")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                ForEach(vm.pets, id: \.self) { pet in
                    CardView(vm: PetCardViewModel(pet: pet))
                }
            }
        }
    }
}

#Preview {
    SwipeView(vm: PetViewModel())
}
