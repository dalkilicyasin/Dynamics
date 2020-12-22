//
//  ServiceRouter.swift
//  NomuraTest
//
//  Created by Akif Demirezen on 22.12.2020.
//  Copyright © 2020 Azure. All rights reserved.
//

import UIKit
import Alamofire

public class APIRouter: APIConfiguration {
    var method: HTTPMethod {
        return .post
    }
    var path: String {
        return ""
    }
    var parameters: Parameters?
    init(_ params: Parameters? = nil ) {
        parameters = params
    }
    public func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: URL.init(string: APIConstants.baseURL+path)!)
        request.setValue(APIConstants.contentType, forHTTPHeaderField: "Content-Type")
        request.setValue(APIConstants.keyValue, forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue(APIConstants.baseURL.replacingOccurrences(of:"https://" , with: ""), forHTTPHeaderField: "X-RapidAPI-Host")
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        if method.rawValue == HTTPMethod.get.rawValue {
            return try URLEncoding.queryString.encode(request, with: parameters)
        } else {
            return try JSONEncoding.default.encode(request, with: parameters)
        }
    }
}
