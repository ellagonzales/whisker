//
//  IdleView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/10/24.
//

import SwiftUI

struct IdleView: View {
    @ObservedObject var vm: PetViewModel
    
    var body: some View {
        Button {
            Task {
                try await vm.fetchPets()
            }
        } label: {
            VStack{
                Text("Locate Pets")
                Image(systemName: "pawprint.circle")
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    IdleView(vm: PetViewModel())
}
