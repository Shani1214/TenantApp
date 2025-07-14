//
//  OTPVerificationView.swift
//  TenantApp
//
//  Created by MacMini on 19/02/2025.
//

import SwiftUI

class OTPVerificationViewModel: ObservableObject {
    @Published var otp: String = ""
    @Published var showPopup: Bool = false
}

struct OTPVerificationView: View {
    @StateObject var viewmodel = OTPVerificationViewModel()
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        ZStack {
            VStack {
                Text("OTP Verification")
                    .bold()
                    .font(.system(size: 24))
                    .padding(.top, 40)
                    .hLeading()
                    .padding(.leading, 22)

                Text("Enter the verification code we just sent on your email address.")
                    .font(.system(size: 16))
                    .foregroundStyle(Color.gray)
                    .hLeading()
                    .padding(.leading, 22)
                    .padding(.top, 5)

                OTPFieldView(numberOfFields: 4, otp: $viewmodel.otp)
                    .padding(.top, 29)

                ButtonView(buttonTapped: {
                    if viewmodel.otp.count < 4 {
                        alertMessage = "Please enter a valid 4-digit OTP."
                        showAlert = true
                    } else {
                        viewmodel.showPopup = true
                    }
                }, buttonTitle: "Verify")
                    .padding(.top, 55)
                    .padding(.horizontal, 15)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }

                HStack(spacing: 0) {
                    Text("Didn't receive code?")
                        .font(.system(size: 15))

                    Button(action: {
                        // Resend OTP action
                    }, label: {
                        Text("Resend")
                            .bold()
                            .font(.system(size: 15))
                            .padding(.leading, 5)
                    })
                }
                .padding(.top, 51)
            }
            .vTop()
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    OTPVerificationView()
}
