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
            ScrollView{
                
                
                VStack(spacing: 24) {
                    // Top Bar
                    HStack {
                        NavigationLink(destination: ProfileView()) {
                            Image(systemName: "line.horizontal.3")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Text("Hello, Ethan 👋")
                            .font(.title3)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        NavigationLink(destination: SubscriptionView()) {
                            Text("PRO ✨")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(
                                    Capsule()
                                        .stroke(Color(.iakadirGreen), lineWidth: 1)
                                )
                        }
                    }
                    .padding()
                    
                    // Main Content
                    VStack(alignment: .leading, spacing: 32) {
                        Text("Qu'est-ce que tu\nveux faire ?")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(Color(.iakadirGreen))
                            .padding(.horizontal)
                        
                        // Action Cards Grid
                        VStack(spacing: 16) {
                            // Résumer un son
                            NavigationLink(destination: VoiceAssistantView()) {
                                ActionCardView(
                                    icon: "waveform",
                                    title: "Résumer\nun son",
                                    color: Color(.iakadirGreen),
                                    action: {}
                                )
                            }
                            
                            HStack(spacing: 16) {
                                // Parler à l'IA
                                NavigationLink( destination: ChatView(), label:{
                                    ActionCardView(
                                        icon: "message",
                                        title: "Parler à l'IA",
                                        color: Color(.iakadirPurple),
                                        action: {}
                                    )
                                }
                                                
                                )
                                // Générer une image
                                NavigationLink(destination: ImageGenerationView()){
                                    ActionCardView(
                                        icon: "photo",
                                        title: "Générer une image",
                                        color: Color(.iakadirPink),
                                        action: {}
                                    )
                                }
                                
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
                                HistoryItemView(
                                    icon: "waveform",
                                    text: "Swift est un langage de pogrammat...",
                                    color: Color(.iakadirGreen)
                                )
                                
                                HistoryItemView(
                                    icon: "message",
                                    text: "Dis-moi qui est Elvia Front, s'il te plaît...",
                                    color: Color(.iakadirPurple)
                                )
                                
                                HistoryItemView(
                                    icon: "photo",
                                    text: "Un sal sanglier qui danse avec son pè...",
                                    color: Color(.iakadirPink)
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
    
}

// Preview
#Preview {
    HomeView()
}
