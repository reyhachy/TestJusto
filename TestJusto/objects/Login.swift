//
//  Login.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import ObjectMapper

class Login: NSObject, Mappable {

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        uuid <- map["uuid"]
        username <- map["username"]
        password <- map["password"]
        salt <- map["salt"]
        md5 <- map["md5"]
        sha1 <- map["sha1"]
        sha256 <- map["sha256"]
    }
    
    
    var uuid: String?
    var username: String?
    var password: String?
    var salt: String?
    var md5: String?
    var sha1: String?
    var sha256: String?
    
}
