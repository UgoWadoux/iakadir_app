//
//  RegisterView.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 11/12/2024.
//

import SwiftUI
import Foundation



struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()
    
    var body: some View {
        if viewModel.isSuccess {
            LoginView()
        }else{
            
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Image("iakadir_mascotte") // Assurez-vous d'avoir cette image dans vos assets
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("Inscris-toi")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    VStack(spacing: 1) {
                        HStack
                        {
                            Image(systemName: "envelope")
                                .foregroundColor(.iakadirIcone)
                            TextField("Email", text: $viewModel.email,
                                      prompt: Text("Email")
                                .foregroundColor(.iakadirBlack)
                            )
                        }
                        .foregroundColor(.iakadirBlack)
                        .padding()
                        .background(
                            .white,
                            in: UnevenRoundedRectangle (
                                cornerRadii: .init(
                                    topLeading: 10,
                                    bottomLeading: 0,
                                    bottomTrailing: 0,
                                    topTrailing: 10
                                )
                            )
                        )
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.iakadirIcone)
                            SecureField("Mot de passe", text: $viewModel.password, prompt: Text("Mot de passe").foregroundColor(.iakadirBlack))
                        }
                        .foregroundColor(.iakadirBlack)
                        .padding()
                        .background(
                            .white,
                            in: UnevenRoundedRectangle (
                                cornerRadii: .init(
                                    topLeading: 0,
                                    bottomLeading: 0,
                                    bottomTrailing: 0,
                                    topTrailing: 0
                                )
                            )
                        )
                        
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.iakadirIcone)
                            SecureField("Confirmer le mot de passe", text: $viewModel.confirmPassword, prompt: Text("Confirmer le mot de passe")
                                .foregroundColor(.iakadirBlack)
                            )
                        }
                        .foregroundColor(.iakadirBlack)
                        .padding()
                        .background(
                            .white,
                            in: UnevenRoundedRectangle (
                                cornerRadii: .init(
                                    topLeading: 0,
                                    bottomLeading: 10,
                                    bottomTrailing: 10,
                                    topTrailing: 0
                                )
                            )
                        )
                    }
                    .padding(.horizontal)
                    
                    Button(action:  {
                        Task{
                            await viewModel.register()
                        }
                    }) {
                        Text("S'inscrire")
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.iakadirGreen))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    
                    //Handle error message
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .padding(.top, 8)
                    }
                    
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Déjà un compte ? Connecte-toi")
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
        }
    }
}


#Preview {
    RegisterView()
}
