//
//  TestWebView.swift
//  CountryCapitals
//
//  Created by Ufuoma Okoro on 22/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI



struct TestWikiPage: View {
    
    @State private var testCountry = "Nigeria"
    
    var body: some View {
        
        VStack {
        
        
        Text("Place Holder")
        
            WebView(url: "https://en.wikipedia.org/wiki/\(self.testCountry)")
            
        }
    }
    
}



//Previews
struct TestWikiPage_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TestWikiPage()
    }
}
