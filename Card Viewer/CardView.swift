//
//  CardView.swift
//  Card Viewer
//
//  Created by Valentin Silvera on 06.10.20.
//

import SwiftUI

struct CardView : View {
    
    @Binding var data : Card
    @Binding var show : Bool
    var cardHeight: CGFloat
    var cardWidth: CGFloat = 160
    
    var body: some View{
        
        ZStack(alignment: .topTrailing){
            
            VStack{
                
                Image(self.data.image)
                    .resizable()
                    .frame(height: self.data.expand ? 350 : cardHeight)
                    .frame(width: self.data.expand ? UIScreen.main.bounds.width : cardWidth)
                    .cornerRadius(self.data.expand ? 0 : 25)
                
                if self.data.expand{
                    
                    HStack{
                        
                        Text(self.data.title)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding()
                    
                    Text(self.data.details)
                        .padding(.horizontal)
                        .padding(.bottom)
                    
                    Text("Let's Go")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 2)
                        .background(LinearGradient(gradient: .init(colors: [Color(.red),Color(.orange)]), startPoint: .leading, endPoint: .trailing))
                        .clipShape(Capsule())
                        .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 15)
                }
            }
            .padding(.horizontal, self.data.expand ? 0 : 20)
            // to ignore spacer scroll:
            .contentShape(Rectangle())
            
            if self.data.expand{
                
                Button(action: {
                    
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                        
                        self.data.expand.toggle()
                        self.show.toggle()
                    }
                    
                }) {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .clipShape(Circle())
                    
                }
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.trailing,10)
                
                .statusBar(hidden: true)
            }
        }
    }
}


// sample Data

struct Card : Identifiable {
    var id : Int
    var image : String
    var title : String
    var details : String
    var expand : Bool
}
