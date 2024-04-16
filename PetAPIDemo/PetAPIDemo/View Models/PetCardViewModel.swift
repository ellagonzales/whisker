//
//  PetCardViewModel.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/12/24.
//

import Foundation
import UIKit

class PetCardViewModel: ObservableObject {
    @Published var pet: Animal
    
    init(pet: Animal) {
        self.pet = pet
    }
    
    func getName() -> String {
        return pet.attributes.name ?? "Unknown"
    }
    
    func getImage() throws -> UIImage {
        guard let url = URL(string: pet.attributes.pictureThumbnailUrl!) else {
            print("URL failed")
            throw NSError()
        }
        
        let data = try Data(contentsOf: url) // threads error. Synchronous URL loading
        
        guard let image = UIImage(data: data) else {
            print("Image failed")
            throw NSError()
        }
         return image
    }
    
    func getSex() -> String {
        return pet.attributes.sex ?? "Unknown"
    }
    
    func getAge() -> String {
        return pet.attributes.ageString ?? "Unknown"
    }
    
    func getAgeGroup() -> String {
        return pet.attributes.ageGroup ?? "Unknown"
    }
    
    func getColorDetails() -> String {
        return pet.attributes.colorDetails ?? "Unknown"
    }
    
    func getDescription() -> String {
        return pet.attributes.descriptionText ?? "Unknown"
    }
    
    func getPrimaryBreed() -> String {
        return pet.attributes.breedPrimary ?? "Unknown"
    }
    
    func getSecondaryBreed() -> String {
        return pet.attributes.breedSecondary ?? ""
    }
    
    func getAnimal() -> Animal {
        return pet
    }
    
}
