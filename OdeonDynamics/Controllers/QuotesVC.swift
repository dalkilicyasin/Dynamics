//
//  ViewController.swift
//  NomuraTest
//
//  Created by Akif Demirezen on 22/11/20.
//  Copyright © 2020 Akif Demirezen. All rights reserved.
//

import UIKit

class QuotesVC: UIViewController {
    let quotesVM = QuotesVM()
    var quotesArray:[Result] = []
    @IBOutlet weak var quotesTblView: UITableView!
    var timer: Timer?
    // MARK: View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllQuotesFromApiCall()
        Timer.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.updateCounting), object: nil)
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        timer?.invalidate()
    }
    // MARK: Custom Methods
    @objc func updateCounting(){
        getAllQuotesFromApiCall()
    }
    // MARK: Api Call
    func getAllQuotesFromApiCall() {
        showProgressHUD()
        quotesVM.delegate = self
        quotesVM.getQuotesList()
    }
}

extension QuotesVC: ViewModelDelegate {
    // MARK: View Model Delegate Methods
    func viewModelDidUpdate(sender: OdeonViewModel) {
        DispatchQueue.main.async {
            self.hideProgressHUD()
            self.quotesArray.removeAll()
            if let details = self.quotesVM.model?.quoteResponse.result, details.count>0 {
                self.quotesArray = details
            } else {
               self.alert(message: ErrorCodes["E0007"]!)
            }
            self.quotesTblView.reloadData()
        }
    }
    
    func viewModelUpdateFailed(error: AppError) {
        hideProgressHUD()
        print(error.description)
        alert(message: ErrorCodes["E0008"]!)
    }
}

extension QuotesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: QuotesCell = (quotesTblView.dequeueReusableCell(withIdentifier: "QuotesCell", for: indexPath) as? QuotesCell)!
        let responseDict = quotesArray[indexPath.row]
        cell.nameLbl.text = responseDict.symbol.uppercased()
        cell.descLbl.text = responseDict.longName.capitalized
        cell.priceLbl.text = "\(responseDict.regularMarketPrice)"
        animatePercentButtonColor(sender: cell.percentageBtn, value: responseDict.regularMarketChangePercent)
        animatePercentLabelColor(sender: cell.perctageLbl, value: responseDict.postMarketChangePercent)
        cell.postLbl.isHidden = (responseDict.postMarketChangePercent != 0) ? false:true
        return cell
    }
    
    func animatePercentButtonColor(sender: UIButton, value: Double) {
        UIView.transition(with: sender, duration: 0.3, options: .curveEaseInOut, animations: {
            let priceTitle = (value > 0) ? "+" + String(format: "%.2f", value) + "%" : String(format: "%.2f", value) + "%"
            sender.backgroundColor = (value > 0) ? UIColor(hexString: "4EA767") : UIColor(hexString: "C13942")
            sender.setTitle(priceTitle, for: .normal)
        })
    }
    
    func animatePercentLabelColor(sender: UILabel, value: Double) {
        UIView.transition(with: sender, duration: 0.3, options: .curveEaseInOut, animations: {
            let postPercent = (value > 0) ? "+" + String(format: "%.2f", value) + "%" : String(format: "%.2f", value) + "%"
            sender.textColor = (value > 0) ? UIColor(hexString: "4EA767") : UIColor(hexString: "C13942")
            sender.text = postPercent
            sender.isHidden = (value != 0) ? false:true
        })
    }
}
