import SwiftUI
import Combine

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var messageText = ""
    @State private var keyboardHeight: CGFloat = 0
    @State private var scrollToBottom = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button(action: {
                        // Handle back action
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text("Parler à l'IA")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        // Handle GPT-4 selection
                    }) {
                        Text("GPT-4")
                            .font(.subheadline)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color(UIColor(red: 0.80, green: 1.00, blue: 0.00, alpha: 1.00)))
                            .foregroundColor(.black)
                            .cornerRadius(16)
                    }
                }
                .padding()
                .background(Color.black)
                
                // Chat messages
                ScrollViewReader { scrollView in
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.messages) { message in
                                MessageBubble(message: message)
                                    .id(message.id)
                            }
                            Color.clear.frame(height: 1).id("bottomID")
                        }
                        .padding()
                    }
                    .background(Color(UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.00)))
                    .onChange(of: viewModel.messages) { _ in
                        scrollToBottom = true
                    }
                    .onChange(of: keyboardHeight) { _ in
                        scrollToBottom = true
                    }
                    .onChange(of: scrollToBottom) { _ in
                        if scrollToBottom {
                            withAnimation {
                                scrollView.scrollTo("bottomID", anchor: .bottom)
                            }
                            scrollToBottom = false
                        }
                    }
                    .onAppear {
                        scrollToBottom = true
                    }
                }
                
                // Input area
                VStack(spacing: 0) {
                    Divider()
                        .background(Color.gray.opacity(0.3))
                    HStack(alignment: .bottom) {
                        TextField("Écris une demande ici", text: $messageText)
                            .padding(12)
                            .background(colorScheme == .dark ? Color(UIColor(red: 0.17, green: 0.17, blue: 0.18, alpha: 1.00)) : Color(UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00)))
                            .cornerRadius(20)
                        
                        Button(action: sendMessage) {
                            Image(systemName: "paperplane.fill")
                                .foregroundColor(Color(UIColor(red: 0.80, green: 1.00, blue: 0.00, alpha: 1.00)))
                                .frame(width: 44, height: 44)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
                .background(Color(UIColor(red: 0.11, green: 0.11, blue: 0.12, alpha: 1.00)))
                .offset(y: -keyboardHeight)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .onAppear {
            setupKeyboardObservers()
        }
        .onDisappear {
            removeKeyboardObservers()
        }
    }
    
    private func sendMessage() {
        guard !messageText.isEmpty else { return }
        viewModel.sendMessage(messageText)
        messageText = ""
        scrollToBottom = true
    }
    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = keyboardFrame.cgRectValue
                keyboardHeight = keyboardRectangle.height
            }
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
            keyboardHeight = 0
        }
    }
    
    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

struct MessageBubble: View {
    let message: Message
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            if message.isFromUser {
                Spacer()
            }
            VStack(alignment: message.isFromUser ? .trailing : .leading, spacing: 4) {
                Text(message.content)
                    .padding(12)
                    .background(message.isFromUser ? Color(UIColor(red: 0.80, green: 1.00, blue: 0.00, alpha: 1.00)) : (colorScheme == .dark ? Color(UIColor(red: 0.17, green: 0.17, blue: 0.18, alpha: 1.00)) : Color(UIColor(red: 0.95, green: 0.95, blue: 0.97, alpha: 1.00))))
                    .foregroundColor(message.isFromUser ? .black : .primary)
                    .cornerRadius(16)
                
                if !message.isFromUser {
                    HStack(spacing: 16) {
                        Button(action: { /* Regenerate action */ }) {
                            Label("Regénérer", systemImage: "arrow.clockwise")
                        }
                        Button(action: { /* Copy action */ }) {
                            Label("Copier", systemImage: "doc.on.doc")
                        }
                        Button(action: { /* Share action */ }) {
                            Label("Partager", systemImage: "square.and.arrow.up")
                        }
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                }
            }
            if !message.isFromUser {
                Spacer()
            }
        }
    }
}

#Preview {
    ChatView()
}

