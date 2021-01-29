//
//  Destination2VM.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 16.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//


import Foundation
import UIKit

class Destination2VM: OdeonViewModel {
    var destinationsList : [Destination2ResponseModel] = []{
        didSet {
            delegate?.viewModelDidUpdate(sender: self)
        }
    }
    
    var infoArray = ["Daiyly Arrival Pax by Destination","Daily Departure Pax by Destination"]
    var dataArray = ["1236","7562"]
    var imageArray = ["arrival","departure"]
    
    let dataManager = MainPageDM()
    
    func getMainPageList() {
        dataManager.getMainPAgeList(success: { [weak self](data) in
            //  let decoder = JSONDecoder()
            do {
                var tempList : [Destination2ResponseModel] = []
                tempList.removeAll()
                for i in  0...(self?.infoArray.count)! - 1 {
                    tempList.append(Destination2ResponseModel(description: self?.infoArray[i], image: self?.imageArray[i], data: self?.dataArray[i]))
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

