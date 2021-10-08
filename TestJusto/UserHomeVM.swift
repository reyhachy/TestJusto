//
//  UserHomeVM.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import ObjectMapper

protocol UserObserver{
    func onSuccesGetUser(response : UserResponse)
    func onError()
}

class UserHomeVM : AlamofireResponseDelegate{
    
    var userObserver : UserObserver?
    var view : BaseViewController?
    var mAlamofireManager : AlamofireManager<UserResponse>?
    
    init (viewController : BaseViewController){
        view = viewController
        mAlamofireManager = AlamofireManager<UserResponse>()
    }
    
    func atachView(observer : UserObserver){
        userObserver = observer
    }
    
    func getUser(){
        view?.showLoading(message: "cargando")
        mAlamofireManager?.setValues(requestUrl: "https://randomuser.me/api/", delegate: self)
        mAlamofireManager?.get()
    }
    
    func onRequestWs() {
        
    }
    
    func onSuccessLoadResponse(requestUrl: String, response: Mappable) {
        var mResponse = response as! UserResponse
        userObserver?.onSuccesGetUser(response: mResponse)
        view?.hideLoading()
    }
    
    func onErrorLoadResponse(requestUrl: String, messageError: String) {
        userObserver?.onError()
    }
    
    func onErrorConnection() {
        userObserver?.onError()
    }
}
