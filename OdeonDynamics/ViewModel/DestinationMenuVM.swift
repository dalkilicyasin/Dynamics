//
//  OperatorMenuVM.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 28.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//


import Foundation
import UIKit

class DestinationMenuVM : OdeonViewModel {
    var destinationList : [DestinationMenuResponseModel] = []{
        didSet {
            delegate?.viewModelDidUpdate(sender: self)
        }
    }
    
    var infoArray = ["Odeon Tour EG","Odeon Tour GR","Odeon Tour ES","Odeon Tour UAE","Odeon Tour TN","Odeon Tour TZ","Odeon Tour TH"]
  
    let dataManager = DestinationMenuDM()
    
    func getMainPageList() {
        dataManager.getMainPAgeList(success: { [weak self](data) in
            //  let decoder = JSONDecoder()
            do {
                var tempList : [DestinationMenuResponseModel] = []
                tempList.removeAll()
                for i in  0...(self?.infoArray.count)! - 1 {
                    tempList.append(DestinationMenuResponseModel(description: self?.infoArray[i]))
                }
                self?.destinationList = tempList
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

