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
            
            
            
                VStack {
                    
                    
                    Button(action: {
                        
                        self.showMenu()
                        
                    }) {
                        
                        
                        Text("Menu / Close")
                            .font(.custom("Didot", size: 25)).bold()
                            .foregroundColor(Color.white)
                            //.foregroundColor(Color.black)
                            
                        
                        
                    }//End of Button
                
                
                //Search Icon
                if searchIconToggle {
                    
                    NavigationLink(destination: AllCountryCapitals()) {
                        HStack {
                    Text("Flag Search")
                        .font(.custom("Didot", size: 20))
                        .foregroundColor(Color.black)
                    Spacer().frame(width:30)
                
                    MenuIcon(icons: "doc.text.magnifyingglass")
                        .foregroundColor(Color.green)
                            
                        }
                
                    }
                }
               
                
                //Game Icon
                
                if gameIconToggle {
                    
                    NavigationLink(destination: GamePlay()) {
                        HStack {
                    Text("Flag Game  ")
                        .font(.custom("Didot", size: 20))
                        .foregroundColor(Color.black)
                    Spacer().frame(width:30)
                    
                    MenuIcon(icons: "gamecontroller")
                        .foregroundColor(Color.red)
                        }
                    }
                }
               
                
               
                
            
                
                
                
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

