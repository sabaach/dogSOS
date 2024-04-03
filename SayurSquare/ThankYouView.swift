import SwiftUI
import MapKit

struct ThankYouView: View {
    @State private var rating = 0
    @State private var lastCalledContactIndex = 0

    @State private var position = MapCameraPosition.userLocation(fallback: .automatic)
    
    var body: some View {
        let userCoordinate = CLLocationCoordinate2D(latitude: -6.2033, longitude: 106.8158) // Contoh koordinat
        
        VStack {
            Spacer()
            Text("Thank you for using our service!!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()
            
            Text(contactDatabase[lastCalledContactIndex].name)
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.top, 10.0)
            // Menambahkan Map di dalam VStack
            MapView(userCoordinate:  userCoordinate,
                    doctorCoordinate: CLLocationCoordinate2D(latitude: contactDatabase[lastCalledContactIndex].latitude, longitude: contactDatabase[lastCalledContactIndex].longitude),
                    doctorName: contactDatabase[lastCalledContactIndex].name)
            .frame(height: 250.0)
            .edgesIgnoringSafeArea(.all)
            .padding()
            Text(contactDatabase[lastCalledContactIndex].address)
            Spacer()
            
            Text("Rate the vet")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            
            HStack{
                RatingView(rating: $rating)
            }.padding(.bottom, 10)
            
            NavigationLink(destination: ContentView()) {
                Text("Send")
                    .foregroundColor(Color.white)
                    .padding(10.0)
                    .frame(width: 140, height: 50.0)
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .navigationBarHidden(true) // Menyembunyikan tombol navigasi kembali
    }
}

struct ThankYouView_Previews: PreviewProvider {
    static var previews: some View {
        ThankYouView()
    }
}
