
//
//  User.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 26/10/26.
//


struct User: Codable {
    let id: Int
    let nombre: String
    let mail: String
    let numemp: String?

    enum CodingKeys: String, CodingKey {
        case id = "usrid", nombre = "usrname", mail = "usrmail"
        case numemp = "usrnumemp"
    }
}
