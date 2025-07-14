import SwiftUI

class SignUpviewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var repeatpassword: String = ""
    @Published var isChecked: Bool = false
    @Published var isNavtoLogin: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
}

struct SignUpView: View {
    @StateObject var viewmodel = SignUpviewModel()
    @State private var isSecure: Bool = true
    @State private var isSecure1: Bool = true
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Image.appImage.tenantlogo
                        .resizable()
                        .frame(width: 135, height: 103)
                    Text("Create your Account")
                        .bold()
                        .font(.system(size: 18))
                        .padding(.top, 15)
                    
                    Text("Full Name")
                        .bold()
                        .font(.system(size: 14))
                        .padding(.top, 26)
                        .hLeading()
                        .padding(.leading, 25)
                    textfield(placeholder: "Enter Name", variable: $viewmodel.name)
                    
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
                                    isSecure.toggle()
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
                    
                    Text("Repeat Password")
                        .bold()
                        .font(.system(size: 14))
                        .padding(.top, 26)
                        .hLeading()
                        .padding(.leading, 25)
                    VStack {
                        ZStack {
                            if isSecure1 {
                                SecureField("Enter Password", text: $viewmodel.repeatpassword)
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
                                TextField("Enter Password", text: $viewmodel.repeatpassword)
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
                                    isSecure1.toggle()
                                }) {
                                    Image(systemName: isSecure1 ? "eye.slash.fill" : "eye.fill")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .foregroundColor(.gray)
                                }
                                .padding(.trailing, 35)
                            }
                        }
                    }
                    
                    ButtonView(buttonTapped: {
                        if viewmodel.name.isEmpty {
                            viewmodel.alertMessage = "Please enter your full name."
                            viewmodel.showAlert = true
                        } else if viewmodel.email.isEmpty {
                            viewmodel.alertMessage = "Please enter your email."
                            viewmodel.showAlert = true
                        } else if viewmodel.password.isEmpty {
                            viewmodel.alertMessage = "Please enter a password."
                            viewmodel.showAlert = true
                        } else if viewmodel.repeatpassword.isEmpty {
                            viewmodel.alertMessage = "Please confirm your password."
                            viewmodel.showAlert = true
                        } else if viewmodel.password != viewmodel.repeatpassword {
                            viewmodel.alertMessage = "Passwords do not match."
                            viewmodel.showAlert = true
                        } else {
                            // Proceed with sign-up logic
                        }
                    }, buttonTitle: "Signup")
                    .padding(.top, 41)
                    HStack(spacing:0){
                        Text("Already have an account?")
                            .font(.system(size: 15))
                        Button(action: {
                            
                        }, label: {
                            Text("Login")
                                .bold()
                                .font(.system(size: 15))
                                .padding(.leading,5)
                        })
                    }
                    .padding(.top,34)
                }
                .vTop()
                .navigationDestination(isPresented: $viewmodel.isNavtoLogin) {
                    LoginView()
                }
            }
        }
        .alert(isPresented: $viewmodel.showAlert) {
            Alert(
                title: Text("Missing Information"),
                message: Text(viewmodel.alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    SignUpView()
}
