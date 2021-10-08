//
//  UserHomeVC.swift
//  TestJusto
//
//  Created by Juan Reynaldo Escobar Miron on 08/10/21.
//

import UIKit

class UserHomeVC: BaseViewController, UserObserver{
    
    @IBOutlet weak var perfilImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var telephonoLabel: UILabel!
    @IBOutlet weak var celularLabel: UILabel!
    @IBOutlet weak var correoLabel: UILabel!
    @IBOutlet weak var direccionLabel: UILabel!
    @IBOutlet weak var edadLabel: UILabel!
    
    var mUserHomeVM : UserHomeVM!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setView(view: self.view)
        mUserHomeVM = UserHomeVM(viewController: self)
        mUserHomeVM.atachView(observer: self)
        mUserHomeVM.getUser()
    }
    
    func onSuccesGetUser(response : UserResponse) {
        if(response.results[0] != nil){
            let object = response.results[0]
            nameLabel.text = String("Nombre : \(object.name?.title ?? ""). \(object.name?.first ?? "") \(object.name?.last ?? "")")
            telephonoLabel.text = String("Telefono : \(object.phone!)")
            celularLabel.text = String("Celular : \(object.cell!)")
            correoLabel.text = String("Correo : \(object.email!)")
            direccionLabel.text = String("Direccion : \(object.location?.street?.name ?? "") \(object.location?.street?.number ?? ""), \(object.location?.city ?? ""), \(object.location?.state ?? ""), \(object.location?.country ?? "")")
            edadLabel.text = String("Edad : \(object.dob?.age ?? "No disponible")")
            perfilImage.image = UIImage.URLimage(url: object.picture?.large ?? "")
        }
        
    }
    func onError() {
        let alert = UIAlertController(title: "Error", message: "ha ocurrido un error intentelo mas tarde", preferredStyle: UIAlertController.Style.alert)
    
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                alert.dismiss(animated: false, completion: nil)
        }))
        self.present(alert, animated: true)
    }
}
