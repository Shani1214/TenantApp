import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isChecked: Bool = false
    @Published var isNavtoSignUp: Bool = false
    @Published var isNavtoForgotPassword: Bool = false
    
    // New Properties for Alert
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
}

struct LoginView: View {
    @StateObject var viewmodel = LoginViewModel()
    @State private var isSecure: Bool = true
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Image.appImage.tenantlogo
                        .resizable()
                        .frame(width: 135, height: 104)
                    
                    Text("Sign in your account")
                        .bold()
                        .font(.system(size: 18))
                        .padding(.top, 15)
                    
                    Text("Email")
                        .bold()
                        .font(.system(size: 14))
                        .padding(.top, 26)
                        .hLeading()
                        .padding(.leading, 25)
                    
                    textfield(placeholder: "Enter Email", variable: $viewmodel.email)
                    
                    Text("Password")
                        .bold()
                        .font(.system(size: 14))
                        .padding(.top, 26)
                        .hLeading()
                        .padding(.leading, 25)
                    
                    VStack {
                        ZStack {
                            if isSecure {
                                SecureField("Enter Password", text: $viewmodel.password)
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
                            } else {
                                TextField("Enter Password", text: $viewmodel.password)
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
                            
                            HStack {
                                Spacer()
                                Button(action: {
                                    isSecure.toggle() // Toggle visibility
                                }) {
                                    Image(systemName: isSecure ? "eye.slash.fill" : "eye.fill")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .foregroundColor(.gray)
                                }
                                .padding(.trailing, 35)
                            }
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            viewmodel.isChecked.toggle()
                        }) {
                            Image(systemName: viewmodel.isChecked ? "checkmark.square.fill" : "square")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(viewmodel.isChecked ? Color.blue : Color.gray)
                        }
                        .padding(.top, 4)
                        .padding(.leading, 23)
                        
                        Text("Remember me")
                            .bold()
                            .font(.system(size: 13))
                            .hLeading()
                            .padding(.top, 4)
                        
                        Button(action: {
                            viewmodel.isNavtoForgotPassword = true
                        }, label: {
                            Text("Forgot password?")
                                .font(.system(size: 13))
                                .foregroundStyle(Color.theme.appblue)
                        })
                        .padding(.trailing, 20)
                    }
                    .padding(.top, 15)
                    
                    ButtonView(buttonTapped: {
                        validateInputs() // Validate inputs and show alert if needed
                    }, buttonTitle: "Login")
                    .padding(.top, 41)
                    
                    ZStack {
                        Divider()
                        VStack {
                            Text("or continue with")
                                .font(.system(size: 14))
                        }
                        .background(Color.white)
                    }
                    .padding(.top, 37)
                    
                    HStack {
                        Button(action: {}, label: {
                            HStack {
                                Image.appImage.apple
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                Text("Apple")
                                    .bold()
                                    .foregroundStyle(Color.black)
                                    .font(.system(size: 14))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                        })
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.trailing, 10)
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            HStack {
                                Image.appImage.google
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                Text("Google")
                                    .bold()
                                    .foregroundStyle(Color.black)
                                    .font(.system(size: 14))
                            }
                        })
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(.leading, 10)
                    }
                    .padding(.top, 34)
                    .padding(.horizontal, 22)
                    
                    HStack(spacing: 0) {
                        Text("Don’t have an account?")
                            .font(.system(size: 15))
                        Button(action: {
                            viewmodel.isNavtoSignUp = true
                        }, label: {
                            Text("Signup")
                                .bold()
                                .font(.system(size: 15))
                                .padding(.leading, 5)
                        })
                    }
                    .padding(.top, 56)
                }
                .vTop()
                .navigationDestination(isPresented: $viewmodel.isNavtoSignUp) {
                    SignUpView()
                }
                .navigationDestination(isPresented: $viewmodel.isNavtoForgotPassword) {
                    ForgotPassword()
                }
            }
        }
        // Alert to show missing fields
        .alert(isPresented: $viewmodel.showAlert) {
            Alert(title: Text("Input Error"), message: Text(viewmodel.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    // Input Validation Function
    private func validateInputs() {
        if viewmodel.email.isEmpty {
            viewmodel.alertMessage = "Please enter your email address."
            viewmodel.showAlert = true
        } else if viewmodel.password.isEmpty {
            viewmodel.alertMessage = "Please enter your password."
            viewmodel.showAlert = true
        } else {
            // Proceed with login process if inputs are valid
            print("Login successful")
        }
    }
}

#Preview {
    LoginView()
}
