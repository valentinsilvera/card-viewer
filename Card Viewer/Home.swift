//
//  Home.swift
//  Card Viewer
//
//  Created by Valentin Silvera on 04.10.20.
//

import SwiftUI

struct Home : View {
    
    var cardHeight: CGFloat = 150
    
    @State var data = [
        
        Card(id: 0, image: "nyc", title: "New York", details: "New York City comprises 5 boroughs sitting where the Hudson River meets the Atlantic Ocean. At its core is Manhattan, a densely populated borough that’s among the world’s major commercial, financial and cultural centers. Its iconic sites include skyscrapers such as the Empire State Building and sprawling Central Park. Broadway theater is staged in neon-lit Times Square.", expand: false),
        Card(id: 1, image: "london", title: "London", details: "London, the capital of England and the United Kingdom, is a 21st-century city with history stretching back to Roman times. At its centre stand the imposing Houses of Parliament, the iconic ‘Big Ben’ clock tower and Westminster Abbey, site of British monarch coronations. Across the Thames River, the London Eye observation wheel provides panoramic views of the South Bank cultural complex, and the entire city.", expand: false),
        Card(id: 2, image: "ba", title: "Buenos Aires", details: "Buenos Aires is Argentina’s big, cosmopolitan capital city. Its center is the Plaza de Mayo, lined with stately 19th-century buildings including Casa Rosada, the iconic, balconied presidential palace. Other major attractions include Teatro Colón, a grand 1908 opera house with nearly 2,500 seats, and the modern MALBA museum, displaying Latin American art.", expand: false),
        Card(id: 3, image: "berlin", title: "Berlin", details: "Berlin, Germany’s capital, dates to the 13th century. Reminders of the city's turbulent 20th-century history include its Holocaust memorial and the Berlin Wall's graffitied remains. Divided during the Cold War, its 18th-century Brandenburg Gate has become a symbol of reunification. The city's also known for its art scene and modern landmarks like the gold-colored, swoop-roofed Berliner Philharmonie, built in 1963.", expand: false),
        Card(id: 4, image: "sf", title: "San Francisco", details: "San Francisco, officially the City and County of San Francisco is the cultural, commercial, and financial center of Northern California. San Francisco is the 16th most populous city in the United States, and the fourth most populous in California, with 881,549 residents as of 2019.", expand: false),
        
        Card(id: 5, image: "paris", title: "Paris", details: "Paris, France's capital, is a major European city and a global center for art, fashion, gastronomy and culture. Its 19th-century cityscape is crisscrossed by wide boulevards and the River Seine. Beyond such landmarks as the Eiffel Tower and the 12th-century, Gothic Notre-Dame cathedral, the city is known for its cafe culture and designer boutiques along the Rue du Faubourg Saint-Honoré.", expand: false)
    ]
    
    @State var show = false
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    var body: some View{
        
        VStack{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Spacer()
                            
                            Text("Travel")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.top,36)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    
                    LazyVGrid(columns: columns, spacing: 15){
                        
                        ForEach(0..<self.data.count){i in
                            
                            GeometryReader{g in
                                
                                CardView(data: self.$data[i], show: self.$show, cardHeight: cardHeight)
                                    
                                    // move view full screen
                                    .offset(y: self.data[i].expand ? -g.frame(in: .global).minY : 0)
                                    .offset(x: self.data[i].expand ? -g.frame(in: .global).minX : 0)
                                    
                                    // hide all other views when a view is expanded:
                                    .opacity(self.show ? (self.data[i].expand ? 1 : 0) : 1)

                                    // need to disable the scrolling:
                                    
                                    .onTapGesture {
                                        
                                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                            
                                            if !self.data[i].expand{
                                                
                                                // opening only one time then close button will work...
                                                self.show.toggle()
                                                self.data[i].expand.toggle()
                                            }
                                        }
                                        
                                    }
                                
                            }
                            // going to increase height based on expand
                            // TODO: get the height from CardView
                            .frame(height: self.data[i].expand ? UIScreen.main.bounds.height : cardHeight)
                            
                            // 500 for disabling the drag for scrollview:
                            .simultaneousGesture(DragGesture(minimumDistance: self.data[i].expand ? 0 : 500).onChanged({ (_) in
                                
                            }))
                        }
                    }
                }
                
            }
        }
    }
}

