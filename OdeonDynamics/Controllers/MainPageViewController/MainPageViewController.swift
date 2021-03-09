//
//  MainPageViewController.swift
//  OdeonDynamics
//
//  Created by Yasin Dalkilic on 3.01.2021.
//  Copyright © 2021 Azure. All rights reserved.
//

import UIKit

class MainPageViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var hamburgerMenuView: HamburgerMenuView!
    
    let mainPageVM = MainPAgeVM()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 20, left: 37, bottom: 0, right: 37)
        layout.minimumInteritemSpacing = 2
        layout.itemSize = CGSize(width: 164, height: 164)
        layout.minimumLineSpacing = 20
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(MainPageCollectionViewCell.nib, forCellWithReuseIdentifier: MainPageCollectionViewCell.identifier)
        
        self.mainPageVM.delegate = self
        self.mainPageVM.getMainPageList()
    }
}

extension MainPageViewController : ViewModelDelegate {
    func viewModelDidUpdate(sender: OdeonViewModel) {
        self.collectionView.reloadData()
    }
    
    func viewModelUpdateFailed(error: AppError) {
        
    }
}

extension MainPageViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.mainPageVM.mainPageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageCollectionViewCell.identifier, for: indexPath) as! MainPageCollectionViewCell
        cell.setInfo(mainpage: self.mainPageVM.mainPageList[indexPath.row])
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.15
        cell.layer.shadowRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected")
    }
}









