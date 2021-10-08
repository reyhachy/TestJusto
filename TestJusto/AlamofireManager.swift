//
//  AlamofireManager.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//


import Foundation
import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SystemConfiguration

public protocol AlamofireResponseDelegate {
    
    func onRequestWs()
    
    func onSuccessLoadResponse(requestUrl : String, response : Mappable)
    
    func onErrorLoadResponse(requestUrl : String, messageError : String)
    
    func onErrorConnection()
    
}


class AlamofireManager<Res : Mappable>{
    
    open var requestUrl : String!
    open var request : Alamofire.Request?
    let jsonEncoder = JSONEncoder()
    let jsonDecoder = JSONDecoder()
    open var delegate : AlamofireResponseDelegate!

     func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    var manager: Alamofire.SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "https://189.203.181.233": .disableEvaluation,
            "189.203.181.233": .disableEvaluation,
            
            "https://cs3.salesforce.com": .disableEvaluation,
            "cs3.salesforce.com": .disableEvaluation
            
        ]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        let manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        return manager
    }()


    
    func getHeaders() -> [String : String]{
        let headers = [
            "Accept": "application/json; charset=UTF-8",
            "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
        ]
        return headers
    }
    
    open func get(){
        if isConnectedToNetwork(){
            delegate.onRequestWs()
            let header = getHeaders()
            request = manager.request(self.requestUrl, method: HTTPMethod.get, encoding: JSONEncoding.default, headers: header).responseObject { [self]
                    (response: DataResponse<Res>) in
                switch response.result {
                case .success:
                    self.delegate.onSuccessLoadResponse( requestUrl: requestUrl, response: response.result.value! as Res)
                    
                case .failure(_):
                    let statusCode = response.response?.statusCode ?? -1
                    self.delegate.onErrorLoadResponse(requestUrl : self.requestUrl!, messageError : "status \(statusCode)")
                
                }
            }
        }else{
            delegate.onErrorConnection()
        }
    }
    
    func setValues(requestUrl: String, delegate : AlamofireResponseDelegate){
        self.delegate = delegate
        self.requestUrl = requestUrl
    }

}
