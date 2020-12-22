//
//  NomuraViewModel.swift
//  NomuraTest
//
//  Created by Akif Demirezen on 22/11/20.
//  Copyright © 2020 Akif Demirezen. All rights reserved.
//

import Foundation
protocol ViewModelDelegate: class {
    func viewModelDidUpdate(sender: OdeonViewModel)
    func viewModelUpdateFailed(error: AppError)
}

class OdeonViewModel: NSObject {
    weak var delegate: ViewModelDelegate?
}
