//
//  Extensiones.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import Foundation
import UIKit

extension UIView {
    public static var primerColor : UIColor!
    
    @IBInspectable
    /// Border color of view; also inspectable from Storyboard.
    public var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            layer.borderColor = color.cgColor
        }
    }
    
    @IBInspectable
    /// Border width of view; also inspectable from Storyboard.
    public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    // Corner radious of view
    public var radius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
        
    @IBInspectable
    // Corner radious of view
    public var CornerLeftView: Bool {
        get {
            return true
        }
        set {
            if newValue{
                layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
            }
            
        }
    }
    
    @IBInspectable
    // Corner radious of view
    public var CornerBootomView: Bool {
        get {
            return true
        }
        set {
            if newValue{
                layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner,]
            }
            
        }
    }
    
    @IBInspectable
    // Corner radious of view
    public var CornerTopView: Bool {
        get {
            return true
        }
        set {
            if newValue{
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,]
            }
            
        }
    }

    @IBInspectable
        // Corner radious of view
    var coorner: CACornerMask {
            get {
                return layer.maskedCorners
                   }
                   set {
                       layer.maskedCorners = newValue
                   }
        }
//
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    
}

extension UIImage {
    
    
    public class func URLimage(url: String) -> UIImage? {
        // Validate URL
        guard let bundleURL = URL(string: url) else {
            print("SwiftGif: This image named \"\(url)\" does not exist")
            return nil
        }
        
        // Validate data
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(url)\" into NSData")
            return nil
        }
        
        return UIImage(data: imageData)
    }
    
}
