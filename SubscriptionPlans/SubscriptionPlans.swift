//
//  SubscriptionPlans.swift
//  TenantApp
//
//  Created by MacMini on 05/03/2025.
//

import SwiftUI

struct SubscriptionPlans: View {
    var body: some View {
        VStack{
            VStack{
                Text("""
Thank you for choosing our premium 
subscription. Your journey to a superior 
experience begins now.
""")
                .bold()
                .font(.system(size: 19))
                .padding(.top,30)
                VStack{
                        HStack{
                            Image.appImage.frame
                                Spacer()
                            Text("Middle Level Monthly")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 18))
                            Spacer()
                        }.padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                            
                            .background(Color.theme.lightblue)
                            .cornerRadius(10)
                          
                        Image.appImage.receipt
                    Button(action: {
                        
                    }, label: {
                        Text("Already Subscribed")
                            .font(.system(size: 16))
                            .foregroundStyle(Color.theme.lightblue)
                        
                    }).padding(.top,13)
                    Text("12-01-2024 to 12-02-2024")
                        .font(.system(size: 16))
                        .vTop()
                        .padding(.top,13)
                }.frame(maxWidth: .infinity)
                    .frame(height: 365)
                    .overlay(
                                      RoundedRectangle(cornerRadius: 10)
                                          .stroke(Color.gray.opacity(0.4)) // Gray overlay with some transparency
                                  )
                    .padding(.horizontal,52)
                    .padding(.top,30)
                Text("Auto-renews for $29.99 /month until canceled")
                    .font(.system(size: 13))
                    .padding(.top,22)
                cancelSubscriptionbtnView(buttonTapped: {}, buttonTitle: "Cancel Subscription")
                    .padding(.top,12)
                Button(action: {
                    
                }, label: {
                    Text("Upgrade Membership")
                        .font(.system(size: 14))
                        .foregroundStyle(Color.theme.lightblue)
                        .padding(.top,40)
                })
            }.vTop()
                .navigationTitle("Subsciption Plans")
                .bold()
                .font(.system(size: 20))
        }
    }
}

#Preview {
    SubscriptionPlans()
}
