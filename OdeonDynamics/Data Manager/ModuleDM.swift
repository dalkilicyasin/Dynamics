//
//  ModuleDM.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 30.12.2020.
//  Copyright © 2020 Azure. All rights reserved.
//

import Alamofire

enum ListRoute1: String {
    case moduleListUrl = "market/v2/get-quotes?symbols=AMD,IBM,AAPL&region=US"
}

public class ListRouter1: APIRouter {
    let route: ListRoute
    override var method: HTTPMethod {
        return .get
    }
    init(_ params: [String: Any]? = nil, route: ListRoute) {
        self.route = route
        super.init(params)
    }
    override var path: String {
        return route.rawValue
    }
}

class ModuleDM: NSObject {
    public func getModuleList(success: @escaping (Data) -> Void, failure: @escaping(AppError) -> Void) {
        let router = ListRouter(nil, route: .quotesListUrl)
        AppService.request(router, success: success, failure: failure)
    }
}
