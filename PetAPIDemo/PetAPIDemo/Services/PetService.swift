//
//  PetService.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/2/24.
//

import Foundation
import UIKit

class PetService: ObservableObject {
    private static let decoder = JSONDecoder()
    private static let encoder = JSONEncoder()
    
    static func fetchPets( miles: Int, postal: Int) async throws -> AnimalData {
        guard let url = URL(string: "https://api.rescuegroups.org/v5/public/animals/search/available/haspic?sort=random&limit=100") else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        
        let body = FilterData(data: FilterInfo(filterRadius: FilterRadius(miles: miles, postalcode: postal)))
        let encodedData = try encoder.encode(body)
        
        request.httpBody = encodedData
        request.httpMethod = "POST"
        request.addValue("application/vnd.api+json", forHTTPHeaderField: "Content-Type")
        request.addValue("hRnmbItJ", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let result = try decoder.decode(AnimalData.self, from: data)
        
        var cleanedData: [Animal] = []
        var cleanedIncluded: [Included] = []
        
        for index in result.data.indices {
            if result.included[index].attributes.city != nil && result.included[index].attributes.state != nil {
                if result.included[index].attributes.phone != nil || result.included[index].attributes.email != nil {
                    cleanedData.append(result.data[index])
                    cleanedIncluded.append(result.included[index])
                }
            }
        }
        
        return AnimalData(data: cleanedData, included: cleanedIncluded)
    }
    
}
