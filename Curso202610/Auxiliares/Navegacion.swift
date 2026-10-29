//
//  Navegacion.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 28/10/26.
//

enum Segue:String {
    case signup = "sLoginSignup", recordar = "sLoginRecordar", menu = "sLoginMenu"
    case noticias = "sMenuNoticias", checkin = "sMenuCheckin"
    case notificaciones = "sMenuNotificaciones", perfil = "sMenuPerfil", tareas = "sMenuTareas"
    case detalleNoticia = "sNoticiasDetalle"
}

enum SeccionMenu: Int {
    case noticias=1, checkin=2, notificaciones=3, perfil=4, tareas=5

    var segue: Segue {
        switch self {
        case .noticias: return .noticias
        case .checkin: return .checkin
        case .notificaciones: return .notificaciones
        case .perfil: return .perfil
        case .tareas: return .tareas
        }
    }
}
