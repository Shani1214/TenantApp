import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image.appImage.tenantlogo
                    .resizable()
                    .frame(width: 211, height: 162)
                Spacer()
                ProgressView()
                Text("Version 1.0.1 (Latest)")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 14))
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isActive = true
                }
            }
            .navigationDestination(isPresented: $isActive) {
                LoginView() // Replace with your actual next screen view
            }
        }.onAppear{
            for family: String in UIFont.familyNames {
                print("\(family)")
                for names: String in UIFont.fontNames(forFamilyName: family) {
                    print("== \(names)")
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
