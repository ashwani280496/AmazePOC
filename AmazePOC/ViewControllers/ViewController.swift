//
//  ViewController.swift
//  AmazePOC
//
//  Created by Ashwani Kumar on 17/07/19.
//  Copyright © 2019 Djubo. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var renewBtn: UIButton!
    @IBOutlet weak var packageLbl: UILabel!
    @IBOutlet weak var renewalDateLbl: UILabel!
    @IBOutlet weak var nextWashDateLbl: UILabel!
    @IBOutlet weak var washesCollectionView: UICollectionView!
    var response : ResponseModel?
    
    let washCellIdentifier = "washCell"

    
    override func viewDidLoad() {
        renewBtn.layer.cornerRadius = renewBtn.frame.height / 2
        super.viewDidLoad()
        //register cell
        self.washesCollectionView .register(UINib(nibName: "washCell", bundle: nil), forCellWithReuseIdentifier: washCellIdentifier)
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        Utils.showProgress()
        var payload: [String:AnyObject] = [String:AnyObject]()
        payload["Carid"] = 40259 as AnyObject?
        let request = APIRequestHelper.RequestTask(parameters: payload)
        request.perform(withSuccess: {responseData in
            self.response = responseData
            self.packageLbl.text = responseData.data[0].PackageName
            self.renewalDateLbl.text = responseData.data[0].EndDate
            self.nextWashDateLbl.text = responseData.data[0].StartDate
            
            // setting collectionview Delegets and datasources
            self.washesCollectionView.delegate = self
            self.washesCollectionView.dataSource = self
            Utils.dissmissProgress()
        }, failure: {error in
            Utils.dissmissProgress()
            Utils.apiErrorHandling(error: error.errorModel!)
            
        })
    }
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (response?.data[0].userWashes.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.row)
        let userwash = response?.data[0].userWashes[indexPath.row]
        let washCell : washCell = collectionView .dequeueReusableCell(withReuseIdentifier: washCellIdentifier, for: indexPath) as! washCell
        washCell.imageView.image = UIImage.init(named: "image-1")
        washCell.imageUrl = nil
        if let washImages = userwash?.lstWashImages{
            if washImages.count > 0{
                if let url = washImages[0].ImageURL{
                    washCell.imageUrl = url
                }
            }
        }
        washCell.dateLbl.text = userwash?.WashDateApi
        washCell.washType.text = userwash?.ServiceName
        washCell.setupImage()
        return washCell
    }
    
    
}
