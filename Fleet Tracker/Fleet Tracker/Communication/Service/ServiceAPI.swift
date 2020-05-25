//
//  ServiceAPI.swift
//  Fleet Tracker
//
//  Created by Sandip Mahajan on 05/12/19.
//  Copyright © 2019 Mobiliya. All rights reserved.
//

import UIKit
import HandyJSON

class ServiceAPI: NSObject {
   
    func construct<T: HandyJSON>(endpoint: Endpoint, params: [String:Any]?, method: HTTPMethod, result: @escaping (Result<T, APIServiceError>) -> Void) {
        
        let url = BASE_URL.appendingPathComponent(endpoint.rawValue)
        print("###4 in construct  URL = \(url)")
        var urlRequest : URLRequest? = nil
        
        if (method == .GET) {
            print("###4 in Get")
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
            var queryItems = [URLQueryItem]()
            for (key, value) in params! {
                queryItems.append(URLQueryItem(name: key, value: "\(value)"))
            }
            
            urlComponents?.queryItems = queryItems
            urlRequest = URLRequest(url: (urlComponents?.url!)!)
            
        } else if (method == .POST) {
            print("###4 in post")
            let data = try! JSONSerialization.data(withJSONObject: params as Any, options: JSONSerialization.WritingOptions.prettyPrinted)
            urlRequest = URLRequest(url: url)
            urlRequest?.httpBody = data
        }
        
        urlRequest?.httpMethod = method.rawValue
        
        let token = "bearer \(String(data: KeychainService.load(key: AUTH_TOKEN)! as Data, encoding: .utf8) ?? "")"
      
       
        urlRequest?.setValue(token, forHTTPHeaderField: "Authorization")
        urlRequest?.setValue("application/json", forHTTPHeaderField: "Content-Type")
        print("###4 in urlRequest = \(String(describing: urlRequest))")
        APIClient.shared.call(url: urlRequest!, completion: result)
    }
}
