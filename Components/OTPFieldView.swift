//
//  OTPFeildView.swift
//  FamoCare
//
//  Created by macbook on 07/01/2025.
//

import Foundation

import SwiftUI
import Combine

struct OTPFieldView: View {
    @FocusState private var pinFocusState: FocusPin?
    @Binding private var otp: String
    @State private var pins: [String]
    
    var numberOfFields: Int
    var fieldsFrame: CGFloat = 55
    
    enum FocusPin: Hashable {
        case pin(Int)
    }
    
    init(numberOfFields: Int, otp: Binding<String>) {
        self.numberOfFields = numberOfFields
        self._otp = otp
        self._pins = State(initialValue: Array(repeating: "", count: numberOfFields))
        self.fieldsFrame = numberOfFields == 4 ? 54  : 48
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            ForEach(0..<numberOfFields, id: \.self) { index in
                ZStack {
                    Text(pins[index])
                        .foregroundColor(Color.blue)
                        .frame(width: 64, height: 60)
                        .background(pins[index].isEmpty ? Color.gray.opacity(0.1) : Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(pins[index].isEmpty ? Color.theme.appblue.opacity(0.5) : Color.blue, lineWidth: 1)
                        )
                    
                    TextField("", text: $pins[index])
                        .foregroundColor(.clear)
                        .keyboardType(.numberPad)
                      
                        .focused($pinFocusState, equals: FocusPin.pin(index))
                        .onChange(of: pins[index]) { newValue in
                            handleInputChange(for: index, newValue: newValue)
                        }
                    
                        .onAppear {
                            if index == 0 && otp.isEmpty {
                                pinFocusState = FocusPin.pin(0)
                            }
                        }
                        .opacity(0)
                }
                
            }
            Spacer()
        }
        .onTapGesture{
            pinFocusState = FocusPin.pin(otp.count-1 < 0 ? 0 : otp.count-1)
        }
        .padding(.horizontal)
        .onAppear {
            updatePinsFromOTP()
        }
    }
    
    private func handleInputChange(for index: Int, newValue: String) {
        if newValue.count == 1 {
            if (numberOfFields != otp.count){
                pins[index] = newValue
            }
        } else if newValue.count == 2 {
            if (numberOfFields != otp.count){
                if index < numberOfFields - 1 && pins[index + 1].isEmpty {
                    pinFocusState = FocusPin.pin(index + 1)
                    pins[index] = String(newValue.prefix(1))
                    pins[index+1] = String(newValue.last ?? "0")
                }
            }else{
                pins[index] = String(newValue.prefix(1))
            }
        } else {
            pins[index] = ""
            if index > 0 {
                pinFocusState = FocusPin.pin(index - 1)
            }
        }
        updateOTPString()
    }
    
    private func updatePinsFromOTP() {
        let otpArray = Array(otp.prefix(numberOfFields))
        for (index, char) in otpArray.enumerated() {
            pins[index] = String(char)
        }
    }
    
    private func updateOTPString() {
        otp = pins.joined()
        DispatchQueue.main.async {
            if otp.count == numberOfFields {
               // hideKeyboard()
            }
        }
    }
}

//struct OTPFieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        OTPFieldView(numberOfFields: 4, otp: otpcode)
//    }
//}
