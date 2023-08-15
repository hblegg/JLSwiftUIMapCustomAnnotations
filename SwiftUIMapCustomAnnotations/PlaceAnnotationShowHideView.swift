import SwiftUI

struct PlaceAnnotationShowHideView: View {
  @State private var showTitle = true
  
  let title: String
  
  var body: some View {
    VStack(spacing: 0) {
      Text(title)
        .font(.callout)
        .padding(5)
        .background(Color(.white))
        .cornerRadius(10)
        .opacity(showTitle ? 0 : 1)
     
    }
    .onTapGesture {
      withAnimation(.easeInOut) {
        showTitle.toggle()
      }
    }
  }
}

struct PlaceAnnotationShowHideView_Previews: PreviewProvider {
  static var previews: some View {
    PlaceAnnotationShowHideView(title: "Preplan")
      .background(Color.gray)
  }
}
