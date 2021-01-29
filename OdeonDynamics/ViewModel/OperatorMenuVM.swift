//
//  OperatorMenuVM.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 28.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//


import Foundation
import UIKit

class OperatorMenuVM: OdeonViewModel {
    var operatorList : [OperatorMenuResponseModel] = []{
        didSet {
            delegate?.viewModelDidUpdate(sender: self)
        }
    }
    
    var infoArray = ["Coral Travel Rusya","Coral Travel Poland","Coral Travel Ukraine","Sunmar","Ferien Touristik"]
    var imageArray = ["statistic","statistic","statistic","statistic","statistic"]
    
    
    let dataManager = OperatorMenuDM()
    
    func getMainPageList() {
        dataManager.getMainPAgeList(success: { [weak self](data) in
            //  let decoder = JSONDecoder()
            do {
                var tempList : [OperatorMenuResponseModel] = []
                tempList.removeAll()
                for i in  0...(self?.infoArray.count)! - 1 {
                    tempList.append(OperatorMenuResponseModel(description: self?.infoArray[i], image: self?.imageArray[i]))
                }
                self?.operatorList = tempList
                //  let item = try decoder.decode(ModulesModel.self, from: data)
                // self?.model = item
           
            } catch {
                print(error.localizedDescription)
                self?.delegate?.viewModelUpdateFailed(error: AppServerResponseError.JsonParsing)
            }
        }, failure: { (error) in
            self.delegate?.viewModelUpdateFailed(error: error)
        })
    }
}

