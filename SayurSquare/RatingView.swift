//
//  RatingView.swift
//  SayurSquare
//
//  Created by Roland Ramadan on 02/04/24.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    
    @State var offset: CGFloat = 0
    @State private var isDragging = false
    
    var label = ""
    var maxRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        VStack {
            HStack{
                if label.isEmpty == false{
                    Text(label)
                }
                
                ForEach(1..<maxRating + 1, id: \.self){
                    number in Button{
                        rating = number
                    } label: {
                        image(for: number)
                            . foregroundColor(number > rating ? offColor : onColor)
                    }
                }
            }
        }
    }
    
    func image(for number: Int) -> Image{
        if number > rating{
            offImage ?? onImage
        } else {
            onImage
        }
    }
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    RatingView(rating: .constant(0))
}
