//
//  MainPageDM.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 3.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import Alamofire

enum ListRoute2: String {
    case moduleListUrl = "market/v2/get-quotes?symbols=AMD,IBM,AAPL&region=US"
}

public class ListRouter2: APIRouter {
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

class MainPageDM: NSObject {
    public func getMainPAgeList(success: @escaping (Data) -> Void, failure: @escaping(AppError) -> Void) {
        let router = ListRouter(nil, route: .quotesListUrl)
        AppService.request(router, success: success, failure: failure)
    }
}

