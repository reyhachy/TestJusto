//
//  Location.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import ObjectMapper

class Location: NSObject, Mappable {

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        street <- map["street"]
        city <- map["city"]
        state <- map["state"]
        country <- map["country"]
        postcode <- map["postcode"]
        coordinates <- map["coordinates"]
        timezone <- map["timezone"]
    }
    
    
    var street: Street?
    var city: String?
    var state: String?
    var country: String?
    var postcode: String?
    var coordinates: Coordinates?
    var timezone: Timezone?
    
}
