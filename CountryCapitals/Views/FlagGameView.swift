//
//  FlagGameView.swift
//  CountryCapitals
//
//  Created by Ufuoma Okoro on 20/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

/*The code beldow will contain structs for a guessing game to be played.
(1) Shuffled Cards from the Array of 4 country flags
(2) Randome display from the name of the 4 countries
 
 */
import SwiftUI

struct GamePlay: View {
    
@ObservedObject var allCountryData = DataLoader()



    
    var body: some View {
        
     
        
        VStack {
            Spacer().frame(height: 20)
            GameSubV1()
            Spacer()
    
        

        }
            
        .navigationBarTitle(Text("The Flag Game"),displayMode: .inline)
    
        
    }
}



//Preview
struct GamePlay_Preview: PreviewProvider {
    
    static var previews: some View {
        
        GamePlay()
        
    }
}





struct GameSubV1: View {
    
    //Flag Details
    @ObservedObject var allCountryData = DataLoader()
    
    //Toggle for flag
    @State private var getNewFlag = false
    
    //Toggle Switch to show Country
    @State private var showContinetToggle = false
    @State private var showCapitalToggle = false
    @State private var showCountryToggle = false
    
    //Country variable names
    @State private var countryName = ""
    @State private var flagImageName = ""
    @State private var continentName  = ""
     @State private var capitalName  = ""
    
    
    //Questions Fields
    @State private var guessTheContinent = ""
    @State private var guessTheCountry = ""
    @State private var giessTheCapital = ""
    
    
    
    //Variable for random flag picker
    var getFlag: String {
        
        let countryFlag = allCountryData.dataStructure.randomElement()
        
        
        return countryFlag?.ImageName ?? ""
        
    }
    
 
    //Function to process continent
    func processContinet(inCountry: String) -> String {
        
        let localCountryData = allCountryData.dataStructure.filter {$0.CountryName == inCountry}
        
        var countryContinent = ""
        
        for country in localCountryData {
            countryContinent = country.ContinentName
        }
        
        return countryContinent
        
    }
    
    func processCapital(inCountry: String) -> String {
         
         let localCountryData = allCountryData.dataStructure.filter {$0.CountryName == inCountry}
         
         var countryCapital = ""
         
         for country in localCountryData {
            countryCapital = country.CapitalName
         }
         
         return countryCapital
         
     }
    
    
    
    
    var body: some View {
        
        VStack {
        
      
            
            Button(action: {
                
                withAnimation {
                self.getNewFlag.toggle()
                }
                
                self.flagImageName = self.getFlag
                self.countryName = self.flagImageName
                
                //Get continet
                self.continentName = self.processContinet(inCountry: self.countryName)
                self.capitalName = self.processCapital(inCountry: self.countryName)
                
                
            }) {
                
                
                
                
                Text("Get Flag")
                .padding()
                    .frame(width:100, height:50)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(6)
               
            }
            if getNewFlag {
              
            
             Spacer().frame(height:30)
                Image(self.flagImageName)
                .resizable()
                .scaledToFill()
                .border(Color.gray, width: 1)
                .frame(width: 200, height: 120)
                .transition(.slide)
                
                Spacer().frame(height:40)
                
                
                TextField("Guess the Country",text:$guessTheCountry)
                    .padding()
                
                
                Toggle(isOn: $showCountryToggle) {
                    
                    Text("Reveal Country")
                    
                }.padding()
                
                if showCountryToggle {
                    
                    Text("\(self.countryName)")
                }
                
               
            
                Text("\(self.continentName)")
                Text("\(capitalName)")
                
                    
                }
            
        
        }//VStack End
        
    
        
    }
}






