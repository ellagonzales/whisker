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
        TabView {
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
            .tabItem {
                Label("Swipe", systemImage: "arrowshape.turn.up.forward")
            }
            .toolbarBackground(.visible, for: .tabBar)
            SavedView()
                .tabItem {
                    Label("Saved", systemImage: "tray.full.fill" )
                        .padding(.top)
                }
                .toolbarBackground(.visible, for: .tabBar)
        }

//        NavigationLink {
//            SavedView()
//        } label: {
//            Text("Checked Saved")
//        }
    }
}

#Preview {
    NavigationStack {
        SwipeView(vm: PetViewModel())
    }
}
