//
//  BrandButton.swift
//  trivago-button
//
//  Created by Iheb Rahali on 01.03.24.
//
import UIKit

//MARK: Brand Button Delegate
protocol BrandButtonDelegate: AnyObject {
    func buttonTapped(_ button: BrandButton, withTag tag: Int)
}

class BrandButton: UIButton {
    var viewModel: BrandButtonViewModel? {
        didSet {
            if let viewModel = viewModel {
                BrandButtonStyler.applyStyle(to: self, with: viewModel)
            }
        }
    }

    weak var delegate: BrandButtonDelegate?

    init(tag: Int) {
        super.init(frame: .zero)
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        self.tag = tag
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func buttonPressed() {
        guard let viewModel = viewModel, viewModel.isButtonEnabled else {
            return
        }
        delegate?.buttonTapped(self, withTag: tag)
    }
}

