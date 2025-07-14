//
//  Subscriptionplans_Free.swift
//  TenantApp
//
//  Created by MacMini on 03/03/2025.
//

import SwiftUI
class SubscriptionViewModel: ObservableObject {
    @Published var isbasicSelected: Bool = false
    @Published var isEconomySelected: Bool = false
    @Published var isbusinessSelected: Bool = false
    @Published var isPremiumSelected: Bool = false
}
struct Subscriptionplans_Free: View {
    @StateObject var viewmodel = SubscriptionViewModel()
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    Text("""
Buy Subscription and get access
to “Tenant Trust” Premium Feature
""")
                    .bold()
                    .font(.system(size: 21))
                    .padding(.top,27)
                    HStack{
                        HStack {
                            Image(systemName: viewmodel.isbasicSelected ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(viewmodel.isbasicSelected ? Color.blue : Color.gray)
                            
                            Text("""
                                 Basic Level
                                 Membership
                                 """)
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        }
                        .padding()
                        .onTapGesture {
                            viewmodel.isbasicSelected.toggle()
                            viewmodel.isEconomySelected = false
                            viewmodel.isbusinessSelected = false
                            viewmodel.isPremiumSelected = false
                        }
                        
                        HStack {
                            Image(systemName: viewmodel.isEconomySelected ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(viewmodel.isEconomySelected ? Color.blue : Color.gray)
                            
                            Text("""
                                     Economy Level
                                     Membership
                                     """)
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        }
                        .padding()
                        .onTapGesture {
                            viewmodel.isEconomySelected.toggle()
                            viewmodel.isbasicSelected = false
                            viewmodel.isbusinessSelected = false
                            viewmodel.isPremiumSelected = false
                        }
                        
                    }
                    HStack{
                        HStack {
                            Image(systemName: viewmodel.isbusinessSelected ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(viewmodel.isbusinessSelected ? Color.blue : Color.gray)
                            
                            Text("""
                                 Business Level
                                 Membership
                                 """)
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        }
                        
                        .onTapGesture {
                            viewmodel.isbusinessSelected.toggle()
                            viewmodel.isbasicSelected = false
                            viewmodel.isEconomySelected = false
                            viewmodel.isPremiumSelected = false
                        }
                        Spacer()
                        HStack {
                            Image(systemName: viewmodel.isPremiumSelected ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(viewmodel.isPremiumSelected ? Color.blue : Color.gray)
                            
                            Text("""
                                     Premium Level
                                     Membership
                                     """)
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        }
                        
                        .onTapGesture {
                            viewmodel.isPremiumSelected.toggle()
                            viewmodel.isbasicSelected = false
                            viewmodel.isEconomySelected = false
                            viewmodel.isbusinessSelected = false
                        }
                        
                    }.padding(.horizontal,65)
                        .padding(.top,22)
                    Divider()
                        .padding(.horizontal,29)
                        .padding(.top,30)
                    
                    ForEach(0..<10) { item in
                        HStack{
                            Image.appImage.tickk
                                .padding(.leading,14)
                            Text("""
    Basic dashboard features for viewing rental 
    history and reporting rent payments.
    """)
                            .font(.system(size: 14))
                            .hLeading()
                        }.frame(maxWidth: .infinity)
                            .frame(height: 47)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                            .padding(.horizontal,19)
                            .padding(.top,25)
                    }
                    Text("Price:- Free")
                        .font(.system(size: 18))
                        .foregroundStyle(Color.theme.lightblue)
                        .padding(.top,30)
                    ButtonView(buttonTapped: {
                        
                    }, buttonTitle: "Continue")
                    .padding(.top,30)
                }.vTop()
            }
                .navigationTitle("Subscription Plans")
                .bold()
                .font(.system(size: 20))
        }
    }
}

#Preview {
    Subscriptionplans_Free()
}
