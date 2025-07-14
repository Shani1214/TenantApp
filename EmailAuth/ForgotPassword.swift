//
//  ForgotPassword.swift
//  TenantApp
//
//  Created by MacMini on 20/02/2025.
//

import SwiftUI

class ForgotPasswordViewModel: ObservableObject {
    @Published var email = ""
    @Published var isNavtoResetPassword: Bool = false
}

struct ForgotPassword: View {
    @StateObject var viewmodel = ForgotPasswordViewModel()
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        VStack {
            VStack(spacing: 5) {
                Text("Forgot Password")
                    .bold()
                    .font(.system(size: 24))
                    .padding(.top, 40)
                    .hLeading()
                    .padding(.leading, 22)

                Text("""
No worries! It happens! Please provide your
email address for \("Tenant Trust️") to send you a
password reset link.
""")
                    .font(.system(size: 16))
                    .foregroundStyle(Color.gray)
                    .hLeading()
                    .padding(.leading, 22)

                textfield(placeholder: "Enter Email", variable: $viewmodel.email)
                    .padding(.top, 44)

                ButtonView(buttonTapped: {
                    if viewmodel.email.isEmpty {
                        alertMessage = "Please enter your email."
                        showAlert = true
                    } else {
                        // Proceed with sending reset link
                    }
                }, buttonTitle: "Send")
                    .padding(.top, 60)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }

                HStack(spacing: 0) {
                    Text("Remember Password?")
                        .font(.system(size: 15))
                    Button(action: {
                        // Navigate to login
                    }, label: {
                        Text("Login")
                            .bold()
                            .font(.system(size: 15))
                            .padding(.leading, 5)
                    })
                }
                .padding(.top, 50)
            }
            .vTop()
        }
    }
}

#Preview {
    ForgotPassword()
}
