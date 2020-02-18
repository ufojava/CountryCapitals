//
//  ContentView.swift
//  CountryCapitals
//
//  Created by Ufuoma Okoro on 16/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var rotation = 0.0
    @State var tapLoggo = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                ZStack {
                    
                    VStack {
                        
                        Image("FlagsTitle")
                            .resizable()
                            .scaledToFill()
                            .frame(width:300, height:30)
                        Spacer()
                    
                    
                    HStack {
                        
                    
                        
                          Image("FlagLogo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height:270)
                            .rotationEffect(.degrees(rotation))
                            .animation(Animation.easeOut(duration:  3).delay(1))
                                .onAppear() {
                                self.rotation += 360
                                }
                          
                        
                        
                                        
                    }.padding()
                    
                        Spacer()
                        
                        HStack {
                            
                            
                            NavigationLink(destination: AllCountryCapitals()) {
                           IconTemplate(icons: "doc.text.magnifyingglass")
                            .foregroundColor(Color.white)
                            Spacer().frame(width:30)
                            }
                               
                           IconTemplate(icons: "gamecontroller")
                            .foregroundColor(Color.white)
                            Spacer().frame(width:30)
                           
                           IconTemplate(icons: "rectangle.and.paperclip")
                            .foregroundColor(Color.white)
                            Spacer().frame(width:30)
                            
                                               
                        }.padding()
                     
                
                    }
                    
                }
                
                
        
                //AllCountryCapitals()
        
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
