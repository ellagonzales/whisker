//
//  PetViewModel.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/10/24.
//

import Foundation
import UIKit

@MainActor
class PetViewModel: ObservableObject {
    @Published var pets: [Animal] = []
    @Published var included: [Included] = []
    @Published var state: loadingState = .idle
    
    enum loadingState {
        case idle
        case loading
        case working
    }
    
    func fetchPets() async throws {
        state = .loading
        let data = try await PetService.fetchPets()
        pets = data.data
        included = data.included
        state = .working
    }
}
