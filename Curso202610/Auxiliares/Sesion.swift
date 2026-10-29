//
//  Sesion.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 29/10/26.
//

import Foundation


final class Sesion {

    static let shared = Sesion()
    private init() {}
    private let clave = "user"

    var user: User?{
        get {
            guard let data = UserDefaults.standard.data(forKey: clave) else { return nil }
            return try? JSONDecoder().decode(User.self, from: data)
        }
        set {
            if let newValue, let data = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(data, forKey: clave)
            } else {
                UserDefaults.standard.removeObject(forKey: clave)
            }
        }
    }

    var haySesion: Bool {
        return user != nil
    }

    func cerrarSesion() {
        user = nil
    }
}
