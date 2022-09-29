//
//  Model.swift
//  GithubApi
//
//  Created by Mahdia Amriou on 27/09/2022.
//

import Foundation
struct Gitb: Decodable {
  
    var login : String
    var avatarUrl : String
    var name : String
    
}
    
func getRandomGuitb(pseudo: String) async throws -> (Gitb) {
    guard let url = URL(string: "https://api.github.com/users/\(pseudo)")
    else {
    fatalError("Missing URL")
    }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    guard (response as? HTTPURLResponse)?.statusCode == 200
    else {
    fatalError("Error while fetching data")
    }
        let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let gitb = try decoder.decode(Gitb.self, from: data)

            return gitb
        

        }
