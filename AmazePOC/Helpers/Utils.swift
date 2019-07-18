//
//  Utils.swift
//  AmazePOC
//
//  Created by Ashwani Kumar on 18/07/19.
//  Copyright © 2019 Djubo. All rights reserved.
//

import Foundation
import SVProgressHUD
import MaterialComponents.MaterialSnackbar


class Utils {
    
    class func showProgress(){
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.setBackgroundColor(UIColor.white)
        SVProgressHUD.show()
    }
    class func dissmissProgress(){
        SVProgressHUD.dismiss()
    }
    
    static func apiErrorHandling(error : APIErrorModel){
        Utils.showSnackBar(messageStr: "There is some error while processing your request. Please try after sometime.")
    }
    
    static func showSnackBar(messageStr : String){
        let message = MDCSnackbarMessage()
        message.text = messageStr
        MDCSnackbarManager.show(message)
    }
    
}
