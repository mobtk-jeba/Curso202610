//
//  LoginVC.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 26/10/26.
//

import UIKit


class LoginVC: UIViewController {

    let json = """
    {
        "user": [
            {
                "nwid": 1,
                "nwtitle": "Mega Procesión de Catrinas 2026 en CDMX",
                "nwdesc": "Entre catrinas, rostros pintados y el orgullo por las tradiciones mexicanas, la Ciudad de México se prepara para vivir una de las celebraciones más emblemáticas del Día de Muertos. Lo que comenzó el 26 de octubre de 2014 como una iniciativa de Jessy Esquivias, creadora y productora del proyecto, con apenas 300 participantes y el apoyo de un pequeño grupo de maquillistas, se convirtió en un movimiento cultural que se celebra año con año.\\n\\nEste domingo 25 de octubre, la Mega Procesión de Catrinas 2026 volverá a llenar de color y tradición algunas de las principales avenidas de la capital; una fiesta donde la muerte se viste de arte y la cultura mexicana cobra vida",
                "nwimage": "https://www.eluniversal.com.mx/resizer/v2/NDDTJK4JEZE5LMOM2A2DWGWA2A.jpeg?auth=a05afd7e80bb50340a6d98cd8f7d65659bcffa6c0d656d6fc1fb84707e135973",
                "nwurl": "https://www.eluniversal.com.mx/metropoli/mega-procesion-de-catrinas-2026-en-cdmx-sigue-en-vivo-el-recorrido-y-consulta-las-alternativas-viales/",
                "nwdate": "2026-10-26T06:00:00.000Z",
                "nwstatus": 1,
                "nwupdate": "2026-10-26T06:58:14.000Z"
            }
        ],
        "valid": 1,
        "message": "Ok, todo bien"
    }
    """.data(using: .utf8)!
    
    struct RespuestaNoticias : Codable {
        let user: [Noticia]?
        let valid: Int
        let message: String?
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let not1 = Noticia(id: 1, titulo: "Prueba", descripcion: "descripcion de mi noticia de prueba", imagen: nil, url: nil, fecha: "2026-10-26")

        var not2 = not1
        not2.marcarLeida()*/

        do{
            let respuesta = try JSONDecoder().decode(RespuestaNoticias.self, from: json)
            for n in respuesta.user ?? [] {
                print(n.id, n.titulo)
            }
        }catch let error{
            print("Error al decodificar JSON: \(error)")
        }

    }
   
}
