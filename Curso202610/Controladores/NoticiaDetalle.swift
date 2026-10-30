//
//  NoticiaDetalle.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 29/10/26.
//

import UIKit
import SDWebImage
import SVProgressHUD

class NoticiaDetalle: UIViewController {
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var contHeight: NSLayoutConstraint!
    @IBOutlet weak var txtDesc: UITextView!

    var noticia:Noticia?



    //MARK: Actions

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func Share(_ sender: Any) {
        let activity = UIActivityViewController(activityItems: [noticia?.url ?? ""], applicationActivities: [])
        activity.popoverPresentationController?.sourceView = self.view
        present(activity, animated: true)
    }
    
    @IBAction func View(_ sender: Any) {
        guard let url = URL(string: noticia?.url ?? "") else {
            SVProgressHUD.showError(withStatus: "Error al cargar la URL")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    

    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        titulo.text = noticia?.titulo
        desc.text = noticia?.descripcion
        txtDesc.text = noticia?.descripcion
        imagen.sd_setImage(with: URL(string: noticia?.imagen ?? "")!)

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        /*let texto = NSAttributedString(string: noticia?.descripcion ?? "",
                                      attributes: [NSAttributedString.Key.font:UIFont(name: "Helvetica Neue", size: 17.0)!])

        let txtHeight:CGFloat = texto.height(width: desc.frame.size.width)
        height.constant = txtHeight
        contHeight.constant = txtHeight + 312
        scroll.contentSize = CGSize(width: 100, height: contHeight.constant)*/
    }
}
