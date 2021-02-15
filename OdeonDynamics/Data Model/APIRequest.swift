//
//  APIRequest.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 13.02.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import Foundation

enum APIError : Error {
    case responseProblem
    case decodinProblem
    case otherProblem
}


struct APIRequest  {
    
    let resourceURL : URL
    
    init(endpoint : String ) {
        
        let resourceString = "http://dashboardmobile.odeontours.com/api/Account/\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func save(_ userToSave : User, completion : @escaping(Result<User, APIError>) -> Void) {
        
        do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let jsonObject = [    "UserName" : "B2CWebApp",
                                  "Password" : "gx7zBC3W6YU3f4jR",
                                  "LanguageId" : 1,
                                  "MobilInformation" : "DeviceId; Phone Type (IOS, Android);Version; Operator Type (TT,Vodafone,Turkcell); Connection Type(Mobil,Wi-Fi)"] as [String : Any]
            
                let requestBody = try JSONSerialization.data(withJSONObject: jsonObject, options: .fragmentsAllowed)
                
                urlRequest.httpBody = requestBody
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(.failure(.responseProblem))
                    print("error")
                    return
                }
                do {
                    let userData = try JSONDecoder().decode(User.self, from: jsonData)
                    print(userData)
                }catch {
                    print("error")
                    completion(.failure(.decodinProblem))
                }
                
            }
            dataTask.resume()
          
        }catch{
            print("error other")
            completion(.failure(.otherProblem))
        }
    }
}
