//
//  TareasVC.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 28/10/26.
//

import UIKit
import SVProgressHUD

class TareasVC: UIViewController, rqDelegate, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tabla: UITableView!
    var arrProducto: [Producto] = []
    

    //MARK: table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProducto.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TareaCell = tableView.dequeueReusableCell(withIdentifier: "tarea", for: indexPath) as! TareaCell

        cell.precio.layer.cornerRadius = 6
        cell.precio.clipsToBounds = true
        cell.selectionStyle = .none

        let info: Producto = arrProducto[indexPath.row]

        cell.nombre.text = info.nombre
        cell.precio.text = Double(info.precio)?.formatted(.currency(code: "MXN"))

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(Segue.detalleTarea, sender: arrProducto[indexPath.row])
    }




    //MARK: Delegates

    func querySuccess(result: RespuestaServicios, cons: String) {
        if result.valid == 1 {
            if let productos: [Producto] = result.products {
                self.arrProducto = productos
                self.tabla.reloadData()
                SVProgressHUD.dismiss()
            }
        }
    }

    func queryError(error: String) {

    }




    //MARK: Actions

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }


    

    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        SVProgressHUD.show()
        let rq = RemoteQueries()
        rq.remoteQuery(query: "115|\(Sesion.shared.user?.id ?? 0)", cons: "prods", delegate: self)
    }




    //MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == Segue.detalleTarea.rawValue){
            let vc = segue.destination as! TareaDetalle
            vc.producto = sender as? Producto
        }
    }

}
