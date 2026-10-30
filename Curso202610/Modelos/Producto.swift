//
//  Producto.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 30/10/26.
//

struct Producto: Codable {
    let id: Int
    let nombre: String?
    let desc: String?
    let precio: String
    let imagen: String?
    var selected: Bool = false

    enum CodingKeys: String, CodingKey {
        case id = "prodid", nombre = "prodname", precio = "prodprice"
        case desc = "proddesc", imagen = "prodimage"
    }
}
