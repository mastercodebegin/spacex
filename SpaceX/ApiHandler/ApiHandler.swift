//
//  ApiHandler.swift
//  SpaceX
//
//  Created by Nitin Soni on 27/01/23.
//

import Foundation
import Alamofire

protocol ApihandlerProtocol {
    func getCompanyInfo(completion: ((CompanyInfo) -> Void)?)
    func getLaunchList(completion: (([Launch]) -> Void)?)
}

class ApiHandler: ApihandlerProtocol {
    func getCompanyInfo(completion: ((CompanyInfo) -> Void)?) {
        guard let url = URL(string: "https://api.spacexdata.com/v4/company") else {
            return
        }
        AF.request(URLRequest(url: url)).responseDecodable(of: CompanyInfo.self) { (response) in
            guard let companyInfo = response.value else {return}
            completion?(companyInfo)
        }
    }
    
    func getLaunchList(completion: (([Launch]) -> Void)?) {
        guard let url = URL(string: "https://api.spacexdata.com/v4/launches") else {
            return
        }
        AF.request(URLRequest(url: url)).responseDecodable(of: [Launch].self) { (response) in
            guard let launches = response.value else {return}
            completion?(launches)
        }
       
    }
    
    
}
