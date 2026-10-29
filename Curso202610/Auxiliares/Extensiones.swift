//
//  Extensiones.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 27/10/26.
//
import Foundation
import UIKit

extension String {
    var esEmail: Bool {
        (range(of:#"^[^@\s]+@[^@\s]+\.[^@\s]+$"#, options:.regularExpression) != nil)
    }
}

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
}

extension UIViewController{
    func performSegue(_ segue: Segue, sender: Any? = nil){
        performSegue(withIdentifier: segue.rawValue, sender: sender)
    }
}

extension UIView {
    func redondear(_ radio: CGFloat) {
        layer.cornerRadius = radio
        layer.masksToBounds = true
    }
}

extension NSAttributedString {
    func height(width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        return ceil(boundingBox.height)
    }
}
