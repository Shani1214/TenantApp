//
//  CompleteProfile.swift
//  TenantApp
//
//  Created by MacMini on 21/02/2025.
//

import SwiftUI
class CreateAccountViewModel : ObservableObject {
    @Published var fullname : String = ""
    @Published var gender : String = ""
    @Published var phone : String = ""
    @Published var about : String = ""
    @Published var address : String = ""
    @Published var selectGender = ["Male","Female"]
    @Published var countries = []
    @Published var cities = []
    @Published var isShowingImagePicker = false
    @Published var profilrImage: UIImage?
    @Published var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Published var isNavtoHome:Bool = false
   
}
struct CompleteProfile: View {
    @StateObject var viewModel = CreateAccountViewModel()
    var body: some View {
        VStack {
            ScrollView{
                VStack {
                    Text("Let's complete your profile")
                        .hLeading()
                        .padding(.leading, 21)
                        .bold()
                        .font(.system(size: 22))
                    Button(action: {
                        viewModel.isShowingImagePicker.toggle()
                    }, label: {
                        if let image = viewModel.profilrImage {
                            ZStack {
                                Circle()
                                    .stroke(Color.theme.appblue)
                                    .frame(width: 100, height: 100)
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(50)
                                Image.appImage.AddCircle
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .padding(.top, 75)
                                    .padding(.leading, 75)
                            }
                        }
                        else {
                            ZStack {
                                Circle()
                                    .stroke(Color.theme.appblue)
                                    .frame(width: 100, height: 100)
                                Image.appImage.profile
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                Image.appImage.AddCircle
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .padding(.top, 75)
                                    .padding(.leading, 75)
                            }
                        }
                    })
                    
                    .padding(.top, 28)
                    Text("Add Profile Image")
                        .font(.system(size: 13))
                        .bold()
                        .padding(.top, 10)
                    Text("Add Details")
                   
                        .bold()
                        .padding(.top, 20)
                        .hLeading()
                        .padding(.leading, 11)
                        .font(.customFont(.urbanistRegular, size: 18))
                    textfield(placeholder: "Gender", variable: $viewModel.gender)
                        .padding(.top, 12)
                    textfield(placeholder: "Phone", variable: $viewModel.phone)
                        .padding(.top, 22)
                    ZStack{
                        textfield(placeholder: "Address", variable: $viewModel.address)
                            .padding(.top, 22)
                        Button(action: {
                            
                        }, label: {
                            Image.appImage.location
                                .resizable()
                                .frame(width: 24, height: 24)
                                .hTrailing()
                                .padding(.trailing,34)
                                .padding(.top,24)
                        })
                    }
                    textfield(placeholder: "About", variable: $viewModel.about)
                        .padding(.top, 22)
                    ButtonView(buttonTapped: {}, buttonTitle: "Save")
                        .padding(.top,55)
                }
                .vTop()
                .padding(.top, 40)
                .sheet(isPresented: $viewModel.isShowingImagePicker) {
                    ImagePicker(sourceType: viewModel.sourceType) { image in
                        viewModel.profilrImage = image
                    }
                }
            }
        }
    }
}

#Preview {
    CompleteProfile()
}
