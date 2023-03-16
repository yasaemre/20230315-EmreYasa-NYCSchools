//
//  APICaller.swift
//  20230315-EmreYasa-NYCSchools
//
//  Created by Emre Yasa on 3/15/23.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    let baseURL = "https://data.cityofnewyork.us"
    
    private init() {}
    
    public func fetchSchools(completed: @escaping (Result<[Schools], NYCSError>) -> Void) {
        let endpoint = baseURL + "/resource/s3k6-pzi2.json"
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completed(.failure(.invalidUrl))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let schools = try JSONDecoder().decode([Schools].self, from: data)
                completed(.success(schools))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }

    
    public func searchedSchools(with query:String, completed: @escaping (Result<[Schools], NYCSError>) -> Void) {
        var urlComponents = URLComponents(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!
        let startsWithQueryItem = URLQueryItem(name: "$where", value: "starts_with(school_name, '\(query)')")
        urlComponents.queryItems = [startsWithQueryItem]

        guard let url = urlComponents.url else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("Error: \(error!)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let schools = try JSONDecoder().decode([Schools].self, from: data)
                completed(.success(schools))
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }
    
    func fetchSchool(for id: String, completed: @escaping (Result<[SchoolDetail], NYCSError>) -> Void) {
        let endpoint = baseURL + "/resource/f9bf-2cp4.json?dbn=\(id)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completed(.failure(NYCSError(rawValue: error.localizedDescription) ?? .invalidResponse))
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let school = try decoder.decode([SchoolDetail].self, from: data)
                completed(.success(school))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
