//
//  MapView.swift
//  CountryCapitals
//
//  Created by Ufuoma Okoro on 18/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

//Struct to use MapKit to render Country Capital Coordinates

struct MapView: UIViewRepresentable {
    
    //Set Observable environment
    @EnvironmentObject var mapCoordinates: CountryObservable
    
    //Function to make MapView
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
        
    }//End make Map
    
    
    //Function to update MapView and set the Map Coordinates
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        
        let location = CLLocationCoordinate2D(latitude: mapCoordinates.CapitalLatitude, longitude: mapCoordinates.CapitalLongitude)
        
        //Map Span
        let span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)
        
        //Map Region
        let region = MKCoordinateRegion(center: location, span: span)
        
        //Set View Animation
        uiView.setRegion(region,animated: true)
        
        //Annotate
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = mapCoordinates.CountryName
        annotation.subtitle = mapCoordinates.CapitalName
        uiView.addAnnotation(annotation)
        
    }//End to update MapView
    
    
}
