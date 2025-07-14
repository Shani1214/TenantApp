//
//  TabView.swift
//  StarafaApp
//
//  Created by MacMini on 20/11/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        
        TabView {
            DashboardView()
            
                .tabItem{
                    VStack{
                        Image.appImage.dashboard

                        Text("Dashboard")
                            .foregroundStyle(Color.black)
                    }
                }
            CompleteProfile()
            
                .tabItem{
                    VStack{
                        Image.appImage.properties
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Properties")
                    }
                }
            AllowLocationVC()
            
                .tabItem{
                    VStack{
                        Image.appImage.messages

                        Text("Messages")
                    }
                }
            
            MyProfile()
            
                .tabItem{
                    VStack{
                        Image.appImage.profile
                        
                        Text("Profile")
                    }
                }
        }
    }
}

#Preview {
    MainTabView()
}
