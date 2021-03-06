//
//  AllCountriesCapitals.swift
//  CountryCapitals
//
//  Created by Ufuoma Okoro on 16/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Fle to list all data from JSON file
import SwiftUI



struct AllCountryCapitals: View {
    
  
    
    var body: some View {
        
            
        allFilteredCountries()
        
    }

    }




//Previews

struct AllCountryCaptals_Preview: PreviewProvider {
    
    static var previews: some View {
        
        AllCountryCapitals()
        
    }
}







struct allFilteredCountries: View {
    
    //JSON Data
    @ObservedObject var allCountryData = DataLoader()
    @EnvironmentObject var mapCoordinates: CountryObservable
    
    //All Countries Continents
    var allContinents = ["None","Africa","Australia","Asia","Central America","Europe","North America","South America"]
    
    //Country Search Variable
    @State private var searchCountry = ""
    
    @State private var selectedContinent = 0
    
    //variable to return continet
    var processSelectedContinet: String {
        
        var localSelected = ""
        
        if allContinents[selectedContinent] == "Africa" {
            localSelected = allContinents[selectedContinent]
            
        } else if allContinents[selectedContinent] == "Australia" {
            localSelected = allContinents[selectedContinent]
            
        } else if allContinents[selectedContinent] == "Asia" {
            localSelected = allContinents[selectedContinent]
            
        } else if allContinents[selectedContinent] == "Central America" {
            localSelected = allContinents[selectedContinent]
            
        } else if allContinents[selectedContinent] == "Europe" {
            localSelected = allContinents[selectedContinent]
            
        } else if allContinents[selectedContinent] == "North America" {
            localSelected = allContinents[selectedContinent]
            
        } else if allContinents[selectedContinent] == "South America" {
            localSelected = allContinents[selectedContinent]
        }else if allContinents[selectedContinent] == "None" {
            
            
        }
        
        
        return localSelected
        
        
       
        
    }
    
    
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
        
            Picker(selection: $selectedContinent, label: Text("Select").foregroundColor(Color.blue)) {
                        
                        ForEach(0..<allContinents.count) {
                            
                            Text(self.allContinents[$0])
                                .foregroundColor(Color.red)
                                
                            
                        }.frame(width: 100, height: 50)
                         .font(.system(size: 15))
            
                        
                    }
                    
                Spacer()
            
        
            Section(header: Text("Search for Country").bold().foregroundColor(Color.blue).font(.system(size: 15))) {
                
                TextField("🔍Search",text: $searchCountry)
                    .foregroundColor(Color.red)
                    .font(.system(size: 15))
                    .frame(height: 30)
                    .border(Color.gray, width: 0.3)
                    .cornerRadius(3)
                    
                
            }
            
            Section(header: Text("Country Details").bold().foregroundColor(Color.blue).font(.system(size: 15))) {
        
                List(allCountryData.dataStructure.filter {$0.ContinentName == processSelectedContinet || $0.CountryName.contains(self.searchCountry)} ,id: \.id) { country in
                            
                                    
                                
                            GeometryReader {geometry in
                            
                                        HStack {
                                                    Text("\(country.CountryName)")
                                                        .font(.system(size: 15))
                                                        .frame(width: geometry.size.width / 4, height: 20)
                                                    Text("\(country.CapitalName)")
                                                        .font(.system(size: 15))
                                                        .frame(width: geometry.size.width / 4, height: 20)
                                                    Image("\(country.ImageName)")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 40, height: 20)
                                           
                                            
                                            //Get map of country and capital location
                                            Button(action: {
                                                
                                                //Assign Capital cordinates to the global variables
                                                self.mapCoordinates.CapitalLatitude = country.CapitalLatitude
                                                self.mapCoordinates.CapitalLongitude = country.CapitalLongitude
                                                self.mapCoordinates.CapitalName = country.CapitalName
                                                
                                            }) {
                                                
                                                Text("Map")
                                                    .font(.system(size: 15))
                                                    .foregroundColor(Color.blue)
                                        
                                                
                                            }
                                            //Navigation link
                                            NavigationLink(destination: MapView()) {
                                                
                                                EmptyView()
                                                
                                            }
                                            
                                        
                                                    Spacer()
                                            
                                        }
                            }
                        }//End of List
            }
        
        }
        
        .navigationBarTitle(Text("Countries of the world"),displayMode: .inline)
    .padding()
    }
}




