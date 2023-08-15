import SwiftUI

struct PlaceAnnotationView: View {
  let title: String
  
  var body: some View {
    VStack(spacing: 0) {
      Text(title)
//        .font(.callout)
//        .padding(5)
//        .background(Color(uiColor: .white))
//        .cornerRadius(10)
//        .foregroundColor(Color(uiColor: .black))
      
            .font(.caption)
        //.font(.system(size: 10))
        .padding(5)
        .background(Color(uiColor: .white).opacity(0.7))
        .cornerRadius(10)
        .foregroundColor(Color(uiColor: .black))
    }
  }
}

struct PlaceAnnotationView_Previews: PreviewProvider {
  static var previews: some View {
    PlaceAnnotationView(title: "Preplan")
      .background(Color.gray)
  }
}
