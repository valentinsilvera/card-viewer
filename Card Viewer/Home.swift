//
//  Home.swift
//  Card Viewer
//
//  Created by Valentin Silvera on 04.10.20.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            HStack{
                Text("Travel")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.primary)
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "questionmark.circle")
                        .font(.system(size: 34))
                        .foregroundColor(.primary)
                }
            }
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
