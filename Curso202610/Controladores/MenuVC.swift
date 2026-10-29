//
//  MenuVC.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 28/10/26.
//

import UIKit

class MenuVC: UIViewController {


    //MARK: Actions
    @IBAction func Logout(_ sender: Any) {
        Sesion.shared.cerrarSesion()
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func goSection(_ sender: UIButton) {

        let identifier = SeccionMenu(rawValue: sender.tag) ?? .tareas
        performSegue(identifier.segue)

        //performSegue((SeccionMenu(rawValue: sender.tag) ?? .tareas).segue)
        /*var identifier: String = ""

        switch sender.tag {
        case 1: identifier = "sMenuNoticias"
        case 2: identifier = "sMenuCheckin"
        case 3: identifier = "sMenuNotificaciones"
        case 4: identifier = "sMenuPerfil"
        default : identifier = "sMenuTareas"
        }

        self.performSegue(withIdentifier: identifier, sender: nil)*/
    }
    


    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
   
}
