//
//  Dob.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import ObjectMapper

class Dob: NSObject, Mappable {

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        date <- map["date"]
        age <- map["age"]
    }
    
    
    var date: String?
    var age: String?
    
}
