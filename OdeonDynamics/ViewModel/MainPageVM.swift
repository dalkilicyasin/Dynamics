//
//  MainPageVM.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 3.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class MainPAgeVM: OdeonViewModel {
    var mainPageList : [MainPageResponseModel] = []{
        didSet {
            delegate?.viewModelDidUpdate(sender: self)
        }
    }
    
    var topArray = ["Download","Uninstall","Register","Login"]
    var dataArray = ["9892","1236","7562","5402"]
    var imageArray = ["download","uninstall","register","login"]
    
    let dataManager = MainPageDM()
    
    func getMainPageList() {
        dataManager.getMainPAgeList(success: { [weak self](data) in
            //  let decoder = JSONDecoder()
            do {
                var tempList : [MainPageResponseModel] = []
                tempList.removeAll()
                for i in  0...(self?.topArray.count)! - 1 {
                    tempList.append(MainPageResponseModel(toplabel: self?.topArray[i], image: self?.imageArray[i], datalabel: self?.dataArray[i]))
                }
                self?.mainPageList = tempList
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
