//
//  StringExtension.swift
//  SpaceX
//
//  Created by Nitin Soni on 28/01/23.
//

import Foundation

extension String {

func getLaunchDate() -> Date?{
    
   let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
  let date = dateFormatter.date(from: self)
  return date
}

}
