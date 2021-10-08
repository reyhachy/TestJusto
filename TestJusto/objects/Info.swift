//
//  Info.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import ObjectMapper

class Info: NSObject, Mappable {

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        seed <- map["seed"]
        version <- map["version"]
        results <- map["results"]
        page <- map["page"]
    }
    
    
    var seed: String?
    var version: String?
    var results: Int?
    var page: Int?
    
}
