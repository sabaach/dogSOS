//
//  TermPage.swift
//  SayurSquare
//
//  Created by Roland Ramadan on 02/04/24.
//

import SwiftUI

struct TermPage: View {
    var body: some View {
        NavigationStack {
            VStack{
                TextView(text: "Welcome to Dog SOS!\nBy accessing or using Dog SOS, you agree to be bound by these Terms and Conditions. Please read them carefully before using our services. Dog SOS provides a hotline service to connect users with veterinarians in case of emergencies. By using our service, you understand that immediate veterinary assistance may be provided based on the information you provide, including location data. \n\nWe utilize location services to connect users with nearby veterinarians. By using our App, you consent to the collection and use of your location data for the purpose of providing emergency assistance. Users may contact veterinarians through phone calls or iMessage for immediate assistance. Dog SOS is not responsible for the content of any communication between users and veterinarians. While we strive to provide reliable assistance, Dog SOS cannot guarantee the availability or quality of veterinary services. Users are responsible for verifying the credentials and qualifications of the veterinarians they engage with through our platform. Users are solely responsible for the information provided to veterinarians through the Dog SOS platform. False or misleading information may result in delayed or inappropriate veterinary assistance. All content and materials provided through the Dog SOS App are the property of Dog SOS and its licensors. Users may not reproduce, distribute, or modify any content without prior written consent. Dog SOS reserves the right to update or modify these Terms and Conditions at any time without prior notice. Continued use of the App after such changes constitutes acceptance of the revised terms. \n\nBy using the Dog SOS App, you acknowledge that you have read, understood, and agree to abide by these Terms and Conditions. If you do not agree with any part of these terms, please do not use our services.")
                
                NavigationLink(destination: PrivacyView()) {
                    Text("Confirm")
                        .foregroundColor(Color.white)
                        .padding(10.0)
                        .frame(width: 340, height: 50.0)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationBarTitle("Terms & Condition")
            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct TextView: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        textView.textAlignment = .justified
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

#Preview {
    TermPage()
}
