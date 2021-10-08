//
//  BaseView.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import UIKit

class BaseViewController : UIViewController{
    
    var spinner : UIView?
    var cortina : UIView?
    var viewPrincipal : UIView?
    
    public func setView(view: UIView){
        self.viewPrincipal = view
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        } else {
        }
        
    }
    
    private func displayCortina(onView : UIView) -> UIView{
        let spinnerView = UIView()
        let assistantLabel = UILabel()
        spinnerView.frame = CGRect(x: 0, y: 0, width: onView.frame.width, height: onView.frame.height)
        //CGRect(x: 0, y: 0, width: onView.width,  height: onView.height)
        assistantLabel.frame = CGRect(x: 0, y: onView.frame.width + 20, width: onView.frame.width, height: onView.frame.height)
        spinnerView.backgroundColor = UIColor(white: 0x000000, alpha: 0.3)
        
        DispatchQueue.main.async {
            onView.addSubview(spinnerView)
            onView.addSubview(assistantLabel)
        }
        
        return spinnerView
    }
    
    private func displaySpinner(onView : UIView, message : String) -> UIView {
        let spinnerView = UIView()
        let titleLabel = UILabel()
        spinnerView.frame = CGRect(x: 0, y: 0, width: 100,  height: 100)
        spinnerView.center = onView.center
        spinnerView.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        spinnerView.layer.cornerRadius = 6
        
        titleLabel.text = message
        titleLabel.textColor = UIColor.white
        titleLabel.frame = CGRect(x: 15, y: 70, width: 100, height: 30)
        
        
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.frame = CGRect(x: 0, y: 0, width: 100,  height: 100)
        ai.startAnimating()
        ai.center = CGPoint(x: spinnerView.frame.size.width / 2,
                            y: spinnerView.frame.size.height / 2);
      
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
           // spinnerView.addSubview(titleLabel)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    private func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
    
    private func removeCortina(cortina : UIView){
        DispatchQueue.main.async {
            cortina.removeFromSuperview()
        }
    }
    
    func showLoading(message : String){
        if spinner == nil {
            cortina = displayCortina(onView: viewPrincipal!)
            spinner = displaySpinner(onView: viewPrincipal!, message: message)
        }
    }
    
    func hideLoading(){
        if spinner != nil {
            removeSpinner(spinner: spinner!)
            removeCortina(cortina: cortina!)
            spinner = nil
        }
    }
    
    func onlySpinner(){
        if(spinner == nil){
            spinner = displaySpinner(onView: viewPrincipal!, message: "")
        }
    }
    
    func removeSpinner(){
        if spinner != nil {
            removeSpinner(spinner: spinner!)
            spinner = nil
        }
    }
    
    
}
