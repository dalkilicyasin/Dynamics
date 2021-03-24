//
//  ModuleViewController.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 30.12.2020.
//  Copyright © 2020 Azure. All rights reserved.
//

import UIKit

class ModuleViewController: BaseViewController {
    
    @IBOutlet weak var headerView: OdeonHeaderView!
    @IBOutlet weak var tableView: UITableView!
    var topicResponse : GetTypeListByUserIdResponseModel?
    
    let companyList = ["App Statistic","Pax Information","Sales Revenue","Finance"]
    let companyImageList = ["statistic","pax","sales","budget"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ModuleTableViewCell.nib, forCellReuseIdentifier: ModuleTableViewCell.identifier)
        
        let getTypeListByUserRequestModel = getBaseRequestData(data: GetTypeListByUserIdRequestModel(userId: userDefaultsData.getUserId(), groupId: TOPIC_REQUEST_ID))
        NetworkManager.sendRequest(url: NetworkManager.BASEURL, endPoint: .GetUserListById, requestModel: getTypeListByUserRequestModel ) { (response: BaseResponse<GetTypeListByUserIdResponseModel>) in
            if response.isSuccess ?? false {
                self.topicResponse = response.dataObject
                if response.dataObject != nil {
                    userDefaultsData.saveTopicList(moduleTypeName: response.dataObject!)
                    print("response succsess")
                }else{
                    print("data empty")
                }
            }
        }
    }
    @IBAction func logOutButtonTapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension ModuleViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return (self.topicResponse?.typelist?.count ?? 0)
        return companyList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ModuleTableViewCell.identifier) as! ModuleTableViewCell
        //cell.setInfo(module: (self.topicResponse?.typelist?[indexPath.row])!)
        cell.imageViewModule.image = UIImage(named: companyImageList[indexPath.row])
        cell.labelModule.text = companyList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var viewController: UIViewController = UIViewController()
        switch (indexPath.row) {
        case 0:
            viewController =  MainPageViewController()
        case 1:
            viewController =  DestinationsViewController()
        case 2:
            viewController = SalesViewController()
        case 3:
            viewController = ExcursionsViewController()
        default:
            print("default")
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
