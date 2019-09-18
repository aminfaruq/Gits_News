//
//  GitsFramework.swift
//  Gits News
//
//  Created by Amin faruq on 16/09/19.
//  Copyright © 2019 Amin faruq. All rights reserved.
//

import UIKit
import HexColors

public class RoundedBorderButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 6.0 //default radius
    @IBInspectable var borderWidth: CGFloat = 1.0 //default border widht
    @IBInspectable var borderColor: UIColor = UIColor("#CDD6DF")! //default border color
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    public func setCorner(radius: CGFloat) {
        cornerRadius = radius
        layer.cornerRadius = cornerRadius
    }
    
    public func setBorder(color: String) {
        borderColor = UIColor(color)!
        layer.borderColor = borderColor.cgColor
    }
    
    public func setBorder(width: CGFloat) {
        borderWidth = width
        layer.borderWidth = borderWidth
    }
}
