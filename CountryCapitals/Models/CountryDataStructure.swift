//
//  CountryDataStructure.swift
//  CountryCapitals
//
//  Created by Ufuoma Okoro on 16/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI


//Data Structure
struct Countries: Codable, Identifiable {
    
    
    public var id: Int
    
    public var CountryName: String
    public var CapitalName: String
    public var CapitalLatitude: Double
    public var CapitalLongitude: Double
    public var CountryCode: String
    public var ContinentName: String
    public var ImageName: String
}

//Observable Objects
class CountryObservable: ObservableObject {
    
    @Published var CountryName = ""
    @Published var CapitalName = ""
    @Published var CapitalLatitude = 0.0
    @Published var CapitalLongitude = 0.0
    @Published var CountryCode = ""
    @Published var ContinentName = ""
    @Published var ImageName = ""
}



