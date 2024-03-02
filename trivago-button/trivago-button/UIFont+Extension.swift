//
//  UIFont+Extension.swift
//  trivago-button
//
//  Created by Iheb Rahali on 29.02.24.
//

import UIKit

extension  UIFont {
    static func proximaNova(_ size: CGFloat) -> UIFont { return UIFont(name: "Proxima Nova", size: size) ?? UIFont.systemFont(ofSize: size)}
    static func proximaNovaRegular(_ size: CGFloat) -> UIFont { return UIFont(name: "ProximaNova-Regular", size: size) ?? UIFont.systemFont(ofSize: size)}
    static func proximaNovaBold(_ size: CGFloat) -> UIFont { return UIFont(name: "Proxima Nova Bold", size: size) ?? UIFont.systemFont(ofSize: size)}

}
