import SwiftUI


//Map Kit belum
//Muncul Alert setelah selesai menelepon. Kalau ya ke page terakhir, kalau tidak refresh dokter
//pesan modality muncul dibawah call


struct ContentView: View {
    @State private var showingAlert = false // State untuk menampilkan alert
    @State private var isDragging = false // State untuk melacak apakah gesture sedang berlangsung
    @State private var offset: CGFloat = 0 // State untuk melacak offset horizontal
    @State private var selectedContactIndex = 0
    @State private var navigateToCallPage = false // State untuk menentukan apakah harus navigasi ke CallPageView
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 16) {
                Text("DogSOS")
                    .font(.system(size: 55, weight: .bold, design: .default))
                    .foregroundColor(.black)
                ProductCard(imageName: "doglogo")
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                    Capsule()
                        .fill(Color(hex: "01224D"))
                        .frame(height: 80)
                    Text("Emergency Call")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .offset(x: 100)
                    
                    Capsule()
                        .fill(Color(hex: "EB5644"))
                        .frame(width: offset+70, height: 74)
                        .offset(x:4)
                    ZStack {
                        Circle()
                            .fill(Color(hex: "EB5644"))
                            .frame(width: 70, height: 75)
                            .padding(.leading, 5)
                        Text("SOS")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .offset(x: 2)
                    }
                    .offset(x: offset)
                    .gesture(swipeGesture)
                })
                .padding()
            }
//            .background(
//                NavigationLink(destination: CallPageView(), isActive: $navigateToCallPage) {
//                    EmptyView()
//                }
//            )
            .navigationDestination(isPresented: $navigateToCallPage){
                CallPageView()
            }
        }
        .navigationBarBackButtonHidden(true) // Sembunyikan tombol kembali saat beralih ke ThankYouView
        .preferredColorScheme(.light)
    }
    
    private var swipeGesture: some Gesture {
        DragGesture(minimumDistance: 50, coordinateSpace: .local)
            .onChanged { value in
                // Update state saat gesture sedang berlangsung
                isDragging = true
                offset = value.translation.width
                if offset >= UIScreen.main.bounds.width - 110{
                    offset = UIScreen.main.bounds.width - 110
                } else if offset < 0{
                    offset = 0
                }
            }
            .onEnded { value in
                // Kembalikan state ke nilai awal setelah gesture selesai
                isDragging = false
                offset = 0
                if value.translation.width > UIScreen.main.bounds.width - 110 {
                    let phoneNumber = contactDatabase[selectedContactIndex].phoneNumber
                    // Membuat URL untuk menelepon nomor telepon
                    if let url = URL(string: "tel://\(phoneNumber)") {
                        UIApplication.shared.open(url)
                    }
                    navigateToCallPage = true
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
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
