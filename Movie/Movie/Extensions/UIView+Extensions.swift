//
//  UIView+Extensions.swift
//  Movie
//
//  Created by Burak Nurçiçek on 14.09.2022.
//

import UIKit

extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
    
    func setConstraints(top: NSLayoutYAxisAnchor? = nil,
                        topOffset: CGFloat? = nil,
                        leading: NSLayoutXAxisAnchor? = nil,
                        leadingOffset: CGFloat? = nil,
                        bottom: NSLayoutYAxisAnchor? = nil,
                        bottomOffset: CGFloat? = nil,
                        trailing: NSLayoutXAxisAnchor? = nil,
                        trailingOffset: CGFloat? = nil,
                        centerX: NSLayoutXAxisAnchor? = nil,
                        centerY: NSLayoutYAxisAnchor? = nil,
                        width: CGFloat? = nil,
                        height: CGFloat? = nil) {
            
            translatesAutoresizingMaskIntoConstraints = false
            
            if let top = top {
                self.topAnchor.constraint(equalTo: top, constant: topOffset ?? .zero).isActive = true
            }
            
            if let leading = leading {
                self.leadingAnchor.constraint(equalTo: leading, constant: leadingOffset ?? .zero).isActive = true
            }
            
            if let bottom = bottom {
                self.bottomAnchor.constraint(equalTo: bottom, constant: -(bottomOffset ?? .zero)).isActive = true
            }
            
            if let trailing = trailing {
                self.trailingAnchor.constraint(equalTo: trailing, constant: -(trailingOffset ?? .zero)).isActive = true
            }
            
            if let centerX = centerX {
                self.centerXAnchor.constraint(equalTo: centerX).isActive = true
            }
            
            if let centerY = centerY {
                self.centerYAnchor.constraint(equalTo: centerY).isActive = true
            }
            
            if let width = width {
                widthAnchor.constraint(equalToConstant: width).isActive = true
            }
            
            if let height = height {
                heightAnchor.constraint(equalToConstant: height).isActive = true
            }
        }
}
