//
//  ButtonView.swift
//  Starafa
//
//  Created by macbook on 03/09/2024.
//


import SwiftUI

struct ButtonView: View {
    var buttonTapped: () -> Void
    var buttonTitle:String
    var body: some View {
        VStack {
            Button {
                buttonTapped()
            } label: {
                
              //  Image.appImage.userPlaceholder
                
                Text(buttonTitle)
                    .foregroundStyle(Color.white)
                    .font(.system(size: 18))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                   
                    //.background(Color.black)
                   
                 
            }
            
            .frame(maxWidth: .infinity)
                .frame(height:50)
                .background{
                    LinearGradient(
                        gradient: Gradient(colors: [Color.theme.lightblue, Color.theme.darkblue]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                }
                .cornerRadius(10)
            .padding(.horizontal,22)
        }
    }
}
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonTapped: {}, buttonTitle: "kjhjk")
    }
}

import SwiftUI

struct AllowButton: View {
    var buttonTapped: () -> Void
    var buttonTitle:String
    var body: some View {
        VStack {
            Button {
                buttonTapped()
            } label: {
                
              //  Image.appImage.userPlaceholder
                
                Text(buttonTitle)
                    .foregroundStyle(Color.white)
                    .font(.system(size: 18))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                   
                    //.background(Color.black)
                    .background {
                        LinearGradient(
                            gradient: Gradient(colors: [Color.theme.lightblue, Color.theme.darkblue.opacity(0.6)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    }
                    .cornerRadius(10)
                 
            }
            
            .frame(maxWidth: .infinity)
                .frame(height:50)
               
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 1)
                    )
               // .cornerRadius(10)
            .padding(.horizontal,22)
        }
    }
}
struct AllowButton_Previews: PreviewProvider {
    static var previews: some View {
        AllowButton(buttonTapped: {}, buttonTitle: "kjhjk")
    }
}

import SwiftUI
struct YearlypkgButtonView: View {
    var buttonTapped: () -> Void
    var buttonTitle:String
    var body: some View {
        VStack {
            Button {
                buttonTapped()
            } label: {
              //  Image.appImage.userPlaceholder
                Text(buttonTitle)
                    .foregroundStyle(Color.blue)
                    .font(.system(size: 16))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                   
                    //.background(Color.black)
            }
            .frame(maxWidth: .infinity)
                .frame(height:51)
                .overlay(
                              RoundedRectangle(cornerRadius: 1)
                                  .stroke(LinearGradient(
                                    gradient: Gradient(colors: [Color.theme.lightblue, Color.theme.lightblue]),
                                      startPoint: .top,
                                      endPoint: .bottom
                                  ), lineWidth: 2) // Overlay border effect
                          )
            .padding(.horizontal,22)
        }
    }
}
struct YearlypkgButtonView_Previews: PreviewProvider {
    static var previews: some View {
        YearlypkgButtonView(buttonTapped: {}, buttonTitle: "kjhjk")
    }
}


import SwiftUI
struct MonthlypkgButtonView: View {
    var buttonTapped: () -> Void
    var buttonTitle:String
    var body: some View {
        VStack {
            Button {
                buttonTapped()
            } label: {
              //  Image.appImage.userPlaceholder
                Text(buttonTitle)
                    .foregroundStyle(Color.blue)
                    .font(.system(size: 16))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                   
                    //.background(Color.black)
            }
            .frame(maxWidth: .infinity)
                .frame(height:51)
                .overlay(
                              RoundedRectangle(cornerRadius: 1)
                                  .stroke(LinearGradient(
                                    gradient: Gradient(colors: [Color.theme.lightblue, Color.theme.lightblue]),
                                      startPoint: .top,
                                      endPoint: .bottom
                                  ), lineWidth: 2) // Overlay border effect
                          )
            .padding(.horizontal,22)
        }
    }
}
struct MonthlypkgButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MonthlypkgButtonView(buttonTapped: {}, buttonTitle: "kjhjk")
    }
}


