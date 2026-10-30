//
//  PerfilVC.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 28/10/26.
//

import UIKit
import SVProgressHUD

class PerfilVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var btnCambiar: UIButton!
    @IBOutlet weak var txtPerfil: UITextField!
    @IBOutlet weak var vPicker: UIView!
    @IBOutlet weak var pkPerfil: UIPickerView!
    @IBOutlet weak var pkFecha: UIDatePicker!
    
    var imagePicker: UIImagePickerController!
    let options: [String] = ["Administrador", "Operador", "Cliente", "Invitado"]
    let formatter2: DateFormatter = DateFormatter()


    //MARK: Delegates

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        let image = info[.originalImage] as! UIImage
        self.imgFoto.image = image
        self.btnCambiar.setImage(nil, for: .normal)
        self.btnCambiar.configuration?.image = nil
        self.dismiss(animated: true, completion: nil)
    }



    //MARK: Pickerview

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }

    /*
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtPerfil.text = options[row]
        vPicker.isHidden = true
    }*/


    //MARK: Actions

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cambiarFoto(_ sender: Any) {
        let alert = UIAlertController(title: "Cambiar foto", message: "¿Quieres tomar una foto o elegir una de tu galeria?", preferredStyle: .alert)

        let action1 = UIAlertAction(title: "Tomar foto", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker = UIImagePickerController()
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            }else {
                SVProgressHUD.showError(withStatus: "No hay camara disponible en este dispositivo")
            }
        }

        let action2 = UIAlertAction(title: "Elegir de galeria", style: .default) { (action) in
            self.imagePicker = UIImagePickerController()
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)

        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func selectPerfil(_ sender: Any) {
        vPicker.isHidden = false
    }
    
    @IBAction func cerrarPicker(_ sender: Any) {
        //let selected = pkPerfil.selectedRow(inComponent: 0)
        //txtPerfil.text = options[selected]
        txtPerfil.text = formatter2.string(from: pkFecha.date)
        vPicker.isHidden = true
    }
    
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        imgFoto.layer.cornerRadius = 120
        imgFoto.contentMode = .scaleAspectFill


        formatter2.dateFormat = "dd/MM/yyyy"
        formatter2.locale = Locale(identifier: "es_ES")
        let date = formatter2.date(from: "12/03/2026")
        //pkFecha.setDate(date ?? Date(), animated: false)
        pkFecha.minimumDate = Date()
    }

}
