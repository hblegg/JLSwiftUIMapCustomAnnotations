import SwiftUI
import MapKit


struct ListItem: Identifiable {
    let id = UUID()
    var name: String
    var fileName: String
}

struct Place: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
    var pdfFileName: String
    var associatedFiles: [ListItem]
}

var preplan = [
    Place(name: "1830",
          coordinate: CLLocationCoordinate2D(latitude: 33.8191, longitude: -117.86577),
          pdfFileName: "1830",
          associatedFiles: [
            ListItem(name: "1830 A", fileName: "1830 A"),
            ListItem(name: "1830 B", fileName: "1830 B")
            
          ]),
    Place(name: "1831",
          coordinate: CLLocationCoordinate2D(latitude: 33.81918, longitude: -117.85745),
          pdfFileName: "1831",
          associatedFiles: [
            ListItem(name: "1831 A", fileName: "1831 A"),
            ListItem(name: "1831 B", fileName: "1831 B"),
            ListItem(name: "1831 C", fileName: "1831 C"),
            ListItem(name: "1831 D", fileName: "1831 D")
          ]),
    
    Place(name: "1832",
          coordinate: CLLocationCoordinate2D(latitude: 33.81955, longitude: -117.84904),
          pdfFileName: "1832",
          associatedFiles: []),
    Place(name: "1833",
          coordinate: CLLocationCoordinate2D(latitude: 33.81987, longitude: -117.84093),
          pdfFileName: "1833",
          associatedFiles: [
            ListItem(name: "1833 A", fileName: "1833 A"),
            ListItem(name: "1833 B", fileName: "1833 B"),
            ListItem(name: "1833 C", fileName: "1833 C")
          ])

    // ... Add more locations here
]

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.787914, longitude: -117.853104), span: MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.09))

    @State private var showsCompass: Bool = true
    @State private var showsUserLocationButton: Bool = true
    @State private var showsMapPitchButton: Bool = true
    
    
    var body: some View {
        NavigationView {
            ZStack {
                //CustomMapView()
                CustomMapView(showsCompass: $showsCompass, showsUserLocationButton: $showsUserLocationButton, showsMapPitchButton: $showsMapPitchButton)
                Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: preplan) { place in
                    MapAnnotation(coordinate: place.coordinate) {
                        NavigationLink {
                            LocationDetailsView(place: place)
                        } label: {
                            PlaceAnnotationView(title: place.name) // Your custom view here
                        }
                        
                    }
                }
            }
            .ignoresSafeArea(edges: .bottom)
            .navigationTitle("MOBILE ICS 2023")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CustomMapView: UIViewRepresentable {
    
    @Binding var showsCompass: Bool
    @Binding var showsUserLocationButton: Bool
    @Binding var showsMapPitchButton: Bool
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.pointOfInterestFilter = .excludingAll
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Do nothing here
        uiView.showsCompass = showsCompass
        if showsUserLocationButton {
            uiView.setUserTrackingMode(.follow, animated: true)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))

      ContentView()
        .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro)"))
    }
  }
}

