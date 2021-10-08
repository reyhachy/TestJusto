//
//  Street.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import ObjectMapper

class Street: NSObject, Mappable {

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        number <- map["number"]
        name <- map["name"]
    }
    
    
    var number: String?
    var name: String?
    
}
