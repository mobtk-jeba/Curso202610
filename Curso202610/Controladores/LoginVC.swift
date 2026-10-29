//
//  LoginVC.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 26/10/26.
//

import UIKit
import SVProgressHUD


class LoginVC: UIViewController, UITextFieldDelegate, rqDelegate {


    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtPsw: UITextField!



    //MARK: Actions

    @IBAction func mostrarPsw(_ sender: Any) {
        txtPsw.isSecureTextEntry.toggle()
    }
    
    @IBAction func goSignUp(_ sender: Any) {
        performSegue(Segue.signup, sender: nil)
        //self.performSegue(withIdentifier: "sLoginSignup", sender: nil)
    }

    @IBAction func goSignIn(_ sender: Any) {
        if txtUsuario.text!.isEmpty || txtPsw.text!.isEmpty {
            SVProgressHUD.showError(withStatus: "Debe ingresar su usuario y contraseña")
            return
        }
        if !txtUsuario.text!.esEmail {
            SVProgressHUD.showError(withStatus: "Debe ingresar un email válido")
            return
        }
        SVProgressHUD.show()
        let query = "100|\(txtUsuario.text ?? "")|\(txtPsw.text ?? "")"
        let rq = RemoteQueries.init()
        rq.remoteQuery(query: query, cons: "login", delegate: self)
    }

    @IBAction func goRecordar(_ sender: Any) {
        performSegue(Segue.recordar, sender: nil)
    }




    //MARK: Delegates

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtUsuario {
            txtPsw.becomeFirstResponder()
        }else{
            txtPsw.resignFirstResponder()
        }
        return true
    }

    func querySuccess(result: RespuestaServicios, cons: String) {
        print(result)
        if result.valid == 1, let usuario = result.user?.first{
            Sesion.shared.user = usuario
        }
        SVProgressHUD.dismiss()
        performSegue(Segue.menu, sender: nil)
    }

    func queryError(error: String) {
    }


    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        txtUsuario.attributedPlaceholder = NSAttributedString(string: "Usuario", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        txtPsw.attributedPlaceholder = NSAttributedString(string: "Contraseña", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])

        if Sesion.shared.haySesion {
            performSegue(Segue.menu, sender: nil)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

}
