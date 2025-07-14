//
//  SwiftUIView.swift
//  FamoCare
//
//  Created by macMini on 07/01/2025.
//

import SwiftUI

struct textfield: View {
    
    var  placeholder : String
    @Binding var variable : String
    var body: some View {
        
        TextField(placeholder, text: $variable)
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
}

struct textfield1: View {
    
    var  placeholder : String
    @Binding var variable : String
    var body: some View {
        
        SecureField(placeholder, text: $variable)
            .padding(.horizontal, 10)
            .font(.system(size: 15))
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
           
    }
}


import SwiftUI

struct PasswordField: View {
    @Binding var password: String
    @State private var isSecure: Bool = true

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Password")
                .font(.system(size: 14, weight: .bold))

            ZStack(alignment: .trailing) {
                if isSecure {
                    SecureField("Enter Password", text: $password)
                        .padding()
                        .frame(height: 50)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                } else {
                    TextField("Enter Password", text: $password)
                        .padding()
                        .frame(height: 50)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }

                Button(action: {
                    isSecure.toggle()
                }) {
                    Image(systemName: isSecure ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 15)
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Preview
struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordField(password: .constant(""))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
