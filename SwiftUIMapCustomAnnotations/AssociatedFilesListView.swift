//
//  AssociatedFilesListView.swift
//  SwiftUIMapCustomAnnotations
//
//  Created by JOHN LEGG on 8/14/23.
//

import SwiftUI

struct AssociatedFilesListView: View {
    var associatedFiles: [ListItem]
    
    
    struct ListItemView: View {
        let item: ListItem

        var body: some View {
            if let pdfURL = Bundle.main.url(forResource: item.fileName, withExtension: "pdf") {
                NavigationLink(destination: PDFViewer(url: pdfURL)) {
                    Text(item.name)
                }
            } else {
                Text("Missing: \(item.name)")
            }
        }
    }

    var body: some View {
        Text("Preplans: \(associatedFiles.count)")

        List(associatedFiles) { item in
            ListItemView(item: item)
        }




    }
}


struct AssociatedFilesListView_Previews: PreviewProvider {
    static var previews: some View {
        AssociatedFilesListView(associatedFiles: [
            ListItem(name: "Sample PDF 1", fileName: "Sample1"),
            ListItem(name: "Sample PDF 2", fileName: "Sample2")
        ])
    }
}

