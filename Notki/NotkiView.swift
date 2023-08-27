//
//  NotkiView.swift
//  Notki
//
//  Created by Marek Skrzelowski on 26/08/2023.
//

import Foundation
import SwiftUI

struct NotkiView: View {
    var body: some View {
        Text(.now, style: .date)
            .padding(.horizontal)
    }
}

struct NotkiView_Previews: PreviewProvider {
    static var previews: some View {
        NotkiView()
            .padding(.all)
    }
}
