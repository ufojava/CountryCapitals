//
//  WebViewLoader.swift
//  CountryCapitals
//
//  Created by Ufuoma Okoro on 22/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//File to load Country Wiki page
import Foundation
import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    
    
    var url: String
    
    //Function to create view
    func makeUIView(context: Context) -> WKWebView {
            
        guard let url = URL(string: self.url) else {
            
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        
            wkWebView.load(request)
        
        return wkWebView
        
    }
    
    //Function to update Web Page
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    

    
    
}//End of WebView
