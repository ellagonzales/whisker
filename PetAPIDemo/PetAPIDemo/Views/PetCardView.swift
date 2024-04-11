//
//  PetCardView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/10/24.
//

import SwiftUI

struct PetCardView: View {
    var pet: Pet
    @State var isHidden = true
    
    var body: some View {
        VStack{
            
            if let image = pet.pictureThumbnailUrl {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
            } else {
                Text("No image available")
            }
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
                Button {
                    isHidden.toggle()
                } label: {
                    HStack{
                        Text("Description")
                        Image(systemName: isHidden ? "chevron.right" : "chevron.down")
                            .animation(.smooth)
                    }
                }
                if !isHidden {
                    Text(pet.descriptionText)
                }
            } .padding()
        }
    }
}

#Preview {
    PetCardView(pet: Pet.example)
}
