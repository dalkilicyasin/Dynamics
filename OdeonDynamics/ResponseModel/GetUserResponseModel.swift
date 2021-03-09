//
//  GetUserResponseModel.swift
//  OdeonDynamics
//
//  Created by Akif Demirezen on 14.02.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit
import ObjectMapper

struct GetUserResponseModel : Mappable {
    var id : Int?
    var name : String?
    var surname : String?
    var emailAddress : String?
    var userName : String?
    var rolelist : [Rolelist]?
    

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["Id"]
        name <- map["Name"]
        surname <- map["Surname"]
        emailAddress <- map["EmailAddress"]
        userName <- map["UserName"]
        rolelist <- map["rolelist"]
       
    }
}
struct Rolelist : Mappable {
    var recordId : Int?
    var userId : Int?
    var view : Bool?
    var typeListId : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        recordId <- map["RecordId"]
        userId <- map["UserId"]
        view <- map["View"]
        typeListId <- map["TypeListId"]
    }

}


