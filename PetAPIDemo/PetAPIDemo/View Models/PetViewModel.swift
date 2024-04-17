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
    @Published var miles: Int = 25 
    @Published var postal: Int = 27707 // autopopulate based on user location
    
    enum loadingState {
        case idle
        case loading
        case working
    }
    
    func fetchPets() async throws {
        state = .loading
        let data = try await PetService.fetchPets(miles: miles, postal: postal)
        pets = data.data
        included = data.included
        state = .working
    }
}
