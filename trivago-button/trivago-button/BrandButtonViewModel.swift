//
//  BrandButtonView.swift
//  trivago-button
//
//  Created by Iheb Rahali on 29.02.24.
//

import UIKit

//MARK: - Bran Button View Model

class BrandButtonViewModel {
    
    let label: String
    let variant: BrandButtonVariant
    let leadingIcon: UIImage?
    let trailingIcon: UIImage?
    let iconColor: UIColor?
    let fullWidth: Bool
    let isButtonEnabled: Bool
    let size: BrandButtonSize
    let font: UIFont?
    let fontColor: UIColor?
    
    init(label: String,
         variant: BrandButtonVariant,
         leadingIcon: UIImage? = nil,
         trailingIcon: UIImage? = nil,
         iconColor: UIColor? = nil,
         fullWidth: Bool = false,
         buttonIsEnabled: Bool = true,
         size: BrandButtonSize = .regular,
         font: UIFont? = UIFont.proximaNovaBold(BrandButtonConstants.defaultFontSize),
         fontColor: UIColor? = nil) {
        
        self.label = label
        self.variant = variant
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.iconColor = iconColor
        self.fullWidth = fullWidth
        self.isButtonEnabled = buttonIsEnabled
        self.size = size
        self.font = font
        self.fontColor = fontColor
    }

}
