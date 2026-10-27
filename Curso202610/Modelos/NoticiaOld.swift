//
//  NoticiaOld.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 26/10/26.
//

import Foundation

class NoticiaOld: NSObject {
    let title: String
    let desc: String
    let id: Int
    let image: String
    let update: String
    let url: String

    var leida: Bool = false

    init(title: String, desc: String, id: Int, image: String, update: String, url: String) {
        self.title = title
        self.desc = desc
        self.id = id
        self.image = image
        self.update = update
        self.url = url
    }
}
