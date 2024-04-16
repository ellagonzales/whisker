//
//  ContentView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = PetViewModel()
    @State private var showingSavedView = false

    var body: some View {
        switch vm.state {
        case .idle:
            IdleView(vm: vm)
        case .loading:
            LoadingView()
        case .working:
            NavigationStack {
                SwipeView(vm: vm)

                //            LazyHStack {
                //                <#code#>
                //            }
                //            .scrollTransition(transition: T##(EmptyVisualEffect, ScrollTransitionPhase) -> VisualEffect)
            }
        }
    }
}

#Preview {
    ContentView()
}
