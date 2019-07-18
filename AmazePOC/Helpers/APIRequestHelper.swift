//
//  APIRequestHelper.swift
//  AmazePOC
//
//  Created by Ashwani Kumar on 17/07/19.
//  Copyright © 2019 Djubo. All rights reserved.
//

import Foundation
import Alamofire
import TRON


class APIRequestHelper{
    static let tron = TRON(baseURL: APIRequestConstants.baseUrl)

    static func RequestTask(parameters: [String:AnyObject]) -> APIRequest<ResponseModel, APIErrorModel> {
        let request: APIRequest<ResponseModel, APIErrorModel> = tron.codable.request(APIRequestConstants.carInfoUrl)
        request.method = .post
        request.parameters = parameters
        request.parameterEncoding = URLEncoding.default
        return request
    }
}
