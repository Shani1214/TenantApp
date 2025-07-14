import SwiftUI
class DashboardViewModel: ObservableObject {
    @Published var showupdatepopup : Bool = false
    @Published var showupdatepopup1 : Bool = false
    @Published var subscriptionfailedpopoup : Bool = false
}

struct DashboardView: View {
    @StateObject var viewmodel = DashboardViewModel()
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    ZStack {
                        VStack {
                            HStack {
                                Button(action: {
                                    viewmodel.subscriptionfailedpopoup = true
                                }, label: {
                                    Image.appImage.sidemenu
                                        .resizable()
                                        .frame(width: 23, height: 21)
                                })
                                Text("Tenant Trust")
                                    .bold()
                                    .font(.system(size: 20))
                                    .foregroundStyle(Color.white)
                                Spacer()
                                Button(action: {
                                    viewmodel.showupdatepopup = true
                                }, label: {
                                    Image.appImage.bell
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                })
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 30)
                            HStack {
                                VStack(alignment: .leading, spacing: 7) {
                                    Text("Good Morning!")
                                        .foregroundStyle(Color.white)
                                        .font(.system(size: 14))
                                    Text("Darlene Robertson")
                                        .bold()
                                        .foregroundStyle(Color.white)
                                        .font(.system(size: 15))
                                }
                                Spacer()
                                Button(action: {
                                    viewmodel.showupdatepopup1 = true
                                }, label: {
                                    Image.appImage.allen
                                        .resizable()
                                        .frame(width: 44, height: 44)
                                        .hTrailing()
                                })
                            }
                            .padding(.horizontal, 20)
                            .padding(.top, 15)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 195)
                    .background {
                        LinearGradient(
                            gradient: Gradient(colors: [Color.theme.appblue.opacity(0.6), Color.theme.darkblue]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    }
                    ScrollView(showsIndicators: false) {
                        ForEach(0..<5) { item in
                            HStack {
                                VStack {
                                    HStack {
                                        Image.appImage.apartment
                                            .resizable()
                                            .frame(width: 71, height: 71)
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Sunrise Apartments")
                                                .bold()
                                                .font(.system(size: 15))
                                            Text("""
        322 Hoffman Dr, Cherry Hill, NJ 
        08077, New York
        """)
                                            .foregroundStyle(Color.theme.appblue)
                                            .font(.system(size: 13))
                                            .underline()
                                        }.padding(.leading, 5)
                                    }.hLeading()
                                    .padding(.leading, 13)
                                    HStack {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Rent Amount:")
                                                .foregroundStyle(Color.gray)
                                                .font(.system(size: 11))
                                            Text("$12000 per year")
                                                .font(.system(size: 12))
                                        }
                                        Spacer()
                                        VStack(alignment: .leading) {
                                            Text("Payment Status")
                                                .foregroundStyle(Color.gray)
                                                .font(.system(size: 11))
                                            HStack {
                                                Circle()
                                                    .foregroundStyle(Color.green)
                                                    .frame(width: 6, height: 6)
                                                Text("Paid")
                                                    .font(.system(size: 12))
                                                    .italic()
                                            }
                                        }.hTrailing()
                                        .padding(.trailing, 84)
                                    }.padding(.horizontal, 12)
                                    HStack {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Payment Frequency:")
                                                .foregroundStyle(Color.gray)
                                                .font(.system(size: 11))
                                            Text("Monthly")
                                                .font(.system(size: 12))
                                        }.padding(.leading, 12)
                                        Spacer()
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Rent Payment Deadline:")
                                                .foregroundStyle(Color.gray)
                                                .font(.system(size: 11))
                                            Text("25th of each month")
                                                .font(.system(size: 12))
                                        }.padding(.trailing, 52)
                                    }
                                    .padding(.top, 6)
                                }
                            }.frame(maxWidth: .infinity)
                            .frame(height: 184)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding(.horizontal, 20)
                            .padding(.top, 10)
                        }
                    }
                }
                .ignoresSafeArea()
                .vTop()
            }
            if viewmodel.showupdatepopup {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                VStack(spacing: 15) {
                    Image.appImage.reload
                        .padding(.top,15)
                    Text("Update Available!")
                        .bold()
                        .font(.system(size: 20))
                        .foregroundColor(Color.theme.appblue)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Hello! Please go to the google play store to update Tenant Trust!")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 20)
                        
                        Text("We are always working to update our content and features while removing pesky bugs to give you the best experience.")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 20)
                            .padding(.top,15)
                    }
                        Text("Version: 1.0.2")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                            .bold()
                            .hLeading()
                            .padding(.leading,30)
                            .padding(.top,16)
                    ButtonView(buttonTapped: {
                        
                    }, buttonTitle: "Update")
                    .padding(.horizontal,10)
                    .padding(.top,16)
                    Button(action: {
                        viewmodel.showupdatepopup = false
                    }) {
                        Text("Skip and use the old version 1.0.0")
                            .bold()
                            .foregroundColor(Color.gray)
                            .font(.system(size: 16))
                            .underline()
                    }
                    .padding(.top, 10)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 420)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
                .padding(.horizontal,20)
            }
            if viewmodel.showupdatepopup1 {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                VStack(spacing: 15) {
                    Image.appImage.reload
                        .padding(.top,15)
                    Text("Update Available!")
                        .bold()
                        .font(.system(size: 20))
                        .foregroundColor(Color.theme.appblue)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Hello! Please go to the google play store to update Tenant Trust!")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 20)
                        Text("We are always working to update our content and features while removing pesky bugs to give you the best experience.")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 20)
                            .padding(.top,15)
                    }
                        Text("Version: 1.0.2")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                            .bold()
                            .hLeading()
                            .padding(.leading,30)
                            .padding(.top,16)
                    ButtonView(buttonTapped: {
                        viewmodel.showupdatepopup1 = false
                    }, buttonTitle: "Update")
                    .padding(.horizontal,10)
                    .padding(.top,16)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 403)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
                .padding(.horizontal,20)
            }
            if viewmodel.subscriptionfailedpopoup {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                VStack(spacing: 15) {
                    Image.appImage.reload 
                        .padding(.top,15)
                    Text("Subscription Expired")
                        .bold()
                        .font(.system(size: 20))
                        .foregroundColor(Color.red)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("""
                             Uh-oh! Your Subscription Has Ended!" – But don't worry, for your journey doesn't have to stop here. Keep the momentum going and renew today to enjoy seamless access to all our offerings. Don't miss out on the countless benefits awaiting you with an active subscription. Act now and keep the 
                             experience alive!💡!
                             """)
                            .foregroundColor(Color.gray)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, 20)
                        
                     
                    }
                        Text("Version: 1.0.2")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                            .bold()
                            .hLeading()
                            .padding(.leading,30)
                            .padding(.top,16)
                    ButtonView(buttonTapped: {
                        
                    }, buttonTitle: "Subscribe Now")
                    .padding(.horizontal,10)
                    .padding(.top,16)
                    Button(action: {
                        viewmodel.subscriptionfailedpopoup = false
                    }) {
                        Text("Skip, Move on Free")
                            .bold()
                            .foregroundColor(Color.theme.darkblue)
                            .font(.system(size: 16))
                            .underline()
                    }.padding(.top,24)
                  
                }
                .frame(maxWidth: .infinity)
                .frame(height: 450)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 5)
                .padding(.horizontal,20)
            }
            }
        }
    }


#Preview {
    DashboardView()
}
