//
//  QuotesVM.swift
//  NomuraTest
//
//  Created by Akif Demirezen on 22/11/20.
//  Copyright © 2020 Akif Demirezen. All rights reserved.
//

import Foundation
import UIKit
class QuotesVM: OdeonViewModel {
    let dataManager = QuotesDM()
    var model: QuotesModel? {
        didSet {
            delegate?.viewModelDidUpdate(sender: self)
        }
    }
    func getQuotesList() {
        dataManager.getQuotesList(success: { [weak self](data) in
            let decoder = JSONDecoder()
            do {
                let item = try decoder.decode(QuotesModel.self, from: data)
                self?.model = item
            } catch {
                print(error.localizedDescription)
                self?.delegate?.viewModelUpdateFailed(error: AppServerResponseError.JsonParsing)
            }
        }, failure: { (error) in
            self.delegate?.viewModelUpdateFailed(error: error)
        })
    }
}
