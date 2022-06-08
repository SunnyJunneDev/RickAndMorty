//
//  APIManager.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//

import Alamofire
import AlamofireImage
import Foundation

protocol APIManagerProtocol {
//    process failure to! (from url: URL, success: @escaping (([Results]) -> Void), fails: @escaping (() -> Void))
    func sendRequest(url: URL, completion: @escaping(_ characters: [Results]) -> ())
}

class APIManager: APIManagerProtocol {
    private var data: Data?
    
    func sendRequest(url: URL, completion: @escaping(_ characters: [Results]) -> ()) {
        AF.request(url, method: .get).responseDecodable(of: Character.self) { response in
            
            switch response.result {
            case .success(let characters):
                
                var results = [Results]()
                characters.results?.forEach { elements in
                    
                    let character = Results(id: elements.id,
                                            name: elements.name,
                                            status: elements.status,
                                            species: elements.species,
                                            type: elements.type,
                                            gender: elements.gender,
                                            image: elements.image,
                                            location: elements.location,
                                            episode: elements.episode)
                    results.append(character)
                }
                completion(results)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getImage(_ url: URL, handler: @escaping (UIImage?) -> Void) {
        AF.request(url, method: .get).responseImage { response in
            switch response.result {
            case .success(let img):
                handler(img)
            case .failure(let error):
                print(error)
            }
        }
    }
}
