//
//  BrandButtonWrapper.swift
//  trivago-button
//
//  Created by Iheb Rahali on 01.03.24.
//

import SwiftUI

struct BrandButtonWrapper: UIViewRepresentable {
    typealias UIViewType = BrandButton

    var viewModel: BrandButtonViewModel
    var onTap: (() -> Void)?

    func makeUIView(context: Context) -> BrandButton {
        let button = BrandButton(tag: 0)
        button.viewModel = viewModel
        button.addTarget(context.coordinator, action: #selector(context.coordinator.buttonTapped), for: .touchUpInside)
        return button
    }

    func updateUIView(_ uiView: BrandButton, context: Context) {
        uiView.viewModel = viewModel
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: BrandButtonWrapper

        init(_ parent: BrandButtonWrapper) {
            self.parent = parent
        }

        @objc func buttonTapped() {
            parent.onTap?()
        }
    }
}
