//
//  MapView.swift
//  VIES
//
//  Created by Master Family on 06/01/2021.
//

import SwiftUI
import MapKit


struct MapView: View {
    var country: Country
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 48.1328603,
            longitude: 4.1759209
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 50,
            longitudeDelta: 50
        )
    )
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [country.capital]) { capital in
                    MapAnnotation(
                        coordinate: CLLocationCoordinate2D(
                            latitude: capital.latitude,
                            longitude: capital.longitude),
                        anchorPoint: CGPoint(x: 0.5, y: 0.5)
                    ) {
                        Circle()
                            .stroke(Color.green)
                            .frame(width: 44, height: 44)
                    }
                }
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(country: Country.austria)
    }
}
