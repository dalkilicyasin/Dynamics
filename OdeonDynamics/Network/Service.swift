//
//  SerVices.swift
//  NomuraTest
//
//  Created by Akif Demirezen on 22/11/20.
//  Copyright © 2020 Akif Demirezen. All rights reserved.
//

import Alamofire



protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}


class AppService: NSObject {
    static func request(_ request: URLRequestConvertible, success:@escaping (Data) -> Void, failure:@escaping (AppError) -> Void) {
        AF.request(request).responseData { (responseObject) -> Void in
            if let data = responseObject.data {
                let decoder = JSONDecoder()
                if let item = try? decoder.decode(QuotesModel.self, from: data), item.quoteResponse.result.count == 0 {
                    let error = AppServiceError.init(errorCode: AppServiceError.ErrorCode.unknownError)
                    failure(error)
                } else {
                    success(data)
                }
            } else {
                var item: AppError
                if let error = responseObject.error as NSError? {
                    item = AppServiceError.init(error: error)
                } else {
                    item = AppServiceError.init(errorCode: AppServiceError.ErrorCode.unknownError)
                }
                failure(item)
            }
        }
    }
}



