import SwiftUI


//Waktu interval pergantian vet
//Slider masih belum fix
//Map Kit belum
//Muncul Alert setelah selesai menelepon. Kalau ya ke page terakhir, kalau tidak refresh dokter
//pesan modality muncul dibawah call
//setelah waktu habis kasih modality "apakah dokter menjawab?, jika iya maka next page rating. Jika tidak maka refresh page dan telepon dokter selanjutnya"


struct ContentView: View {
    @State private var showingAlert = false // State untuk menampilkan alert
    @State private var isDragging = false // State untuk melacak apakah gesture sedang berlangsung
    @State private var xOffset: CGFloat = 0 // State untuk melacak offset horizontal
    @State private var selectedContactIndex = 0
    @State private var navigateToCallPage = false // State untuk menentukan apakah harus navigasi ke CallPageView
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 16) {
                Text("DogSOS")
                    .font(.system(size: 55, weight: .bold, design: .default))
                    .foregroundColor(.black)
                ProductCard(imageName: "doglogo")
                FooterView(buttonAction: {
                    self.showingAlert = true // Menampilkan alert ketika tombol ditekan
                    Timer.scheduledTimer(withTimeInterval: 2 * 60, repeats: false) { _ in
                                        // Pindah ke kontak berikutnya jika tidak ada jawaban dalam 10 menit
                                        self.moveToNextContact()
                                    }
                    
                })
                .gesture(swipeGesture) // Menambahkan gestur swipe pada footer
                .offset(x: isDragging ? xOffset : 0) // Mengatur offset sesuai dengan gesture
                .animation(.easeInOut) // Animasi untuk perubahan offset
            }
            .padding(.all, 16)
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Persetujuan"),
                    message: Text("Apakah Anda yakin ingin melanjutkan?"),
                    primaryButton: .default(Text("Ya"), action: {
                        // Tambahkan logika ketika tombol "Ya" ditekan
                        // Mengambil nomor telepon dari kontak yang dipilih
                        let phoneNumber = contactDatabase[selectedContactIndex].phoneNumber
                        // Membuat URL untuk menelepon nomor telepon
                        if let url = URL(string: "tel://\(phoneNumber)") {
                            UIApplication.shared.open(url)
                        }
                        // Set state navigateToCallPage menjadi true untuk navigasi ke CallPageView
                        navigateToCallPage = true
                    }),
                    secondaryButton: .cancel(Text("Tidak"))
                )
            }
            .preferredColorScheme(.light)
            .navigationBarHidden(true)
            // Navigasi ke CallPageView jika navigateToCallPage bernilai true
            .background(
                NavigationLink(destination: CallPageView(), isActive: $navigateToCallPage) {
                    EmptyView()
                }
            )
        }
        .navigationBarBackButtonHidden(true) // Sembunyikan tombol kembali saat beralih ke ThankYouView
    }
    
    // Gestur swipe untuk menampilkan alert saat digeser
    private var swipeGesture: some Gesture {
        DragGesture(minimumDistance: 50, coordinateSpace: .local)
            .onChanged { value in
                // Update state saat gesture sedang berlangsung
                isDragging = true
                xOffset = value.translation.width
            }
            .onEnded { value in
                // Kembalikan state ke nilai awal setelah gesture selesai
                isDragging = false
                xOffset = 0
                if value.translation.width > 50 {
                    self.showingAlert = true // Menampilkan alert ketika digeser
                }
            }
    }
    
    
    // Fungsi untuk memindahkan ke kontak berikutnya
        private func moveToNextContact() {
            if selectedContactIndex < contactDatabase.count - 1 {
                selectedContactIndex += 1
                // Munculkan kembali alert untuk kontak berikutnya
                showingAlert = true
            }
        }
}

struct ProductCard: View {
    var imageName: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(imageName)
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(8)
                .aspectRatio(contentMode: .fit)
                .padding(EdgeInsets(top: 8, leading: 0.0, bottom: 8, trailing: 0.0))
        }
        .background(Color(.white))
        .frame(width: .infinity, height: .infinity, alignment: .center)
        .cornerRadius(8)
        .padding(.all,0)
    }
}

struct FooterView: View {
    var buttonAction: () -> Void // Closure untuk menangani aksi tombol
    
    var body: some View {
        VStack {
            Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.red)
                .overlay(
                    Text("SOS")
                        .font(.system(size: 22, weight: .bold, design: .default))
                        .foregroundColor(.white)
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
