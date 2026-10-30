//
//  NoticiaDetalle.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 29/10/26.
//

import UIKit
import SDWebImage


protocol ProductoDetailDelegate: AnyObject {
    func prodDetail(_ vc: TareaDetalle, didUpdate producto: Producto)
}

class TareaDetalle: UIViewController {
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblPrecio: UILabel!
    @IBOutlet weak var txtDesc: UITextView!
    @IBOutlet weak var swSelected: UISwitch!

    var producto:Producto?

    weak var delegate: ProductoDetailDelegate?



    //MARK: Actions

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func guardar(_ sender: Any) {
        //producto?.selected = swSelected.isOn

        delegate?.prodDetail(self, didUpdate: producto!)
        navigationController?.popViewController(animated: true)
    }


    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        lblNombre.text = producto?.nombre
        txtDesc.text = producto?.desc
        lblPrecio.text = Double(producto?.precio ?? "")?.formatted(.currency(code: "MXN"))
        imagen.sd_setImage(with: URL(string: producto?.imagen ?? "")!)
        //swSelected.isOn = producto?.selected ?? false
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
}
