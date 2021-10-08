//
//  Timezone.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import ObjectMapper

class Timezone: NSObject, Mappable {

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        offset <- map["offset"]
        mDescription <- map["description"]
    }
    
    
    var offset: String?
    var mDescription: String?
    
}
