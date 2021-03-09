//
//  GetTypeListByUserResponseModel.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 24.02.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import ObjectMapper
import UIKit

struct GetTypeListByUserIdResponseModel : Mappable {
   
    var isSuccess : Bool?
    var threadGuid : String?
    var baseMessage : BaseMessage?
    var typelist : [TypeList]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        isSuccess <- map["IsSuccess"]
        threadGuid <- map["ThreadGuid"]
        baseMessage <- map["BaseMessage"]
       
    }

}

struct BaseMessage : Mappable {
    var type : String?
    var code : Int?
    var message : String?
    var stackTrace : String?
  

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        type <- map["Type"]
        code <- map["Code"]
        message <- map["Message"]
        stackTrace <- map["StackTrace"]
    }

}

struct TypeList : Mappable {
    var id : Int?
    var typeName : String?
    var subTypeName : String?
    var subTypeId : Int?
    var groupId : Int?
    var iconImages : IconImages?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["Id"]
        typeName <- map["TypeName"]
        subTypeName <- map["SubTypeName"]
        subTypeId <- map["SubTypeId"]
        groupId <- map["GroupId"]
        iconImages <- map["iconImages"]
    }

}

struct IconImages : Mappable {
    var id : Int?
    var image_Url : String?
    var typeListId : Int?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["Id"]
        image_Url <- map["Image_Url"]
        typeListId <- map["TypeListId"]
    }

}
