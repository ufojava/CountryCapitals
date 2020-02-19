//
//  Menu.swift
//  CountryCapitals
//
//  Created by Ufuoma Okoro on 19/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//


//Applicaiton Menu System
import SwiftUI


struct MenuView: View {
    
    //Menu Icon Toggle Variables
    @State private var searchIconToggle = false
    @State private var gameIconToggle = false
    
    
    
    var body: some View {
        
        VStack {
            
            
            Spacer()// Push Menu to bottom of scrren
            ZStack {
            
            
            
                HStack {
                    Spacer().frame(width:50)
                    
                    Button(action: {
                        
                        self.showMenu()
                        
                    }) {
                        
                        
                        Text("Menu / Close")
                            .font(.custom("Didot", size: 25)).bold()
                            .foregroundColor(Color.white)
                            //.foregroundColor(Color.black)
                            
                        
                        
                    }//End of Button
                Spacer().frame(width:10)
                
                //Search Icon
                if searchIconToggle {
                    
                    NavigationLink(destination: AllCountryCapitals()) {
                
                    MenuIcon(icons: "doc.text.magnifyingglass")
                        .foregroundColor(Color.green)
                
                    }
                }
                Spacer().frame(width:30)
                
                //Game Icon
                
                if gameIconToggle {
                    
                    MenuIcon(icons: "gamecontroller")
                        .foregroundColor(Color.red)
                }
                Spacer().frame(width:20)
                
               
                
            
                
                
                
                 }//HStack display
                
                
            }//End of ZStack
            
            
            
        }//End of VStack
        

        
    }//End of View
    
    //Function to toggle animation on menu
   func showMenu() {
    
    //Search Icon
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        
        withAnimation {
            
            self.searchIconToggle.toggle()
        }
    }
    
    //Game Icon
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        
        withAnimation {
            
            self.gameIconToggle.toggle()
        }
    }
       
       
       
   }
    
}










//Menu PreViews
struct MenuView_Preview: PreviewProvider {
    
    static var previews: some View {
        
        MenuView()
        
    }
}




//Menu Icon
struct MenuIcon: View {
    
    //Icon Variable
    var icons: String
    
    var body: some View {
        
        VStack {
        Image(systemName: icons)
            .resizable()
            .scaledToFill()
            .frame(width: 30, height: 30)
            

        }
        
        
    }
    
}

