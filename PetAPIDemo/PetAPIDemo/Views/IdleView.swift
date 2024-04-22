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
    @State private var showingMoreInfo: Bool = false
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
                    .frame(width: 200, height: 200)
                
                Text("Click to Explore Pet Profiles!")
                    .font(.title2)
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.primary)
                Button {
                    withAnimation {
                        showingMoreInfo.toggle()
                    }
                } label: {
                    HStack {
                        Text("Add Filters")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .bold()
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 30)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.pink, .yellow1]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(30)
                }
                .padding()
            }
            .sheet(isPresented: $showingMoreInfo) {
                FilterView(showingMoreInfo: $showingMoreInfo, vm: vm)
            }
        }
    }
}


#Preview {
    IdleView(vm: PetViewModel())
}
