//
//  MovieService.swift
//  MovieApp
//
//  Created by Tifo Audi Alif Putra on 04/03/20.
//  Copyright © 2020 BCC FILKOM. All rights reserved.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovies(with Endpoint: MovieEndpoints, success: @escaping (_ movie: MoviesResponse)-> Void, failure: @escaping (_ error: ErrorResponse)-> Void)
}

class MovieService: MovieServiceProtocol {
    
    private init(){}
    static let shared = MovieService()
    private let apiKey = "" // Register by yourself
    private let baseUrl = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    func fetchMovies(with Endpoint: MovieEndpoints, success: @escaping (MoviesResponse) -> Void, failure: @escaping (ErrorResponse) -> Void) {
        
        //create url components
        guard var urlComponents = URLComponents(string: "\(baseUrl)/movie/\(Endpoint.rawValue)") else {
            return failure(.invalidEndpoint)
        }
        
        //create query items
        let queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        urlComponents.queryItems = queryItems
        
        //generate valid url
        guard let url = urlComponents.url else {
            return failure(.invalidEndpoint)
        }
        
        //perform network request
        urlSession.dataTask(with: url) { [unowned self] (data, response, error) in
            
            if error != nil {
                return failure(.apiError)
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                return failure(.invalidResponse)
            }
            
            guard let data = data else {
                return failure(.noData)
            }
            
            do {
                let movieResponse = try self.jsonDecoder.decode(MoviesResponse.self, from: data)
                DispatchQueue.main.async {
                    success(movieResponse)
                }
            } catch {
                return failure(.serializationError)
            }
        }.resume()
    }
}

public enum MovieEndpoints: String, CustomStringConvertible {
    case popular
    case upcoming
    case nowPlaying = "now_playing"
    case topRated = "top_rated"
    
    public var description: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .popular: return "Popular"
        case .topRated: return "Top Rated"
        case.upcoming: return "Upcoming"
        }
    }
}

public enum ErrorResponse: String {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    public var description: String {
        switch self {
        case .apiError: return "Ooops, there is something problem with the api"
        case .invalidEndpoint: return "Ooops, there is something problem with the endpoint"
        case .invalidResponse: return "Ooops, there is something problem with the response"
        case .noData: return "Ooops, there is something problem with the data"
        case .serializationError: return "Ooops, there is something problem with the serialization process"
        }
    }
}
