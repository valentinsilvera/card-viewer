//
//  ContentView.swift
//  Card Viewer
//
//  Created by Valentin Silvera on 04.10.20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
