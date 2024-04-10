//
//  PetViewModel.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/10/24.
//

import Foundation

class PetViewModel: ObservableObject {
    @Published var pets: [Pet] = []
    @Published var state: loadingState = .idle
    
    enum loadingState {
        case idle
        case loading
        case working
    }
    
    func fetchPets() async throws {
        state = .loading
        let result = try await PetService.fetchPets()
        for animal in result.data {
            if qualityCheck(animal: animal) {
                pets.append(constructPet(animal: animal))
            }
        }
        print(pets)
        state = .working
    }
    
    func qualityCheck(animal: Animal) -> Bool {
        // ensures bare minimum attributes
        return animal.attributes.pictureThumbnailUrl != nil
        // might add more later tbd
    }
    
    func constructPet(animal: Animal) -> Pet {
        return Pet(
            ageGroup: animal.attributes.name ?? "Unknown",
            ageString: animal.attributes.ageString ?? "Unknown",
            birthDate: animal.attributes.birthDate ?? "Unknown",
            breedPrimary: animal.attributes.breedPrimary ?? "Unknown",
            breedSecondary: animal.attributes.breedSecondary ?? "Unknown",
            colorDetails: animal.attributes.colorDetails ?? "N/A",
            descriptionText: animal.attributes.descriptionText ?? "No description text provided",
            name: animal.attributes.name ?? "Fido",
            pictureThumbnailUrl: animal.attributes.pictureThumbnailUrl!,
            sex: animal.attributes.sex ?? "Unknown",
            sizeUOM: animal.attributes.sizeUOM ?? "Unknown",
            createdDate: animal.attributes.createdDate ?? "Unknown",
            updatedDate: animal.attributes.updatedDate ?? "Unknown")
    }
}
