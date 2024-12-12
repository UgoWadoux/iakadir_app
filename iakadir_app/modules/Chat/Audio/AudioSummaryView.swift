//
//  AudioSummaryView.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 11/12/2024.
//

import SwiftUI

struct AudioSummaryView: View {
    @State private var audioFile: String = "recorded_vocal.mp3"
    @State private var summary: String = "Swift est un langage de programmation puissant et intuitif développé par Apple pour les applications iOS, macOS, watchOS et tvOS. Il a été conçu pour offrir aux développeurs une expérience de programmation moderne et efficace, favorisant la création rapide d'applications performantes et sécurisées.\nCaractéristiques principales :\n• Simplicité et lisibilité : Swift utilise une syntaxe claire, rendant le code plus facile à écrire, lire et maintenir.\n• Performance : Grâce à son moteur optimisé, Swift offre des performances comparables à celles de langages comme C++."
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Custom Navigation Bar
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                    }
                    
                    Spacer()
                    
                    Text("Résumer un son")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                    
                    Text("GPT-4")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color(.iakadirGreen))
                        .cornerRadius(20)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Résume-moi ce son :")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        Image(systemName: "paperclip")
                            .foregroundColor(.iakadirGreen)
                        Text(audioFile)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                ScrollView {
                    Text(summary)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                HStack(spacing: 15) {
                    ActionButton(title: "Regénérer", icon: "arrow.clockwise")
                    ActionButton(title: "Copier", icon: "doc.on.doc")
                    ActionButton(title: "Partager", icon: "square.and.arrow.up")
                }
                .padding()
                
                Spacer()
                
                HStack {
                    TextField("Envie de changer le texte ?", text: .constant(""))
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(25)
                        .foregroundColor(.white)
                    
                    Button(action: {}) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color(.iakadirGreen))
                            .clipShape(Circle())
                    }
                }
                .padding()
            }
        }
//        .navigationBarHidden(true)
    }
}

struct ActionButton: View {
    let title: String
    let icon: String
    
    var body: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
            .foregroundColor(.iakadirGreen)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
        }
    }
}

#Preview {
    AudioSummaryView()
}
