//
//  NoticiaCell.swift
//  Curso202610
//
//  Created by CARLOS GABRIEL TORRES PAEZ on 28/10/26.
//

import UIKit

class NoticiaCell: UITableViewCell {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var fondo: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
