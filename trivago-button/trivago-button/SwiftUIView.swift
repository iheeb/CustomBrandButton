//
//  SwiftUIView.swift
//  trivago-button
//
//  Created by Iheb Rahali on 01.03.24.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var buttonViewModel = BrandButtonViewModel(label: "Press me", variant: .secondaryGreen)

    var body: some View {
        VStack {
            BrandButtonWrapper(viewModel: buttonViewModel, onTap: {
                // Handle button tap
                print("Button tapped!")
            })
            .frame(width: 200, height: 44) // Adjust the frame as needed
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

#Preview {
    SwiftUIView()
}
