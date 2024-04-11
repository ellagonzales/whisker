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
                await pets.append(try constructPet(animal: animal))
            }
        }
        state = .working
    }
    
    func qualityCheck(animal: Animal) -> Bool {
        // ensures bare minimum attributes
        return animal.attributes.pictureThumbnailUrl != nil
        // might add more later tbd
    }
    
    func constructPet(animal: Animal) async throws -> Pet {
        // maybe move this stuff to service? idkkkk 
        guard let url = URL(string: animal.attributes.pictureThumbnailUrl!) else {
            print("URL failed")
            throw NSError()
        }
        
        do {
            let data = try Data(contentsOf: url) // getting a thread error here because using sync instead of async. Fix how?
            let image = UIImage(data: data)
            
            return Pet(
                ageGroup: animal.attributes.name ?? "Unknown",
                ageString: animal.attributes.ageString ?? "Unknown",
                birthDate: animal.attributes.birthDate ?? "Unknown",
                breedPrimary: animal.attributes.breedPrimary ?? "Unknown",
                breedSecondary: animal.attributes.breedSecondary ?? "Unknown",
                colorDetails: animal.attributes.colorDetails ?? "N/A",
                descriptionText: animal.attributes.descriptionText ?? "No description text provided",
                name: animal.attributes.name ?? "Fido",
                pictureThumbnailUrl: image,
                sex: animal.attributes.sex ?? "Unknown",
                sizeUOM: animal.attributes.sizeUOM ?? "Unknown",
                createdDate: animal.attributes.createdDate ?? "Unknown",
                updatedDate: animal.attributes.updatedDate ?? "Unknown")
        } catch {
            print("Data failed")
        }
        return Pet(
            ageGroup: "Failed",
            ageString: "Failed",
            birthDate: "Failed",
            breedPrimary: "Failed",
            breedSecondary: "Failed",
            colorDetails: "Failed",
            descriptionText: "Failed",
            name: "Failed",
            pictureThumbnailUrl: nil,
            sex: "Failed",
            sizeUOM: "Failed",
            createdDate: "Failed",
            updatedDate: "Failed")
    }
}
