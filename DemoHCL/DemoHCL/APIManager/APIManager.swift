//
//  APIManager.swift
//  DemoHCL
//
//  Created by hapy gohil on 16/11/23.
//

import Foundation


enum APPError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
}

//Result enum to show success or failure
enum Result<T> {
    case success(T)
    case failure(APPError)
}

class APIManager {
    static let shared = APIManager()
    
    func dataRequest<T: Decodable>(with url: String, objectType: T.Type, completion: @escaping (Result<T>) -> Void) {
        
        let dataURL = URL(string: url)
        
        let session = URLSession.shared
        let request = URLRequest(url: dataURL ?? URL(fileURLWithPath: url), cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(Result.failure(APPError.networkError(error!)))
                return
            }
            
            guard let data = data else {
                completion(Result.failure(APPError.dataNotFound))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                completion(Result.success(decodedObject))
            } catch let error {
                completion(Result.failure(APPError.jsonParsingError(error as! DecodingError)))
            }
        })
        
        task.resume()
    }

}
