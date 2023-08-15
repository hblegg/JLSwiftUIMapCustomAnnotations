
import SwiftUI
import PDFKit
import MapKit



// SwiftUI wrapper for PDFView
struct PDFViewer: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: Context) {
        uiView.document = PDFDocument(url: url)
    }
}

struct LocationDetailsView: View {
    let place: Place

    @State private var isShowingPDF = false
    @State private var selectedPDFURL: URL? = nil
    
    
    var body: some View {
        VStack {
            // If there are associated files, show the Preplan button to navigate to them
            if !place.associatedFiles.isEmpty {
                NavigationLink(destination: AssociatedFilesListView(associatedFiles: place.associatedFiles)) {
                    Text("Preplan")
                        .padding(4)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.bottom, 10)  // Some padding to space it out from the title
            }

            Text(place.name)
                .font(.title)
                
            if let pdfURL = Bundle.main.url(forResource: place.pdfFileName, withExtension: "pdf") {
                PDFViewer(url: pdfURL)
            } else {
                Text("Preplan not found.")
            }
        }
    }
}




struct LocationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailsView(place: Place(name: "Preplan",
                                         coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0),
                                         pdfFileName: "example",
                                         associatedFiles: [ListItem(name: "Example A", fileName: "exampleA"),
                                                          ListItem(name: "Example B", fileName: "exampleB")]))
    }
}

