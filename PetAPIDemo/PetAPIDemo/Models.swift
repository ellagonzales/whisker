import Foundation
import UIKit

// Response structs

struct AnimalData: Codable {
    let data: [Animal]
    let included: [Included]
}

struct Animal: Codable, Hashable {
    let attributes: AnimalAttributes
    
    static var example: Animal {
        let attributes = AnimalAttributes(
            ageGroup: "Young",
            ageString: "1",
            birthDate: "February 1",
            breedPrimary: "Bulldog",
            breedSecondary: "Poodle",
            colorDetails: "Brown and white",
            descriptionText: "Looks like my cousin's ugly dog. Has a good heart though.",
            name: "Monster",
            pictureThumbnailUrl: "https://cdn.rescuegroups.org/16/pictures/animals/100/100000/175990.jpg?width=100",
            sex: "Male",
            sizeUOM: "Pounds",
            createdDate: "2008",
            updatedDate: "2010")
        
        return Animal(attributes: attributes)
    }
}

struct AnimalAttributes: Codable, Hashable {
    let ageGroup: String?
    let ageString: String?
    let birthDate: String?
    let breedPrimary: String?
    let breedSecondary: String?
    let colorDetails: String?
    let descriptionText: String?
    let name: String?
    let pictureThumbnailUrl: String?
    let sex: String?
    let sizeUOM: String?
    let createdDate, updatedDate: String?
    // Add more attributes as needed
}

struct Included: Codable, Hashable {
//    let type: String
//    let id: String
    let attributes: IncludedAttributes
}

struct IncludedAttributes: Codable, Hashable {
//        let name: String?
//        let singular: String?
//        let plural: String?
//        let youngSingular: String?
//        let youngPlural: String?
//        let description: String?
//        let street: String?
//        let phone: String?
//        let lat: Double?
//        let lon: Double?
//        let coordinates: String?
    let city: String?
    let state: String?
//        let postalcode: String?
//        let country: String?
//        let email: String?
//        let url: String?
//        let services: String?
//        let `type`: String?
//        let citystate: String?
}
