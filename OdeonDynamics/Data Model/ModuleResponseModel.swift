//
//  ModuleDataModel.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 30.12.2020.
//  Copyright © 2020 Azure. All rights reserved.
//

import Foundation
import UIKit

struct ModuleResponseModel : Codable {
    var image : String?
    var name : String?
}

struct Results : Codable {
    let result : [ModuleResponseModel]
}

struct ModulesModel: Codable {
    let moduleResponse: Results
}

