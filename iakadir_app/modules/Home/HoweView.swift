import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // Background
            Color.black.edgesIgnoringSafeArea(.all)
            
            // Curved lines background (similar to onboarding)
            ForEach(0..<8) { index in
                Circle()
                    .stroke(Color.gray.opacity(0.1), lineWidth: 1)
                    .scaleEffect(1.0 + Double(index) * 0.1)
            }
            
            VStack(spacing: 24) {
                // Top Bar
                HStack {
                    Button(action: {
                        // Menu action
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Text("Hello, Ethan 👋")
                        .font(.title3)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        // PRO action
                    }) {
                        Text("PRO ✨")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                Capsule()
                                    .stroke(Color(UIColor(red: 0.80, green: 1.00, blue: 0.00, alpha: 1.00)), lineWidth: 1)
                            )
                    }
                }
                .padding()
                
                // Main Content
                VStack(alignment: .leading, spacing: 32) {
                    Text("Qu'est-ce que tu\nveux faire ?")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(Color(UIColor(red: 0.80, green: 1.00, blue: 0.00, alpha: 1.00)))
                        .padding(.horizontal)
                    
                    // Action Cards Grid
                    VStack(spacing: 16) {
                        // Résumer un son
                        ActionCard(
                            icon: "waveform",
                            title: "Résumer\nun son",
                            color: Color(UIColor(red: 0.80, green: 1.00, blue: 0.00, alpha: 1.00)),
                            action: {}
                        )
                        
                        HStack(spacing: 16) {
                            // Parler à l'IA
                            ActionCard(
                                icon: "message",
                                title: "Parler à l'IA",
                                color: Color(UIColor(red: 0.72, green: 0.50, blue: 1.00, alpha: 1.00)),
                                action: {}
                            )
                            
                            // Générer une image
                            ActionCard(
                                icon: "photo",
                                title: "Générer une image",
                                color: Color(UIColor(red: 1.00, green: 0.62, blue: 0.71, alpha: 1.00)),
                                action: {}
                            )
                        }
                        .frame(height: 160)
                    }
                    .padding(.horizontal)
                    
                    // History Section
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Historique")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button("Voir tout") {
                                // View all action
                            }
                            .foregroundColor(.gray)
                        }
                        
                        VStack(spacing: 12) {
                            HistoryItem(
                                icon: "waveform",
                                text: "Swift est un langage de pogrammat...",
                                color: Color(UIColor(red: 0.80, green: 1.00, blue: 0.00, alpha: 1.00))
                            )
                            
                            HistoryItem(
                                icon: "message",
                                text: "Dis-moi qui est Elvia Front, s'il te plaît...",
                                color: Color(UIColor(red: 0.72, green: 0.50, blue: 1.00, alpha: 1.00))
                            )
                            
                            HistoryItem(
                                icon: "photo",
                                text: "Un sal sanglier qui danse avec son pè...",
                                color: Color(UIColor(red: 1.00, green: 0.62, blue: 0.71, alpha: 1.00))
                            )
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
        }
    }
}

struct ActionCard: View {
    let icon: String
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 24)
                    .fill(color.opacity(0.2))
                
                VStack(alignment: .leading, spacing: 12) {
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundColor(color)
                        .padding(12)
                        .background(Circle().fill(color.opacity(0.2)))
                    
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Image(systemName: "arrow.up.right")
                            .foregroundColor(color)
                    }
                }
                .padding()
            }
        }
    }
}

struct HistoryItem: View {
    let icon: String
    let text: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(color)
                .frame(width: 40, height: 40)
                .background(Circle().fill(color.opacity(0.2)))
            
            Text(text)
                .foregroundColor(.white)
                .lineLimit(1)
            
            Spacer()
            
            Button(action: {
                // More options
            }) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}
// Preview
struct HoweView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
