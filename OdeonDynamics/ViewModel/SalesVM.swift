//
//  SalesVM.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 17.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import Foundation
import UIKit

class SalesVM: OdeonViewModel {
    var salesList : [SalesResponseModel] = []{
        didSet {
            delegate?.viewModelDidUpdate(sender: self)
        }
    }
    
    var infoArray = ["Excursion SalesExcursion","Shop Sales","Tour Package Sales"]
    var dataArray = ["1000000000","1000000000","1000000000"]
    
    
    let dataManager = SalesDM()
    
    func getMainPageList() {
        dataManager.getMainPAgeList(success: { [weak self](data) in
            //  let decoder = JSONDecoder()
            do {
                var tempList : [SalesResponseModel] = []
                tempList.removeAll()
                for i in  0...(self?.infoArray.count)! - 1 {
                    tempList.append(SalesResponseModel(description: self?.infoArray[i], data: self?.dataArray[i]))
                }
                self?.salesList = tempList
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

