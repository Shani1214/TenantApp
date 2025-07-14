//
//  RentHistory.swift
//  TenantApp
//
//  Created by MacMini on 10/03/2025.
//

import SwiftUI

struct RentHistory: View {
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    VStack {
                        ForEach(0..<5) { item in
                            VStack {
                                HStack {
                                    Image.appImage.recept
                                        .padding(.leading,12)
                                    VStack(alignment: .leading, spacing:4) {
                                        HStack(spacing: 0) {
                                            Text("Rent Payment Recei...")
                                                .bold()
                                                .font(.system(size: 15))
                                            Spacer()
                                            Circle()
                                                .frame(width: 4, height: 4)
                                                .foregroundStyle(Color.orange)
                                            Text("Pending")
                                                .font(.system(size: 12))
                                                .foregroundStyle(Color.orange)
                                                .italic()
                                                .padding(.trailing, 20)
                                        }
                                        Text("April 15, 2024")
                                            .font(.system(size: 14))
                                            .foregroundStyle(Color.theme.lightblue)
                                        Text("Rent payment for the month of April...")
                                            .font(.system(size: 14))
                                            .foregroundStyle(Color.gray)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 95)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                        }
                    
                    }
                }
            }

          
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        // Action
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(Color.white)
                    }
                    .frame(width: 54, height: 54)
                    .background(Color.theme.darkblue)
                    .cornerRadius(40)
                    .padding(.trailing, 30)
                    .padding(.bottom, 20)
                }
            }
        }
        .navigationTitle("Rent History")
        .bold()
        .font(.system(size: 20))
    }
}

#Preview {
    RentHistory()
}
