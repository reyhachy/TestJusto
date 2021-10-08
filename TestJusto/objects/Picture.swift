//
//  Picture.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import ObjectMapper

class Picture: NSObject, Mappable {

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        large <- map["large"]
        medium <- map["medium"]
    }
    
    
    var large: String?
    var medium: String?
    
}
