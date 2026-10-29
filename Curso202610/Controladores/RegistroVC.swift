
//
//  RegistroVC.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 26/10/26.
//

import UIKit


class RegistroVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtNom: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPsw1: UITextField!
    @IBOutlet weak var txtPsw2: UITextField!
    @IBOutlet weak var btnAccept: UIButton!
    @IBOutlet weak var swTerminos: UISwitch!

    var isAccepted: Bool = false





    //MARK: Actions

    @IBAction func mostrarPsw(_ sender: Any) {
        txtPsw1.isSecureTextEntry.toggle()
        txtPsw2.isSecureTextEntry.toggle()
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func goSignUp(_ sender: Any) {
        if !swTerminos.isOn {
            self.showAlert(title: "Error", message: "Debes aceptar los términos y condiciones")
        }

    }

    @IBAction func aceptarTC(_ sender: Any) {
        if isAccepted {
            isAccepted = false
            btnAccept.setImage(UIImage.init(named: "checkbox"), for: .normal)
        }else{
            isAccepted = true
            btnAccept.setImage(UIImage.init(named: "checkbox_on"), for: .normal)
        }
    }
    


    //MARK: Delegates

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtNom {
            txtEmail.becomeFirstResponder()
        }else if textField == txtEmail {
            txtPsw1.becomeFirstResponder()
        }else if textField == txtPsw1 {
            txtPsw2.becomeFirstResponder()
        }else{
            txtPsw2.resignFirstResponder()
        }
        return true
    }




    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
