//
//  Model.swift
//  AmazePOC
//
//  Created by Ashwani Kumar on 17/07/19.
//  Copyright © 2019 Djubo. All rights reserved.
//

import Foundation
class ResponseModel : Codable {
    let status : Int
    let message: String
    let data :[DataModel]
}

class DataModel : Codable{
    let PackageName: String
    let StartDate: String
    let EndDate: String
    let TypeName: String
    let userWashes : [UserWashModel]
}

class UserWashModel : Codable {
    let ServiceName: String
    let WashDateApi: String
    let lstWashImages: [WashImageModel]
}

class WashImageModel: Codable {
    let ImageURL: String?
}
