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
    @Published var included: Included
    
    init(pet: Animal, included: Included) {
        self.pet = pet
        self.included = included
    }
    
    func getName() -> String {
        return pet.attributes.name ?? "Unknown"
    }
    
    func getImage() throws -> UIImage? {
        guard let url = URL(string: pet.attributes.pictureThumbnailUrl!) else {
            print("URL failed")
            throw NSError()
        }
        // https://cdn.rescuegroups.org/9101/pictures/animals/20291/20291274/98029625.jpg?width=100
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
    
    func getCity() -> String {
        return included.attributes.city ?? "Unknown"
    }
    
    func getState() -> String {
        return included.attributes.state ?? "Unknown"
    }
    
    func getPhone() -> String {
        return included.attributes.phone ?? "Unknown"
    }
    
    func getEmail() -> String {
        return included.attributes.email ?? "Unknown"
    }
    
}
