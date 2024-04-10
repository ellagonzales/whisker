// Request structs
struct AnimalSearchRequest: Codable {
    let apikey: String
    let objectType: String
    let objectAction: String
    let search: Search
}

struct Search: Codable {
    let resultStart: Int
    let resultLimit: Int
    let resultSort: String
    let resultOrder: String
    let calcFoundRows: String
    let filters: [Filter]
    let fields: [String]
}

struct Filter: Codable {
    let fieldName: String
    let operation: String
    let criteria: String
}

// Response structs
import Foundation

// Define structs to represent JSON data

struct AnimalData: Codable {
    let data: [Animal]
}

struct Animal: Codable {
    let attributes: AnimalAttributes
//    let relationships: Relationships
}

struct AnimalAttributes: Codable {
    let ageGroup: String?
    let ageString: String?
    let birthDate: String?
    let isBirthDateExact: Bool?
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

//struct Relationships: Codable {
//    let breeds: BreedRelationship?
//    let species: SpeciesRelationship?
//    let statuses: StatusRelationship?
//    let locations: LocationRelationship?
//    let orgs: OrgRelationship?
//}
//
//struct BreedRelationship: Codable {
//    let data: [BreedData]
//}
//
//struct BreedData: Codable {
//    let type: String
//    let id: String
//}
//
//struct SpeciesRelationship: Codable {
//    let data: [SpeciesData]
//}
//
//struct SpeciesData: Codable {
//    let type: String
//    let id: String
//}
//
//struct StatusRelationship: Codable {
//    let data: [StatusData]
//}
//
//struct StatusData: Codable {
//    let type: String
//    let id: String
//}
//
//struct LocationRelationship: Codable {
//    let data: [LocationData]
//}
//
//struct LocationData: Codable {
//    let type: String
//    let id: String
//}
//
//struct OrgRelationship: Codable {
//    let data: [OrgData]
//}
//
//struct OrgData: Codable {
//    let type: String
//    let id: String
//}
//
//struct PictureRelationship: Codable {
//    let data: [PictureData]
//}
//
//struct PictureData: Codable {
//    let type: String
//    let id: String
//}

// Decode JSON data into Swift structs
