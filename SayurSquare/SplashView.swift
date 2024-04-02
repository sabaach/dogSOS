import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
//            Text("DogSOS")
//                .font(.system(size: 55, weight: .bold, design: .default))
//                .foregroundColor(.black)
            Image("doglogo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isActive = true
            }
        }
        .fullScreenCover(isPresented: $isActive, content: {
            TermPage()
        })
    }
}

struct SplashView_Preview: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
