import SwiftUI

struct cancelSubscriptionbtnView: View {
    var buttonTapped: () -> Void
    var buttonTitle:String
    var body: some View {
        VStack {
            Button {
                buttonTapped()
            } label: {
                
              //  Image.appImage.userPlaceholder
                
                Text(buttonTitle)
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 18))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                   
                    //.background(Color.black)
                   
                 
            }
            
            .frame(maxWidth: .infinity)
                .frame(height:50)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            .padding(.horizontal,22)
        }
    }
}
struct cancelSubscriptionbtnView_Previews: PreviewProvider {
    static var previews: some View {
        cancelSubscriptionbtnView(buttonTapped: {}, buttonTitle: "kjhjk")
    }
}
