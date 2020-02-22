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
    @State private var guessTheCapital = ""
    
    
    @State private var score = 0
    @State private var totalGameScore = 0
    
    
    
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
    
    //Function to reset toggle and questions
    func resetQuestionsToggle() {
        
        //Reset the toggles
        self.showContinetToggle = false
        self.showCountryToggle = false
        self.showCapitalToggle = false
        
        //Reset Questionss
        self.guessTheContinent = ""
        self.guessTheCountry = ""
        self.guessTheCapital = ""
        
    }
    

    //Function Calculator
    func calculator() {
        
        if self.continentName.contains(self.guessTheContinent) || (self.guessTheContinent.range(of: self.continentName, options: .caseInsensitive) != nil) {
            self.score += 1
        }
        
        if self.countryName.contains(self.guessTheCountry) || (self.guessTheCountry.range(of: self.countryName,options: .caseInsensitive) != nil) {
            self.score += 1
        }
        
        if self.capitalName.contains(self.guessTheCapital) || (self.guessTheCapital.range(of: self.capitalName,options: .caseInsensitive) != nil){
        self.score += 2
            
        }
        
        //Calculate total score
        self.totalGameScore += self.score
        
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
               
                //Reset toggle and country variable
                self.resetQuestionsToggle()
                
                
                if self.getNewFlag {
                    //Read Speach
                    readSpeech(word: "Welcome to the flag game. Test your knowledge")
                    
                }
                
                
               
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
                .frame(width: 140, height: 70)
                .transition(.slide)
                
                Spacer().frame(height:10)
                
         
                
                Form {
                
                    //Guess the continet
                    Section(header: Text("Country Flag Details Test").bold().font(.system(size: 14))) {
                        
                    
                        HStack {//Continent
                        
                        TextField("Guess the continent",text: $guessTheContinent)
                            .foregroundColor(Color.red)
                            .font(.system(size: 14))
                          
                        
                            Toggle(isOn: $showContinetToggle) {
                                
                                Text("Reveal Continent")
                                    .foregroundColor(Color.red)
                                    .font(.system(size: 14))
                                
                                
                                
                                
                            }
                            
                            if showContinetToggle {
                                
                                
                                Text("\(self.continentName)")
                                    .foregroundColor(Color.red)
                                    .font(.system(size: 14))
                                
                                    
                              
                            }
                        }//End HStack
                        
                        //Guess the country
                   
                        HStack {
                            TextField("Guess the Country",text:$guessTheCountry)
                                .foregroundColor(Color.green)
                                .font(.system(size: 14))
                            
                            
                            Toggle(isOn: $showCountryToggle) {
                                
                                Text("Reveal Country")
                                    .foregroundColor(Color.green)
                                    .font(.system(size: 14))
                                
                                
                          
                            }
                            
                            if showCountryToggle {
                                
                                Text("\(self.countryName)")
                                    .foregroundColor(Color.green)
                                    .font(.system(size: 14))
                                
                            }
                        }//End of Country HStack
                   
                    
                   //Guess the capital
                   
                        HStack {
                            TextField("Guess the capital",text: $guessTheCapital)
                                .font(.system(size: 14))
                                .foregroundColor(Color.blue)
                                
                                
                                Toggle(isOn: $showCapitalToggle) {
                                    
                                    Text("Revael capital")
                                        .foregroundColor(Color.blue)
                                        .font(.system(size: 14))
                                }
                        
                                if showCapitalToggle {
                                    
                                    Text("\(self.capitalName)")
                                        .foregroundColor(Color.blue)
                                        .font(.system(size: 14))
                                    
                                }
                        }//End of Capital HStack
                        
                        
                    }//End of Section
                    
                    HStack {
                        
                        Button(action: {
                            
                            self.score = 0
                            self.calculator()
                            
                            
                            
                        }) {
                            
                            Text("Get")
                                .padding()
                                .frame(width:80, height: 30)
                                .background(Color.purple)
                                .foregroundColor(Color.white)
                                .cornerRadius(6)
                                .font(.system(size: 14))
                            
                        }
                        
                        
                        Text("Score:\(self.score)")
                        .foregroundColor(Color.purple)
                        .font(.system(size: 14))
                        
                        Text("Game Score: \(self.totalGameScore)")
                            .foregroundColor(Color.green)
                            .font(.system(size: 14))
                    
                    }
                    
                    NavigationLink(destination: WebView(url: "https://en.wikipedia.org/wiki/\(self.countryName)")) {
                        
                        Text("Country Wiki")
                            .font(.system(size: 14))
                            .foregroundColor(Color.yellow)
                    }
                    
                }.padding()
                
                
                
            }
        
        }//VStack End
        
    
        }
    }









