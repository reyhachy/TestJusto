//
//  Coordinates.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import ObjectMapper

class Coordinates: NSObject, Mappable {

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
    
    
    var latitude: String?
    var longitude: String?
    
}
