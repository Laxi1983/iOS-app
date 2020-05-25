//
//  APIClient.swift
//  Fleet Tracker
//
//  Created by Sandip Mahajan on 05/12/19.
//  Copyright © 2019 Mobiliya. All rights reserved.
//

import UIKit
import HandyJSON

class APIClient: NSObject {
    
    public static let shared = APIClient()
    private override init() {}
    
    func call<T: HandyJSON>(url: URLRequest, completion: @escaping (Result<T, APIServiceError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (result) in
            switch result {
            case .success(let response, let data):
                // Handle Data and Response
                let string1 = String(data: data, encoding: String.Encoding.utf8) ?? "Data could not be printed"
                print("###5 in success data String1 = \(string1)")
                let httpURLResponse = response as? HTTPURLResponse
                guard let statusCode = httpURLResponse?.statusCode, 200..<299 ~= statusCode else {
                    if(httpURLResponse!.statusCode == 401) {
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
                        UIApplication.shared.keyWindow?.rootViewController?.present(vc, animated: true, completion: nil)
                        
                        return
                    }
                    completion(.failure(.INVALID_RESPONSE))
                    return
                }
                if let jsonString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? {
                    let values = T.self.deserialize(from: jsonString)
                    print("###5 in values = \(jsonString)")
                    print("###5 in values = \(values)")
                    completion(.success(values!))
                }
                else {
                    completion(.failure(.INVALID_RESPONSE))
                }
                break
            case .failure(let error):
                // Handle Error
                print(error)
                completion(.failure(.API_ERROR))
                break
            }
        }.resume()
    }
}
