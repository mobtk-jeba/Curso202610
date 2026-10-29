//
//  NoticiasVC.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 28/10/26.
//

import UIKit
import SVProgressHUD
import SDWebImage




class NoticiasVC: UIViewController, UITableViewDelegate, UITableViewDataSource, rqDelegate {


    @IBOutlet weak var tabla: UITableView!
    var arrNoticias: [Noticia] = []
    let formatter1: ISO8601DateFormatter = ISO8601DateFormatter()
    let formatter2: DateFormatter = DateFormatter()



    //MARK: table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNoticias.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NoticiaCell = tableView.dequeueReusableCell(withIdentifier: "noticia", for: indexPath) as! NoticiaCell

        cell.imagen.image = UIImage(named: "noticia")

        cell.fondo.layer.cornerRadius = 12
        cell.fondo.layer.borderColor = UIColor.lightGray.cgColor
        cell.fondo.layer.borderWidth = 0.5

        cell.fondo.layer.shadowColor = UIColor.black.cgColor
        cell.fondo.layer.shadowOpacity = 0.4
        cell.fondo.layer.shadowOffset = CGSize(width: 2, height: 2)
        cell.fondo.layer.shadowRadius = 2

        cell.imagen.layer.cornerRadius = 12
        cell.selectionStyle = .none

        let info: Noticia = arrNoticias[indexPath.row]
        let date = formatter1.date(from: info.fecha)

        cell.titulo.text = info.titulo
        cell.fecha.text = formatter2.string(from: date ?? Date())
        cell.imagen.sd_setImage(with: URL(string: info.imagen ?? "")!)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(Segue.detalleNoticia, sender: arrNoticias[indexPath.row])
    }


    //MARK: Actions

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }


    //MARK: Delegates

    func querySuccess(result: RespuestaServicios, cons: String) {
        if result.valid == 1 {
            if let noticias: [Noticia] = result.news {
                self.arrNoticias = noticias
                self.tabla.reloadData()
                SVProgressHUD.dismiss()
            }
        }
    }

    func queryError(error: String) {

    }




    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        SVProgressHUD.show()
        let rq = RemoteQueries()
        rq.remoteQuery(query: "110|\(Sesion.shared.user?.id ?? 0)", cons: "news", delegate: self)

        formatter2.dateFormat = "dd/MM/yyyy"
        formatter2.locale = Locale(identifier: "es_ES")
    }


    //MARK: Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == Segue.detalleNoticia.rawValue){
            let vc = segue.destination as! NoticiaDetalle
            vc.noticia = sender as? Noticia
        }
    }
}
