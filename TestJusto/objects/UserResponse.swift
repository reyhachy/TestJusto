//
//  UserResponse.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import ObjectMapper

class UserResponse: NSObject, Mappable{
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        info <- map["info"]
        results <- map["results"]
    }
    
    var info : Info?
    var results : [ResultsResponse] = []
    
    
}
