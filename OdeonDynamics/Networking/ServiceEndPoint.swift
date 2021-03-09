//
//  ServiceEndPoint.swift
//  BaseProject
//
//  Created by Cüneyt AYVAZ on 2.07.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation


public enum ServiceEndPoint: String {
    
    case CreateToken = "/api/Account/CreateTokenAsync"
    case GetUser = "/api/Account/GetUser"
    case GetUserListById = "/api/Account/GetTypeListByUserIdAsync"

}
