//
//  Id.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import ObjectMapper

class Id: NSObject, Mappable {

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        value <- map["value"]
    }
    
    
    var name: String?
    var value: String?
    
}
