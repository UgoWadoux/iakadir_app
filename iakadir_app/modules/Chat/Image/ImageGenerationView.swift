//
//  ImageGenerationView.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 11/12/2024.
//

import SwiftUI

struct ImageGenerationView: View {
    @State private var prompt: String = "Des chèvres dans l'espace"
    @State private var selectedStyle = "Irréaliste"
    @State private var generatedImage: UIImage? = nil
    
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
                    
                    Text("Générer une image")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                    
                    Text("GPT-4")
                        .foregroundColor(.black)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color(.iakadirGreen))
                        .cornerRadius(20)
                }
                .padding()
                
                // Style Picker
                Menu {
                    Button("Réaliste") { selectedStyle = "Réaliste" }
                    Button("Irréaliste") { selectedStyle = "Irréaliste" }
                    Button("Artistique") { selectedStyle = "Artistique" }
                } label: {
                    HStack {
                        Text("Style de l'image générée")
                            .foregroundColor(.white)
                        Spacer()
                        Text(selectedStyle)
                            .foregroundColor(.iakadirGreen)
                        Image(systemName: "chevron.down")
                            .foregroundColor(.iakadirGreen)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                }
                .padding(.horizontal)
                
                // Prompt Input
                TextField("Des chèvres dans l'espace", text: $prompt)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                // Generated Image
                if let image = generatedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 400)
                        .cornerRadius(12)
                        .padding(.horizontal)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 400)
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .overlay(
                            VStack {
                                Image(systemName: "photo")
                                    .font(.system(size: 40))
                                    .foregroundColor(.gray)
                                Text("L'image apparaîtra ici")
                                    .foregroundColor(.gray)
                            }
                        )
                }
                
                // Action Buttons
                HStack(spacing: 20) {
                    Button(action: regenerateImage) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                            Text("Regénérer")
                        }
                        .foregroundColor(.iakadirGreen)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                    }
                    
                    Button(action: downloadImage) {
                        HStack {
                            Image(systemName: "arrow.down")
                            Text("Télécharger")
                        }
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.iakadirGreen))
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
//        .navigationBarHidden(true)
    }
    
    func regenerateImage() {
        // This would typically call an API to generate a new image
        // For this example, we'll just set a placeholder image
        generatedImage = UIImage(systemName: "photo")
    }
    
    func downloadImage() {
        // This would typically save the generated image to the device
        // For this example, we'll just print a message
        print("Image downloaded")
    }
}

    
#Preview {
    ImageGenerationView()
}
