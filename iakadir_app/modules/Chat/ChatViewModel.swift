//
//  ChatViewModel.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 29/11/2024.
//


import Foundation
import Combine

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Add initial AI message
        messages.append(Message(id: UUID(), content: "Hello, moi c'est Ugo sans H.\nQuelle est ta question ?", isFromUser: false))
    }
    
    func sendMessage(_ content: String) {
        let userMessage = Message(id: UUID(), content: content, isFromUser: true)
        messages.append(userMessage)
        
        // Simulate AI response
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let aiResponse = self.generateAIResponse(to: content)
            let aiMessage = Message(id: UUID(), content: aiResponse, isFromUser: false)
            self.messages.append(aiMessage)
        }
    }
    
    private func generateAIResponse(to message: String) -> String {
        // This is a placeholder. In a real app, you'd call your AI service here.
        return "Voici une réponse simulée à votre message : \"\(message)\". Dans une vraie application, cette réponse serait générée par un modèle d'IA."
    }
}