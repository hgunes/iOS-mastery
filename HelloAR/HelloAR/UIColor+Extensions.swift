//
//  UIColor+Extensions.swift
//  HelloAR
//
//  Created by Harun Gunes on 23/07/2022.
//

import UIKit

extension UIColor {
    
    static func random() -> UIColor {
        UIColor(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    }
}
