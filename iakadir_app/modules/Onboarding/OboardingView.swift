import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            // Background
            Color.black.edgesIgnoringSafeArea(.all)
            
            // Curved lines
            ForEach(0..<8) { index in
                Circle()
                    .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                    .scaleEffect(1.0 + Double(index) * 0.1)
            }
            
            VStack(spacing: 40) {
                // App name
                Text("Iakadir")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(UIColor(red: 0.80, green: 1.00, blue: 0.00, alpha: 1.00)))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 24)
                    .background(
                        Capsule()
                            .fill(Color(UIColor(red: 0.80, green: 1.00, blue: 0.00, alpha: 1.00)).opacity(0.2))
                    )

                
                // AI Robot face
                VStack(spacing: 0) {
                    // Eyes
                    Image(.iakadirMascotte)
                    
                    // Text
                    VStack(spacing: 8) {
                        Text("Ton assistant IA,")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                        Text("au quotidien.")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    
                    // Button
                    Button(action: {
                    }) {
                        Text("Commencer")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.white)
                            )
                            .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 50)
                }
                
            
                            }
                .padding()
            }
        }
    }

// Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
