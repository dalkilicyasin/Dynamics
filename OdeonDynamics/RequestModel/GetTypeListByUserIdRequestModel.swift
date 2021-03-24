//
//  GetTypeListByUserRequestModel.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 24.02.2021.
//  Copyright © 2021 Azure. All rights reserved.
//
import UIKit
import ObjectMapper

struct GetTypeListByUserIdRequestModel : Mappable {
   
    public var userId : Int!
    public var groupId : Int!
    
    init?(map: Map) {

    }
    
    public init(userId:Int, groupId : Int) {
        self.userId = userId
        self.groupId = groupId
    }

    mutating func mapping(map: Map) {

        userId <- map["UserId"]
        groupId <- map["groupId"]
    }

}
