//
//  Defaults.swift
//  BaseProject
//
//  Created by Bekir's Mac on 7.03.2019.
//  Copyright © 2019 OtiHolding. All rights reserved.
//

import Foundation
import ObjectMapper

public var userDefaultsData:Defaults = Defaults()

public class Defaults{
    public enum DefaultsType {
        case LanguageID
        case DeviceID
        case UserID
        case TopicList
    }
    
   public init(){}
    
     func saveTopicList(moduleTypeName:GetTypeListByUserIdResponseModel){
           let preferences = UserDefaults.standard
           let encoder = JSONEncoder()
           if let encoded = try? encoder.encode(moduleTypeName) {
            preferences.set(encoded, forKey: getIdentifier(type: .TopicList))
               preferences.synchronize()
           }
       }
       
    func getTopicList() -> GetTypeListByUserIdResponseModel{
           let preferences = UserDefaults.standard
           let decoder = JSONDecoder()
        if let savedTypeName = preferences.object(forKey: getIdentifier(type: .TopicList)) as? Data {
               if let loadedTypeName = try? decoder.decode(GetTypeListByUserIdResponseModel.self, from: savedTypeName) {
                   return loadedTypeName
               }
           }
        return GetTypeListByUserIdResponseModel.init(JSON: ["":""])!
       }

    
    //LanguageID
    public func saveLanguageId(languageId:Int){
        let preferences = UserDefaults.standard
        let currentLanguageKey = getIdentifier(type: .LanguageID)
        preferences.set(languageId, forKey: currentLanguageKey)
        preferences.synchronize()
    }
    
    public func getLanguageId() -> Int{
        let preferences = UserDefaults.standard
        let currentLanguageKey = getIdentifier(type: .LanguageID)
        if preferences.object(forKey: currentLanguageKey) == nil {
            return -1
        } else {
            return preferences.integer(forKey: currentLanguageKey)
        }
    }
    
    public func saveUserId(languageId:Int){
        let preferences = UserDefaults.standard
        let currentLanguageKey = getIdentifier(type: .UserID)
        preferences.set(languageId, forKey: currentLanguageKey)
        preferences.synchronize()
    }
    
    public func getUserId() -> Int{
        let preferences = UserDefaults.standard
        let currentLanguageKey = getIdentifier(type: .UserID)
        if preferences.object(forKey: currentLanguageKey) == nil {
            return -1
        } else {
            return preferences.integer(forKey: currentLanguageKey)
        }
    }
    
    // DeviceID
    public func saveDeviceId(id:String){
        let preferences = UserDefaults.standard
        preferences.set( id , forKey:getIdentifier(type: .DeviceID))
        preferences.synchronize()
    }
    
    public func getDeviceId() -> String! {
        let preferences = UserDefaults.standard
        if preferences.object(forKey: getIdentifier(type: .DeviceID)) == nil {
            return nil
        }
        let data:String = preferences.value(forKey: getIdentifier(type: .DeviceID)) as! String
        return data
    }
    
    
    private  func  getIdentifier(type:DefaultsType)->String {
        switch type {
        case .LanguageID:
            return "LanguageID"
        case .DeviceID:
            return "DeviceID"
        case .UserID:
            return "UserID"
        case .TopicList:
            return "TopicList"
        }
    }
    
}
