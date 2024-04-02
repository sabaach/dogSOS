import SwiftUI

struct ThankYouView: View {
    @State private var rating = 0
    var body: some View {
        VStack {
            Spacer()
            Text("Thank you for using our service!!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()
            
            Image("man and dog")
                .resizable()
                .padding(10.0)
                .frame(width: 250.0, height: 250.0)
            
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
