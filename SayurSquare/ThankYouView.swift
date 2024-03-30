import SwiftUI

struct ThankYouView: View {
    var body: some View {
        VStack {
            Text("Terima Kasih!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
            
            Image(systemName: "heart.fill")
                .font(.system(size: 100))
                .foregroundColor(.red)
                .padding()
            
            Text("Terima kasih telah menggunakan aplikasi kami.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            
            NavigationLink(destination: ContentView()) {
                Text("Kembali ke Beranda")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
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
