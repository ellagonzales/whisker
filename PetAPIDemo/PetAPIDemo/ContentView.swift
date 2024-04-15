//
//  ContentView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = PetViewModel()
    var body: some View {
        switch vm.state {
        case .idle:
            IdleView(vm: vm)
        case .loading:
            LoadingView()
        case .working:
            SwipeView(vm: vm)
        }
    }
}

#Preview {
    ContentView()
}
