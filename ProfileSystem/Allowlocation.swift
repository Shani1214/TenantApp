//
//  AllowLocationVC.swift
//  AUTOFOB
//
//  Created by MacMini on 24/03/2024.
//
import SwiftUI

struct AllowLocationVC: View {
    @State private var map = false
    var body: some View {
        ScrollView{
            VStack{
                Image.appImage.locationn
                    .resizable()
                    .frame(width: 281, height:236)
                    .padding(.top, 30)
                VStack{
                    Text("""
                         Allow Tenant Trust system to use
                         your location
                         """)
                    .bold()
                    .font(.system(size: 22))
                    .multilineTextAlignment(.center)
                    .padding(.top,42)
                    Text("""
Pinpoint your exact location on the 
   map to swiftly connect with a 
landlord in your vicinity for optimal 
                   matching.
""")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 18))
                    .padding(.top,15)
                    
                    ButtonView(buttonTapped: {
                        
                    }, buttonTitle: "Allow")
                    .padding(.top,42)
                    AllowButton(buttonTapped: {}, buttonTitle: "Allow While Using App")
                   
                    .padding(.top,22)
                    AllowButton(buttonTapped: {}, buttonTitle: "Don't Allow")
                   
                    .padding(.top,22)
                }
                
            }.vTop()
        }
    }
}
#Preview {
    AllowLocationVC()
}
