//
//  MediaAPI.swift
//  Ela's App
//
//  Created by Kaushal Janga on 7/1/24.
//

import Foundation

struct Constants {
    static let API_KEY = "48be2d82d7c2af6520c53f4059162acd"
    static let YoutubeAPI_KEY = "AIzaSyAOJJE-AV7FU13E_XUOLhKqXmrUIGffcdg"
}

enum APIError: Error {
    case failedTogetData
}

class MediaAPI {
    static let shared = MediaAPI()
    
    func searchMedia(with query: String, completion: @escaping (Result<[NotFolder], Error>) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/search/multi?api_key=\(Constants.API_KEY)")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "query", value: query),
          URLQueryItem(name: "include_adult", value: "false"),
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: components.url!)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                //print(String(decoding: data, as: UTF8.self))

                let results = try JSONDecoder().decode(APIResponse.self, from: data)
                completion(.success(results.results))
                //x(results)
            } catch {
                completion(.failure(APIError.failedTogetData))
                
            }
        }
        task.resume()

    }
    
    
    func findCastMovie(with id: Int, completion: @escaping (Result<[Cast], Error>) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/credits?api_key=\(Constants.API_KEY)")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: components.url!)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(CastResponse.self, from: data)
                completion(.success(results.cast))
            } catch {
                completion(.failure(APIError.failedTogetData))
                
            }
        }
        task.resume()

    }


    func findCastTV(with id: Int, completion: @escaping (Result<[Cast], Error>) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/tv/\(id)/credits?api_key=\(Constants.API_KEY)")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: components.url!)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(CastResponse.self, from: data)
                completion(.success(results.cast))
            } catch {
                completion(.failure(APIError.failedTogetData))
                
            }
        }
        task.resume()

    }
    
    func findMediaCast(with id: Int, completion: @escaping (Result<[Cast], Error>) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/person/\(id)/combined_credits?api_key=\(Constants.API_KEY)")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: components.url!)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(CastResponse.self, from: data)
                completion(.success(results.cast))
                //print(String(decoding: data, as: UTF8.self))
            } catch {
                completion(.failure(APIError.failedTogetData))
                
            }
        }
        task.resume()

    }
    
    func findTVCast(with id: Int, completion: @escaping (Result<[Cast], Error>) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/person/\(id)/combined_credits?api_key=\(Constants.API_KEY)")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: components.url!)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(CastResponse.self, from: data)
                completion(.success(results.cast))
                //print(String(decoding: data, as: UTF8.self))
            } catch {
                completion(.failure(APIError.failedTogetData))
                
            }
        }
        task.resume()

    }

    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
            

            guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
            guard let url = URL(string: "https://youtube.googleapis.com/youtube/v3/search?q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else {return}
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(YoutubeResponse.self, from: data)
                    completion(.success(results.items[0]))
                    

                } catch {
                    completion(.failure(error))
                    print(error.localizedDescription)
                }

            }
            task.resume()
        }
}
