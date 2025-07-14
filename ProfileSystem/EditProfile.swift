import SwiftUI

class EditProfileViewModel: ObservableObject {
    @Published var Fullname = ""
    @Published var Email = ""
    @Published var phonenumber = ""
    @Published var selectedGender: String = "Select Gender"
    @Published var showGenderList = false
    let genderOptions = ["Male", "Female"]
    @Published var address = ""
    @Published var Dateofbirth = ""
    @Published var City = ""
    @Published var Country = ""
    @Published var About = ""
}

struct EditProfile: View {
    @StateObject var viewmodel = EditProfileViewModel()
    @State private var showGenderPicker = false
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                VStack(spacing: 0) {
                    ZStack {
                                     Image.appImage.jennifer
                                         .resizable()
                                         .frame(width: 100, height: 100)
                                         .padding(.top, 30)
                                     
                                     Button(action: {}, label: {
                                         ZStack {
                                             Circle()
                                                 .frame(width: 29, height: 29)
                                                 .foregroundStyle(Color.theme.appblue)
                                                 .padding(.top, 95)
                                                 .padding(.leading, 60)
                                             Image.appImage.camera
                                                 .resizable()
                                                 .frame(width: 15, height: 12)
                                                 .padding(.top, 95)
                                                 .padding(.leading, 60)
                                         }
                                     })
                                 }
                                 .padding(.top, 50)
                    // Full Name Field
                    Text("Full Name")
                        .foregroundColor(.gray.opacity(0.6))
                        .bold()
                        .padding(.leading, 24)
                        .font(.system(size: 14))
                        .hLeading()
                        .padding(.top, 19)
                    
                    TextField("", text: $viewmodel.Fullname)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(3.0)
                        .padding(.horizontal, 24)
                        .padding(.top, 5)

                    // Email Field
                    Text("Email")
                        .foregroundColor(.gray.opacity(0.6))
                        .bold()
                        .padding(.leading, 24)
                        .font(.system(size: 14))
                        .hLeading()
                        .padding(.top, 10)
                    
                    TextField("", text: $viewmodel.Email)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(3.0)
                        .padding(.horizontal, 24)
                        .padding(.top, 5)

                    // Phone Number Field
                    Text("Phone Number")
                        .foregroundColor(.gray.opacity(0.6))
                        .bold()
                        .padding(.leading, 24)
                        .font(.system(size: 14))
                        .hLeading()
                        .padding(.top, 10)
                    
                    TextField("", text: $viewmodel.phonenumber)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(3.0)
                        .padding(.horizontal, 24)
                        .padding(.top, 5)

                    // Gender Field with Dropdown
                    Text("Gender")
                        .foregroundColor(.gray.opacity(0.6))
                        .bold()
                        .padding(.leading, 24)
                        .font(.system(size: 14))
                        .hLeading()
                        .padding(.top, 10)

                    ZStack {
                        HStack {
                            Text(viewmodel.selectedGender)
                                .foregroundColor(viewmodel.selectedGender == "Select Gender" ? .gray : .black)
                                .padding(.leading, 10)

                            Spacer()

                            Image(systemName: "chevron.down")
                                .resizable()
                                .frame(width: 12, height: 7)
                                .foregroundColor(.black)
                                .padding(.trailing,20)
                                .onTapGesture {
                                    withAnimation {
                                        viewmodel.showGenderList.toggle()
                                    }
                                }
                        }
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .padding(.horizontal, 24)
                        .padding(.top,5)

                        // Gender Dropdown List
                        if viewmodel.showGenderList {
                            VStack(spacing: 0) {
                                ForEach(viewmodel.genderOptions, id: \.self) { gender in
                                    Text(gender)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.white)
                                        .onTapGesture {
                                            viewmodel.selectedGender = gender
                                            viewmodel.showGenderList = false
                                        }
                                }
                            }
                            .frame(width: 200)
                            .background(Color.white)
                            .cornerRadius(5)
                            .shadow(radius: 5)
                            .offset(y: 60)
                        }
                    }

                    // Address Field
                    Text("Address")
                        .foregroundColor(.gray.opacity(0.6))
                        .bold()
                        .padding(.leading, 24)
                        .font(.system(size: 14))
                        .hLeading()
                        .padding(.top, 10)
                    
                    TextField("", text: $viewmodel.address)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(3.0)
                        .padding(.horizontal, 24)
                        .padding(.top, 5)

                    // About Field
                    Text("About")
                        .foregroundColor(.gray.opacity(0.6))
                        .bold()
                        .padding(.leading, 24)
                        .font(.system(size: 14))
                        .hLeading()
                        .padding(.top, 10)
                    
                    TextField("", text: $viewmodel.About)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(3.0)
                        .padding(.horizontal, 24)
                        .padding(.top, 5)

                    ButtonView(buttonTapped: {}, buttonTitle: "Save Changes")
                    .padding(.top, 62)
                    
                }
            }
            .navigationTitle("Edit Profile")
        }
    }
}

#Preview {
    EditProfile()
}
