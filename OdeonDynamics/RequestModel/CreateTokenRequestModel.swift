//
//  CreateTokenRequestModel.swift
//  OdeonDynamics
//
//  Created by Akif Demirezen on 14.02.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit
import ObjectMapper

public class CreateTokenRequestModel:Mappable{
    
    public var userName:String!
    public var password:String!
    public var languageID:Int!
    public var mobileInformation:String!
    
    public required init?(map: Map) {
        
    }
    
    public init() {
        self.userName = "B2CWebApp"
        self.password = "gx7zBC3W6YU3f4jR"
        self.languageID = userDefaultsData.getLanguageId()
        self.mobileInformation = UIDevice.current.modelName
    }
    
    
    public func mapping(map: Map) {
        userName <- map["UserName"]
        password <- map["Password"]
        languageID <- map["LanguageId"]
        mobileInformation <- map["MobilInformation"]
    }
}
