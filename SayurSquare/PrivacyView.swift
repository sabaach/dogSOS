//
//  PrivacyView.swift
//  SayurSquare
//
//  Created by Roland Ramadan on 02/04/24.
//

import SwiftUI

struct PrivacyView: View {
    var body: some View {
        NavigationStack {
            VStack{
                TextViewJustify(text: "Welcome to Dog SOS!\nBy accessing or using Dog SOS, you agree to the terms outlined in our Privacy Policy. Please review this policy carefully to understand how we collect, use, and safeguard your personal information.\n\nWe collect certain information when you use Dog SOS, including but not limited to location data. We use location services to connect you with nearby veterinarians in case of emergencies. Your consent to the collection and use of your location data is necessary for providing emergency assistance. Additionally, when you contact veterinarians through phone calls or iMessage for immediate assistance, we may collect information related to these communications.\n\nThe information collected is utilized to provide emergency assistance, improve our services, and comply with legal obligations. We do not share your personal information with third parties except in specific circumstances such as with your consent or as necessary to provide the services you requested. We employ industry-standard security measures to protect your personal information from unauthorized access, disclosure, alteration, or destruction. You are solely responsible for the accuracy and completeness of the information you provide through Dog SOS. False or misleading information may result in delayed or inappropriate veterinary assistance. We reserve the right to update or modify this Privacy Policy at any time. We will notify you of any changes by posting the revised policy on our website or within the Dog SOS App.\n\nBy using Dog SOS, you acknowledge that you have read, understood, and agree to the terms outlined in this Privacy Policy. If you do not agree with any part of this policy, please do not use our services.")
                
                NavigationLink(destination: ContentView()) {
                    Text("Confirm")
                        .foregroundColor(Color.white)
                        .padding(10.0)
                        .frame(width: 340, height: 50.0)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationBarTitle("Privacy Policy")
            .navigationBarBackButtonHidden(true)
            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .preferredColorScheme(.light)
        }
    }
}

#Preview {
    PrivacyView()
}
