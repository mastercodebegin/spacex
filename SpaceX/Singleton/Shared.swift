//
//  File.swift
//  SpaceX
//
//  Created by Nitin Soni on 28/01/23.
//

import Foundation

class Shared {
    
   private init() {
        
    }
    
    static let sharedInstance = Shared()
    
    func getDate(strDate : String) ->  String{
        
       let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
          let date = dateFormatter.date(from: strDate)
        let dateFormatter1 = DateFormatter()
           dateFormatter1.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter1.string(from: date!)
        return dateString
    }
    
    func getYear(strDate : String) ->  String?{
        
       let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard  let date = dateFormatter.date(from: strDate) else { return nil}
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "yyyy"
        let dateString = dateFormatter1.string(from: date)
        return dateString
    }
    
    func changeFormat(str:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // input format
        let date = dateFormatter.date(from: str)!
       
        dateFormatter.dateFormat = "hh:mm a" // output format
        let string = dateFormatter.string(from: date)
        return string
    }
    
}
