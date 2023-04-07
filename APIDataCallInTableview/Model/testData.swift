//
//  testData.swift
//  APIDataCallInTableview
//
//  Created by mayank ranka on 29/03/23.
//

import UIKit

class testData: NSObject {
    
    var title : String?

     init(dictionary : [String : Any]) {
        super.init()
        title = dictionary["title"] as! String?
    }
}
