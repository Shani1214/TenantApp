//
//  ResetPasswordView.swift
//  TenantApp
//
//  Created by MacMini on 20/02/2025.
//

import SwiftUI

class ResetPasswordViewModel: ObservableObject {
    @Published var newpassword: String = ""
    @Published var confirmpassword: String = ""
    @Published var isSecure: Bool = true
    @Published var isSecure1: Bool = true
    @Published var showpopup: Bool = false
    @Published var isNavtoLogin: Bool = false
}

struct ResetPasswordView: View {
    @StateObject var viewmodel = ResetPasswordViewModel()
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        ZStack {
            VStack {
                Text("Reset Password")
                    .bold()
                    .font(.system(size: 24))
                    .padding(.top, 40)
                    .hLeading()
                    .padding(.leading, 22)

                Text("""
                     Enter a new password with at least 8 
                     characters, including letters, numbers, and 
                     symbols.
                     """)
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 16))
                    .hLeading()
                    .padding(.leading, 22)
                    .padding(.top, 1)

                Text("New Password")
                    .bold()
                    .font(.system(size: 14))
                    .padding(.top, 26)
                    .hLeading()
                    .padding(.leading, 25)

                VStack {
                    ZStack {
                        if viewmodel.isSecure {
                            SecureField("Enter Password", text: $viewmodel.newpassword)
                        } else {
                            TextField("Enter Password", text: $viewmodel.newpassword)
                        }
                        Button(action: {
                            viewmodel.isSecure.toggle()
                        }) {
                            Image(systemName: viewmodel.isSecure ? "eye.slash.fill" : "eye.fill")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(.gray)
                        }
                        .hTrailing()
                        .padding(.trailing,10)
                    }
                    .padding(.horizontal, 10)
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                    .padding(.horizontal, 22)
                }

                Text("Confirm Password")
                    .bold()
                    .font(.system(size: 14))
                    .padding(.top, 26)
                    .hLeading()
                    .padding(.leading, 25)

                VStack {
                    ZStack {
                        if viewmodel.isSecure1 {
                            SecureField("Enter Password", text: $viewmodel.confirmpassword)
                        } else {
                            TextField("Enter Password", text: $viewmodel.confirmpassword)
                        }
                        Button(action: {
                            viewmodel.isSecure1.toggle()
                        }) {
                            Image(systemName: viewmodel.isSecure1 ? "eye.slash.fill" : "eye.fill")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(.gray)
                        }
                        .hTrailing()
                        .padding(.trailing,10)
                    }
                    .padding(.horizontal, 10)
                    .font(.system(size: 15))
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                    .padding(.horizontal, 22)
                }

                ButtonView(buttonTapped: {
                    if viewmodel.newpassword.isEmpty || viewmodel.confirmpassword.isEmpty {
                        alertMessage = "All fields are required."
                        showAlert = true
                    } else if viewmodel.newpassword.count < 8 {
                        alertMessage = "Password must be at least 8 characters long."
                        showAlert = true
                    } else if viewmodel.newpassword != viewmodel.confirmpassword {
                        alertMessage = "Passwords do not match."
                        showAlert = true
                    } else {
                        viewmodel.showpopup = true
                    }
                }, buttonTitle: "Reset Password")
                    .padding(.top, 45)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }

            }
            .vTop()
            .navigationDestination(isPresented: $viewmodel.isNavtoLogin) {
                LoginView()
            }

            if viewmodel.showpopup {
                Color.black.opacity(0.5)
                    .ignoresSafeArea(.all)
                    .overlay(
                        VStack {
                            ZStack {
                                Circle()
                                    .foregroundStyle(Color.gray.opacity(0.1))
                                    .frame(width: 120, height: 120)
                                Circle()
                                    .foregroundStyle(Color.theme.appblue)
                                    .frame(width: 88, height: 88)
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .frame(width: 30, height: 23)
                                    .foregroundStyle(Color.white)
                            }
                            Text("Reset Successfully!")
                                .bold()
                                .font(.system(size: 18))
                                .padding(.top, 15)
                            Text("""
Your password has been updated. 
You can now log in with your new
password.
""")
                                .foregroundStyle(Color.gray)
                                .font(.system(size: 15))
                                .multilineTextAlignment(.center)
                                .padding(.top, 5)
                            ButtonView(buttonTapped: {
                                viewmodel.isNavtoLogin = true
                            }, buttonTitle: "Go to Login")
                                .padding(.top, 18)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 367)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 1)
                        .padding(.horizontal, 20)
                    )
            }
        }
    }
}

#Preview {
    ResetPasswordView()
}
