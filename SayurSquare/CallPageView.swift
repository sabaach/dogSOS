// CallPageView.swift
import SwiftUI
import MapKit

struct CallPageView: View {
    @State private var timeRemaining = 10 // Waktu mundur dalam detik
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // Timer untuk menghitung waktu
    
    @State private var showAlert = false // State untuk menampilkan alert
    @State private var lastCalledContactIndex = 0 // Indeks terakhir dari kontak yang dipanggil
    @State private var navigateToThankYou = false
    
    // Koordinat titik user
    let userCoordinate = CLLocationCoordinate2D(latitude: -6.2033, longitude: 106.8158) // Contoh koordinat
    
    var body: some View {
        VStack {
            Text("Directing...")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text(contactDatabase[lastCalledContactIndex].name)
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.top, 10.0)
            // Menambahkan Map di dalam VStack
            MapView(userCoordinate: userCoordinate,
                    doctorCoordinate: CLLocationCoordinate2D(latitude: contactDatabase[lastCalledContactIndex].latitude, longitude: contactDatabase[lastCalledContactIndex].longitude),
                    doctorName: contactDatabase[lastCalledContactIndex].name)
            .frame(height: 250.0)
            .edgesIgnoringSafeArea(.all)
            .padding()
            Text(contactDatabase[lastCalledContactIndex].address)
            Spacer()
            Image("doglogo")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
            Text("Time Remaining: \(timeRemaining) seconds") // Tampilkan waktu yang tersisa
                .padding()
        }
        .padding()
        .onReceive(timer) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                showAlert = true // Menampilkan alert saat waktu habis
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Is the vet available?\nClick “No” if current vet is not available"),
                primaryButton: .default(Text("Yes"), action: {
                    // Lakukan sesuatu jika dokter menjawab
                    resetTimer() // Setel ulang timer setelah menjawab
                    navigateToThankYou = true // Navigasi ke ThankYouView
                }),
                secondaryButton: .default(Text("No"), action: {
                    // Telpon dokter selanjutnya jika tidak ada jawaban
                    makeNextCall()
                    resetTimer() // Setel ulang timer setelah tidak ada jawaban
                })
            )
        }
        .onDisappear {
            timer.upstream.connect().cancel() // Memberhentikan timer saat CallPageView tidak lagi terlihat
        }
        .preferredColorScheme(.light)
        .background(
            NavigationLink(destination: ThankYouView(), isActive: $navigateToThankYou) {
                EmptyView()
            }
        )
    }
    
    // Fungsi untuk melakukan panggilan ke dokter selanjutnya
    private func makeNextCall() {
        lastCalledContactIndex = (lastCalledContactIndex + 1) % contactDatabase.count // Pindah ke dokter berikutnya dalam daftar kontak
        let nextContact = contactDatabase[lastCalledContactIndex]
        
        // Membuat URL untuk menelepon nomor telepon
        if let url = URL(string: "tel://\(nextContact.phoneNumber)") {
            UIApplication.shared.open(url)
        }
    }
    
    // Fungsi untuk menyetel ulang timer
    private func resetTimer() {
        timeRemaining = 10 // Setel ulang waktu mundur menjadi 2 menit
    }
}

struct CallPageView_Previews: PreviewProvider {
    static var previews: some View {
        CallPageView()
    }
}
