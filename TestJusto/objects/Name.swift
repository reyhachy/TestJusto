//
//  Name.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import ObjectMapper

class Name: NSObject, Mappable {

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        first <- map["first"]
        last <- map["last"]
    }
    
    
    var title: String?
    var first: String?
    var last: String?
    
}
