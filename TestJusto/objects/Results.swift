//
//  results.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import ObjectMapper

class ResultsResponse: NSObject, Mappable {

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        gender <- map["gender"]
        name <- map["name"]
        location <- map["location"]
        email <- map["email"]
        login <- map["login"]
        dob <- map["dob"]
        registered <- map["registered"]
        phone <- map["phone"]
        cell <- map["cell"]
        id <- map["id"]
        picture <- map["picture"]
        nat <- map["nat"]
    }
    
    
    var gender: String?
    var name: Name?
    var location: Location?
    var email: String?
    var login: Login?
    var dob: Dob?
    var registered: Registered?
    var phone: String?
    var cell: String?
    var id: Id?
    var picture: Picture?
    var nat: String?
    
}
