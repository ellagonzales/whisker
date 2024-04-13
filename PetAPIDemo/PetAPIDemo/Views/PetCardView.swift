//
//  PetCardView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/10/24.
//

import SwiftUI

struct PetCardView: View {
    @StateObject var vm: PetCardViewModel
    @State var isHidden = true
    
    var body: some View {
        VStack{
                if let image = try? vm.getImage() {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                } else {
                    Text("No image available")
                }

            VStack(alignment: .leading) {
                HStack {
                    Text(vm.getName())
                        .fontWeight(.semibold)
                    Text(vm.getSex())
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(vm.getPrimaryBreed())
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
                    Text(vm.getDescription())
                }
            } .padding()
        }
    }
}

#Preview {
    PetCardView(vm: PetCardViewModel(pet: Animal.example))
}
