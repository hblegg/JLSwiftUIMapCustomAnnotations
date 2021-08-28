import SwiftUI
import MapKit

struct Place: Identifiable {
  let id = UUID()
  var name: String
  var coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.748433, longitude: -73.985656), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
  
  var empireStateBuilding =
  Place(name: "Empire State Building", coordinate: CLLocationCoordinate2D(latitude: 40.748433, longitude: -73.985656))
  
  var body: some View {
    NavigationView {
      Map(coordinateRegion: $region, annotationItems: [empireStateBuilding]) { place in
        MapAnnotation(coordinate: place.coordinate) {
          NavigationLink {
            LocationDetailsView(place: place)
          } label: {
            PlaceAnnotationView(title: place.name)
          }
        }
      }
      .ignoresSafeArea(edges: .bottom)
      .navigationTitle("Custom Annotation")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
