import SwiftUI

class SubscriptionBasicViewModel: ObservableObject {
    @Published var isbasicSelected: Bool = false
    @Published var isEconomySelected: Bool = false
    @Published var isbusinessSelected: Bool = false
    @Published var isPremiumSelected: Bool = false
    @Published var selectedPackage: String = "monthly" // Default selection

}

struct Subscriptionplans_Basic: View {
    @StateObject var viewmodel = SubscriptionBasicViewModel()

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Text("""
Buy Subscription and get access
to “Tenant Trust” Premium Feature
""")
                    .bold()
                    .font(.system(size: 21))
                    .padding(.top, 27)

                    // Membership Selection
                    HStack {
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

                    HStack {
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
                    }
                    .padding(.horizontal, 65)
                    .padding(.top, 22)

                    Divider()
                        .padding(.horizontal, 29)
                        .padding(.top, 30)

                    // Features List
                    ForEach(0..<10) { item in
                        HStack {
                            Image.appImage.tickk
                                .padding(.leading, 14)
                            Text("""
    Basic dashboard features for viewing rental 
    history and reporting rent payments.
    """)
                            .font(.system(size: 14))
                            .hLeading()
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 47)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(15)
                        .padding(.horizontal, 19)
                        .padding(.top, 25)
                    }
                    Button(action: {
                        viewmodel.selectedPackage = "monthly"
                    }) {
                        Text("Monthly Package                            $19.99 / Month")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(viewmodel.selectedPackage == "monthly" ? .white : .blue)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(viewmodel.selectedPackage == "monthly" ? Color.blue : Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 1)
                                    .stroke(lineWidth: 1)
                            )
                    }
                    .padding(.top, 30)
                    .padding(.horizontal,20)
                    // Yearly Package Button
                    Button(action: {
                        viewmodel.selectedPackage = "yearly"
                    }) {
                        Text("Yearly Package                                  $99.99 / Year")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(viewmodel.selectedPackage == "yearly" ? .white : .blue)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(viewmodel.selectedPackage == "yearly" ? Color.blue : Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 1)
                                    .stroke(lineWidth: 1)
                            )
                            
                    }
                    .padding(.top, 36)
                    .padding(.horizontal,20)

                    // Continue Button
                    ButtonView(buttonTapped: {
                       
                    }, buttonTitle: "Subscribe Now")
                        .padding(.top, 30)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Restore Subscription")
                            .font(.system(size: 12))
                            .foregroundStyle(Color.theme.lightblue)
                    })
                    .padding(.top, 35)
                    Text("""
Unless you cancel at least 24 hours before the end of the 
month, your account will be automatically charged for 
next month subscription.
""")
                    .font(.system(size: 12))
                    .multilineTextAlignment(.center)
                    .padding(.top, 27)
                }
                .vTop()
            }
            .navigationTitle("Subscription Plans")
            .bold()
            .font(.system(size: 20))
     
        }
    }
}

#Preview {
    Subscriptionplans_Basic()
}
