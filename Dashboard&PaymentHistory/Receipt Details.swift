//
//  Receipt Details.swift
//  TenantApp
//
//  Created by MacMini on 10/03/2025.
//

import SwiftUI

struct Receipt_Details: View {
    var body: some View {
        VStack{
            VStack{
                Text("shaniiiiiiiiii")
                Image.appImage.invoice
                   
                 //   .frame(width:380, height: 443)
                VStack(alignment: .leading, spacing: 9){
                    Text("Rent Payment Receipt...")
                        .bold()
                        .font(.system(size: 18))
                        .hLeading()
                        .padding(.leading,20)
                    HStack{
                        Text("Rent paid date")
                            .font(.system(size: 15))
                            .foregroundStyle(Color.gray)
                        Spacer()
                        Text("April 15, 2024")
                            .font(.system(size: 18))
                    }.padding(.horizontal,20)
                    Divider()
                        .padding(.horizontal,20)
                    HStack{
                        Text("Status")
                            .font(.system(size: 15))
                            .foregroundStyle(Color.gray)
                        Spacer()
                    
                        HStack(spacing:3) {
                            Circle()
                                .frame(width: 4, height: 4)
                                .foregroundStyle(Color.orange)
                            
                            
                            Text("Pending")
                                .font(.system(size: 12))
                                .foregroundStyle(Color.orange)
                                .italic()
                                .padding(.trailing, 1)
                                .font(.system(size: 18))
                        }
                    }.padding(.horizontal,20)
                    Text("Description")
                        .bold()
                        .font(.system(size: 16))
                        .padding(.leading,20)
                        .padding(.top,5)
                    Text("""
                         I'm submitting my rent payment receipt for the 
                         month of April 2024. I paid the rent on time as per
                         our agreement. Please find the attached receipt for 
                         your reference.
                         """)
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.leading)
                    .padding(.leading,20)
                    
                    ButtonView(buttonTapped: {
                    }, buttonTitle: "Re-Upload Receipt")
                    .padding(.top,15)
                }
            }.frame(maxWidth: .infinity)
                .frame(height: 638)
                .background(Color.white)
                .cornerRadius(5)
                .shadow(radius: 2)
                .padding(.horizontal,12)
            .vTop()
            .padding(.top,20)
                .navigationTitle("Recipt Details")
                .bold()
                .font(.system(size: 20))
        }
    }
}

#Preview {
    Receipt_Details()
}
