//
//  MapVC.swift
//  AUTOFOB
//
//  Created by MacMini on 28/03/2024.
//

import SwiftUI
class LocationMapViewModel: ObservableObject {
    @Published var location: String = ""
    @Published var Email = ""
}
//
//  MapScreen.swift
//  SnapProjectVC
//
//  Created by MacMini on 01/06/2024.
//

import SwiftUI

struct LocationMap: View {
    
    @StateObject var viewmodel = LocationMapViewModel()
    var body: some View {
        ZStack{
            Image.appImage.map
                .resizable()
                .ignoresSafeArea()
            ScrollView(showsIndicators:false){
                VStack{
                    HStack{
                        TextField("Search Location here..", text: $viewmodel.Email)
                            .font(.system(size: 14))
                            .padding(.leading,4)
                            .padding(.horizontal,15)
                            .frame(maxWidth: .infinity)
                            .frame(height: 43)
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color: Color("Color 1"), radius: 6)
                        Button(action: {
                            
                        }, label: {
                            ZStack{
                                Circle()
                                    .fill(Color.theme.appblue)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "magnifyingglass")
                                    .foregroundStyle(Color.white)
                                    
                                    .frame(width: 24, height: 24)
                            }.padding(.leading,10)
                        })
                      
                    }.padding(.horizontal,25)
                        .padding(.top,60)
                    Image("Group 18274")
                        .resizable()
                        .frame(width: 41, height: 27)
                        .padding(.top,400)
                        .hLeading()
                        .padding(.leading,130)
                    ButtonView(buttonTapped: {}, buttonTitle: "Save")
                        .padding(.top,250)
                }.vTop()
                    .navigationTitle("Location Map")
                    .bold()
                    .font(.system(size: 20))
            }
        }
    }
}
#Preview {
    LocationMap()
}



