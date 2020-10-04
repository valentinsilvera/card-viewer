//
//  Home.swift
//  Card Viewer
//
//  Created by Valentin Silvera on 04.10.20.
//

import SwiftUI

struct Home: View {
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    var body: some View {
        VStack{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                HStack{
                    Text("Travel")
                        .font(.system(size: 34, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "questionmark.circle")
                            .font(.system(size: 28))
                            .foregroundColor(.primary)
                    }
                }
                .padding([.horizontal, .top])
                
                LazyVGrid(columns: columns, spacing: 25) {
                    ForEach(data){travel in
                        VStack(alignment: .leading, spacing: 10) {
                            Image(travel.image)
                                .resizable()
                                .frame(height: 180)
                                .cornerRadius(15)
                                .scaledToFit()
                            
                            Text(travel.title)
                                .fontWeight(.bold)
                        }
                    }
                }
                .padding(.horizontal)
            }                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
        }
    }
}

struct Travel : Identifiable {
    var id: Int
    var image: String
    var title: String
}

var data = [
    Travel(id: 0, image: "london", title: "London"),
    Travel(id: 1, image: "ba", title: "Buenos Aires"),
    Travel(id: 2, image: "nyc", title: "New York"),
    Travel(id: 3, image: "berlin", title: "Berlin"),
    Travel(id: 4, image: "sf", title: "San Francisco"),
    Travel(id: 5, image: "paris", title: "Paris")
]


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
