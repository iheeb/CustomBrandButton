//
//  BrandButtonStyler.swift
//  trivago-button
//
//  Created by Iheb Rahali on 29.02.24.
//

import UIKit
//MARK: Brand Button Styler
class BrandButtonStyler {
    
    //Apply styling to the button
    static func applyStyle(to button: BrandButton, with viewModel: BrandButtonViewModel) {
        animateStyling(for: button, with: viewModel)
        addTargetActions(for: button)
        updateLayout(for: button)
    }
    //animate the styling
    private static func animateStyling(for button: BrandButton, with viewModel: BrandButtonViewModel) {
        UIView.animate(withDuration: BrandButtonConstants.animationDuration) {
            configureButton(button: button, viewModel: viewModel)
            setBackgroundColor(for: button, isEnabled: viewModel.isButtonEnabled)
            setCustomFont(for: button, viewModel: viewModel)
            setCornerRadiusAndHeight(for: button, viewModel: viewModel)
            
            if viewModel.variant == .secondaryBlue || viewModel.variant == .secondaryGreen {
                applySecondaryStyle(for: button, viewModel: viewModel)
            }
        }
    }
    // Add target actions for touch events
    private static func addTargetActions (for button: BrandButton) {
        button.addTarget(self, action: #selector(handleButtonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(handleButtonTouchUpInside), for: .touchUpInside)
        button.addTarget(self, action: #selector(handleButtonTouchUpOutside), for: .touchUpOutside)
    }
    // update button's layout
    private static func updateLayout (for button: BrandButton) {
        button.setNeedsLayout()
        button.layoutIfNeeded()
    }
    
    // Button configuration : Label , icons and padding.
    private static func configureButton(button: BrandButton, viewModel: BrandButtonViewModel) {
        var contentEdgeInsets = UIEdgeInsets.zero
        
        // Setting properties
        button.setTitle(viewModel.label, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.numberOfLines = BrandButtonConstants.numberOfLines
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        // Adding leading icon (if available)
        if let leadingIcon = viewModel.leadingIcon {
            let leadingImageView = UIImageView(image: leadingIcon.withRenderingMode(.alwaysTemplate))
            leadingImageView.contentMode = .scaleAspectFit
            leadingImageView.translatesAutoresizingMaskIntoConstraints = false
            button.addSubview(leadingImageView)
            NSLayoutConstraint.activate([
                leadingImageView.heightAnchor.constraint(equalToConstant: BrandButtonConstants.iconSize),
                leadingImageView.widthAnchor.constraint(equalToConstant: BrandButtonConstants.iconSize),
                leadingImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                leadingImageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: BrandButtonConstants.iconSpacing)
            ])
            contentEdgeInsets.left = BrandButtonConstants.iconSize + BrandButtonConstants.iconSpacing
        }
        
        // Add trailing icon (if available)
        if let trailingIcon = viewModel.trailingIcon {
            let trailingImageView = UIImageView(image: trailingIcon.withRenderingMode(.alwaysTemplate))
            trailingImageView.contentMode = .scaleAspectFit
            trailingImageView.translatesAutoresizingMaskIntoConstraints = false
            button.addSubview(trailingImageView)
            NSLayoutConstraint.activate([
                trailingImageView.heightAnchor.constraint(equalToConstant: BrandButtonConstants.iconSize),
                trailingImageView.widthAnchor.constraint(equalToConstant: BrandButtonConstants.iconSize),
                trailingImageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                trailingImageView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -BrandButtonConstants.iconSpacing)
            ])
            contentEdgeInsets.right = BrandButtonConstants.iconSize + BrandButtonConstants.iconSpacing
        }
        
        // Setting the button width based on fullWidth property
        if viewModel.fullWidth {
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - button.layoutMargins.left - button.layoutMargins.right).isActive = true
        }
        let titleSpacing: CGFloat = BrandButtonConstants.iconSpacing
        contentEdgeInsets.left += titleSpacing
        contentEdgeInsets.right += titleSpacing
        button.contentEdgeInsets = contentEdgeInsets
        
        //Disabling the button by setting the button isEnabled to the value of our viewModel.isButtonEnabled
        button.isEnabled = viewModel.isButtonEnabled
        
        // Set button tint color based on the state and variant
        if viewModel.isButtonEnabled {
            button.tintColor = viewModel.iconColor ?? getSecondaryStyleColors(for: viewModel.variant)
        } else {
            if viewModel.variant == .primaryBlue || viewModel.variant == .primaryGreen {
                button.tintColor = .white
            } else {
                button.tintColor = .disabled
            }
        }
        
    }
    //Setting the Background color based on the variant and state
    private static func setBackgroundColor(for button: BrandButton, isEnabled: Bool) {
        if let buttonViewModel = button.viewModel {
            switch (buttonViewModel.variant, isEnabled) {
            case (_, true):
                button.backgroundColor = getDefaultColor(for: buttonViewModel.variant)
            case (_, false):
                if button.viewModel?.variant == .secondaryBlue || buttonViewModel.variant == .secondaryGreen{
                    button.backgroundColor = .white
                } else {
                    button.backgroundColor = .disabled
                }
            }
        }
    }
    // Getting the default color based on the variant
    private static func getDefaultColor(for variant: BrandButtonVariant) -> UIColor {
        switch variant {
        case .primaryBlue:
            return .blueDefault
        case .primaryGreen:
            return .greenDefault
        case .secondaryBlue, .secondaryGreen:
            return .white
        }
    }
    // Set custom font
    private static func setCustomFont(for button: BrandButton, viewModel: BrandButtonViewModel) {
        if let customFont = viewModel.font {
            button.titleLabel?.font = customFont
        }
        if viewModel.isButtonEnabled {
            if let customFontColor = viewModel.fontColor {
                button.setTitleColor(customFontColor, for: .normal)
            }
        } else {
            if viewModel.variant == .secondaryBlue || viewModel.variant == .secondaryGreen {
                button.setTitleColor(.disabled, for: .normal)
            } else {
                button.setTitleColor(.white, for: .normal)
            }
        }
    }
    // Set the radius and the hight
    private static func setCornerRadiusAndHeight(for button: BrandButton, viewModel: BrandButtonViewModel) {
        switch viewModel.size {
        case .regular:
            button.layer.cornerRadius = BrandButtonConstants.regularCornerRadius
            button.heightAnchor.constraint(equalToConstant: BrandButtonConstants.regularButtonHeight).isActive = true
        case .medium:
            button.layer.cornerRadius = BrandButtonConstants.mediumCornerRadius
            button.heightAnchor.constraint(equalToConstant: BrandButtonConstants.mediumButtonHeight).isActive = true
        }
    }
    // handle secondary style
    private static func applySecondaryStyle(for button: BrandButton, viewModel: BrandButtonViewModel) {
        
        if viewModel.isButtonEnabled {
            if (button.viewModel?.fontColor == nil) {
                button.setTitleColor(getSecondaryStyleColors(for: viewModel.variant), for: .normal)
            }
            button.layer.borderWidth = BrandButtonConstants.borderWidth
            button.layer.borderColor = getSecondaryStyleColors(for: viewModel.variant).cgColor
        } else {
            if viewModel.variant == .secondaryBlue || viewModel.variant == .secondaryGreen {
                button.setTitleColor(.disabled, for: .normal)
                button.layer.borderWidth = BrandButtonConstants.borderWidth
                button.layer.borderColor = UIColor.disabled.cgColor
            }
        }
    }
    
