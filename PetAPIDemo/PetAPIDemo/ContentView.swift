//
//  ContentView.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var service = PetService()
    
    var body: some View {
        VStack {
            Text("Fetch API")
            Button {
                Task {
                    do {
                        let pets = try await PetService.fetchPets()
                        print(pets)
                    } catch {
                        print("Error fetching pets: \(error)")
                    }
                }
            } label: {
                Image(systemName: "circle.fill")
                    .font(.largeTitle)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
