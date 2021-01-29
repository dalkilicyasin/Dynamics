//
//  DestinationVM.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 14.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//


import Foundation
import UIKit

class DestinationVM: OdeonViewModel {
    var destinationsList : [DestinationResponseModel] = []{
        didSet {
            delegate?.viewModelDidUpdate(sender: self)
        }
    }
    
    var infoArray = ["Info Plan by Destination","Daiyly Arrival Pax by Destination","Daily Departure Pax by Destination"]
    var dataArray = ["9892","1236","7562"]
    var imageArray = ["info","arrival","departure"]
    
    let dataManager = DestinationsDM()
    
    func getMainPageList() {
        dataManager.getMainPAgeList(success: { [weak self](data) in
            //  let decoder = JSONDecoder()
            do {
                var tempList : [DestinationResponseModel] = []
                tempList.removeAll()
                for i in  0...(self?.infoArray.count)! - 1 {
                    tempList.append(DestinationResponseModel(description: self?.infoArray[i], image: self?.imageArray[i], data: self?.dataArray[i]))
                }
                self?.destinationsList = tempList
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
