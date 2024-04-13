//
//  SwipeView.swift
//  PetAPIDemo
//
//  Created by Ben Chesser on 4/10/24.
//

import SwiftUI

struct SwipeView: View {
    private var pets: [Pet] = [Pet.example, Pet.example, Pet.example, Pet.example, Pet.example, Pet.example, ].reversed()
    
    var body: some View {
        VStack {
            ZStack {
                Image("whisker-bg")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                ForEach(pets) { pet_item in
                    CardView(pet: Pet.example)
                }
            }
        }
    }
}

#Preview {
    SwipeView()
}
