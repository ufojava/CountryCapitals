//
//  JSONDataLoader.swift
//  CountryCapitals
//
//  Created by Ufuoma Okoro on 16/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//This file deals with the decoding of JSON file - CountryCapital.JSON
import Foundation

public class DataLoader: ObservableObject {
    
    @Published var dataStructure = [Countries]()
    
    
        //Initilise decoded file
            init() {
                
                decodeJSONFile()
            }
    



            //Function to decocde JSON File
            func decodeJSONFile() {
                
                        if let fileLocation = Bundle.main.url(forResource: "Countries", withExtension: "json") {
                            
                            //Do try to check for file
                            
                            
                            do {
                                
                                //Define Data
                                let data = try Data(contentsOf: fileLocation)
                                
                                //Declare Decoder
                                let jsonDecode = JSONDecoder()
                                
                                //Decode the JSON Data
                                let dataFromJSON = try jsonDecode.decode([Countries].self, from: data)
                                
                                        DispatchQueue.main.async {
                                        
                                        self.dataStructure = dataFromJSON
                                        
                                        }
                                
                                
                                
                                
                            } catch {
                                
                                print(error)
                                
                            }//Catch closure
                            
                            
                        }//End of file location

            }//End of function

}//End of class
