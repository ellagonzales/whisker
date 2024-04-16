//
//  PetService.swift
//  PetAPIDemo
//
//  Created by Alexandra Marum on 4/2/24.
//

import Foundation

class PetService: ObservableObject {
    private static let decoder = JSONDecoder()
    private static let encoder = JSONEncoder()
    
    static func fetchPets() async throws -> AnimalData {
        guard let url = URL(string: "https://api.rescuegroups.org/v5/public/animals/search/available/haspic?sort=random&limit=25") else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        
        let body = FilterData(data: FilterInfo(filterRadius: FilterRadius(miles: 50, postalcode: 27707)))
        let encodedData = try encoder.encode(body)
        
        request.httpBody = encodedData
        request.httpMethod = "POST"
        request.addValue("application/vnd.api+json", forHTTPHeaderField: "Content-Type")
        request.addValue("hRnmbItJ", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let result = try decoder.decode(AnimalData.self, from: data)
        return result
    }
}
