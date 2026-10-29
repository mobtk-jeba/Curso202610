

//
//  RecordarVC.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 26/10/26.
//

import UIKit


class RecordarVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtEmail: UITextField!




    //MARK: Actions

    @IBAction func recordar(_ sender: Any) {
        
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }




    //MARK: Delegates

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtEmail.resignFirstResponder()
        return true
    }




    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