    private static func getSecondaryStyleColors(for variant: BrandButtonVariant) -> UIColor {
        var borderColor = UIColor.white
        if variant == .secondaryBlue {
            borderColor = .blueDefault
        } else if variant == .secondaryGreen {
            borderColor = .greenDefault
        }
        return borderColor
    }
    //MARK: Highlighting the button based on the variant and state
    @objc private static func handleButtonTouchDown(sender: BrandButton) {
        highlightButton(sender, highlighted: true)
    }
    
    @objc private static func handleButtonTouchUpInside(sender: BrandButton) {
        highlightButton(sender, highlighted: false)
    }
    
    @objc private static func handleButtonTouchUpOutside(sender: BrandButton) {
        highlightButton(sender, highlighted: false)
    }
    
    private static func highlightButton(_ button: BrandButton, highlighted: Bool) {
        if let buttonViewModel = button.viewModel {
            UIView.animate(withDuration: BrandButtonConstants.animationDuration) {
                if highlighted {
                    button.backgroundColor = getHighlightedColor(for: buttonViewModel.variant)
                } else {
                    setBackgroundColor(for: button, isEnabled: buttonViewModel.isButtonEnabled)
                }
            }
        }
    }
    
    private static func getHighlightedColor(for variant: BrandButtonVariant) -> UIColor {
        switch variant {
        case .primaryBlue:
            return .bluePressed
        case .primaryGreen:
            return .greenPressed
        case .secondaryBlue:
            return .secondaryBlueBackground
        case .secondaryGreen:
            return .secondaryGreenBackground
        }
    }

}

