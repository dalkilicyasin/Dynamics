//
//  ModuleVM.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 30.12.2020.
//  Copyright © 2020 Azure. All rights reserved.
//

import Foundation
import UIKit
class ModuleVM: OdeonViewModel {
    var moduleList : [ModuleResponseModel] = []{
        didSet {
            delegate?.viewModelDidUpdate(sender: self)
        }
    }
  
    var stringArray = ["App Statistic","Pax Information","Sales Revenue","Finance"]
    var imageArray = ["statistic","pax","sales","budget"]
    
    let dataManager = ModuleDM()
    
    func getModuleList() {       
        dataManager.getModuleList(success: { [weak self](data) in
          //  let decoder = JSONDecoder()
            do {
                var tempList : [ModuleResponseModel] = []
                tempList.removeAll()
                for i in  0...(self?.stringArray.count)! - 1 {
                    tempList.append(ModuleResponseModel(image: self?.imageArray[i], name: self?.stringArray[i]))
                }
                self?.moduleList = tempList
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

