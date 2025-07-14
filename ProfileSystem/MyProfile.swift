//
//  ProfileeVC1.swift
//  AUTOFOB
//
//  Created by MacMini on 30/03/2024.
//

import SwiftUI
class MyProfileViewModel: ObservableObject {
    @Published var editaccount = ""
    @Published var favoriteproperties = ""
    @Published var settings = ""
    @Published var blockeduser = ""
    @Published var logout = ""
}
struct MyProfile: View {
    @StateObject var viewModel = MyProfileViewModel()
    var body: some View {
        VStack{
            ZStack{
                Image.appImage.myprofile
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height:235)
                .frame(maxWidth: .infinity)
                    .frame(height:235)
                    
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Button(action: {
                            
                        }, label: {
                            Image.appImage.sidemenu
                                .resizable()
                                .frame(width:23, height: 21)
                        })
                        .padding(.leading,20)
                        Spacer()
                        
                        Text("My Profile")
                            .bold()
                            .foregroundColor(.white)
                            .font(.system(size: 23))
                            .hLeading()
                            .padding(.leading,115)
                   
                    }
                    Image.appImage.jennifer
                        .resizable()
                        .frame(width: 110, height: 110)
                    Text("Jennifer Fowler")
                        .bold()
                    
                        .font(.system(size: 18))
                    Text("jenniferfowler78@gmail.com")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 14))
                        .padding(.top,5)
                }
            }
            ScrollView{
                HStack{
                    Text("Preferences")
                        .bold()
                    // .foregroundColor(.color4)
                        .hLeading()
                        .padding(.leading,20)
                }.frame(maxWidth: .infinity)
                    .frame(height:35)
                    .background(.gray.opacity(0.2))
                VStack{
                    HStack{
                        ZStack{
                            Image.appImage.editaccount
                                .resizable()
                                .frame(width:24, height: 24)
                        }.frame(width: 36, height: 36)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        
                        Text("Edit Account")
                            .bold()
                            .font(.system(size: 15))
                            .padding(.leading,10)
                       
                        Spacer()
                        Image(systemName: "chevron.right")
                    }.padding(.horizontal,20)
                        .padding(.top,15)
                    HStack{
                        ZStack{
                            Image.appImage.favorite
                                .resizable()
                                .frame(width:24, height: 24)
                        }.frame(width: 36, height: 36)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        Text("Favorite Properties")
                            .bold()
                            .font(.system(size: 15))
                            .padding(.leading,10)
                        Spacer()
                        Image(systemName: "chevron.right")

                    }.padding(.horizontal,20)
                        .padding(.top,20)
                    HStack{
                        ZStack{
                            Image.appImage.settings
                                .resizable()
                                .frame(width:24, height: 24)
                        }.frame(width: 36, height: 36)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        Text("Settings")
                            .bold()
                            .font(.system(size: 15))
                            .padding(.leading,10)
                        Spacer()
                        Image(systemName: "chevron.right")

                    }.padding(.horizontal,20)
                        .padding(.top,20)
                    HStack{
                        ZStack{
                            Image.appImage.blockeduser
                                .resizable()
                                .frame(width:24, height: 24)
                        }.frame(width: 36, height: 36)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        
                        Text("Blocked User")
                            .bold()
                            .font(.system(size: 15))
                            .padding(.leading,10)
                        Spacer()
                        Image(systemName: "chevron.right")

                    }.padding(.horizontal,20)
                        .padding(.top,20)
                    HStack{
                        ZStack{
                            Image.appImage.logout
                                .resizable()
                                .frame(width:24, height: 24)
                        }.frame(width: 36, height: 36)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        
                        Text("Logout")
                            .bold()
                            .font(.system(size: 15))
                            .padding(.leading,10)
                        Spacer()
                    }.padding(.horizontal,20)
                        .padding(.top,20)
                    
                }
            }
        }.vTop()
    }
}
#Preview{
    MyProfile()
}
