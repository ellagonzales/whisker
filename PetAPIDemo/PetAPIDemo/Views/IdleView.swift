//
//  IdleView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/10/24.
//

import SwiftUI

struct IdleView: View {
    @ObservedObject var vm: PetViewModel
    @State private var isAnimating = false
    
    var body: some View {
        Button(action: {
            Task {
                try await vm.fetchPets()
            }
        }) {
            VStack {
                Image("WhiskerLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(isAnimating ? 1.0 : 0.8)
                    .animation(
                        .easeInOut(duration: 0.5).repeatForever(autoreverses: true),
                        value: isAnimating
                    )
                    .onAppear {
                        isAnimating = true
                    }
                    .frame(width: 400, height: 400)
                
                Text("Click Here to Explore Pet Profiles!")
                    .font(.title2)
                    .padding(.top, 20)
                    .foregroundColor(Color.primary)
            }
        }
    }
}


#Preview {
    IdleView(vm: PetViewModel())
}
