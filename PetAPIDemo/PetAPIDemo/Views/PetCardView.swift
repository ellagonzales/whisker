//
//  PetCardView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/10/24.
//

import SwiftUI

struct PetCardView: View {
    var pet: Pet
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(pet.name)
                    .fontWeight(.semibold)
                Text(pet.sex)
                    .foregroundStyle(.secondary)
                Spacer()
                Text(pet.breedPrimary)
                    .foregroundStyle(.secondary)
            }
            .padding(.vertical, 5)
            Text(pet.descriptionText)
        } .padding()
    }
}

#Preview {
    PetCardView(pet: Pet.example)
}
