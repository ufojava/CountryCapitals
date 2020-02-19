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
    @State var opacity = 1.0
  
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Color(red: 0.2, green: 0.5, blue: 0.7)
                    .edgesIgnoringSafeArea(.all)
                
                ZStack {
                    
                    VStack {
                        
                        
                       
                        
                        Text("Country Flag")
                            .foregroundColor(Color.white)
                            .font(.custom("Didot", size: 45)).bold()
                            .shadow(radius: 2)
                            
            
                  
                        Spacer().frame(height:120)
                        
                        Rectangle()
                            .frame(width:300, height: 5)
                            .foregroundColor(Color.white)
                    
                        
                    
                        
                        Image("flagsV2")
                        
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white,lineWidth: 3))
                            .frame(width: 80, height:270)
                            //Animation
                            .rotationEffect(.degrees(rotation))
                            .animation(Animation.easeOut(duration:  3).delay(1))
                                .onAppear() {
                                self.rotation += 360
                        }
                  
                        
                        Rectangle()
                        .frame(width:300, height: 5)
                        .foregroundColor(Color.white)
                    
                        Spacer()
                        

                           //Call Main Menu
                           MenuView()
                        
                                               
                    
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
