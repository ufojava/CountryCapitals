//
//  IconTemplate.swift
//  CountryCapitals
//
//  Created by Ufuoma Okoro on 18/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

//Template for Menu

struct IconTemplate: View {
    
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
