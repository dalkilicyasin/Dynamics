//
//  ExcursionVM.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 19.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import Foundation
import UIKit

class ExcursionVM: OdeonViewModel {
    var excursionList : [ExcursionResponseModel] = []{
        didSet {
            delegate?.viewModelDidUpdate(sender: self)
        }
    }
    
    var infoArray = ["Turkey","Dubai","Tailand","Egypt","Spain"]
    var dataArray = ["2010.10","5100.20","3500.45","6400.20","5000"]
    var numberArray = ["1","2","3","4","5"]
    
    let dataManager = ExcursionDM()
    
    func getMainPageList() {
        dataManager.getMainPAgeList(success: { [weak self](data) in
            //  let decoder = JSONDecoder()
            do {
                var tempList : [ExcursionResponseModel] = []
                tempList.removeAll()
                for i in  0...(self?.infoArray.count)! - 1 {
                    tempList.append(ExcursionResponseModel(description: self?.infoArray[i], data: self?.dataArray[i], number: self?.numberArray[i]))
                }
                self?.excursionList = tempList
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
