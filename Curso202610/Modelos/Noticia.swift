//
//  Noticia.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 26/10/26.
//

struct Noticia: Codable {
    let id: Int
    let titulo: String
    let descripcion: String
    let imagen: String?
    let url: String?
    let fecha: String

    var leida: Bool = false

    mutating func marcarLeida() {
        leida = true
    }

    enum CodingKeys: String, CodingKey {
        case id = "nwid", titulo = "nwtitle", descripcion = "nwdesc"
        case imagen = "nwimage", url = "nwurl", fecha = "nwdate"
    }
}

nonisolated struct RespuestaServicios : Codable, Sendable {
    let user: [User]?
    let news: [Noticia]?
    let products: [Producto]?
    let valid: Int
    let message: String?
}
