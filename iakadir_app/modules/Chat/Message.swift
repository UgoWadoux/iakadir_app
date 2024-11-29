import Foundation

struct Message: Identifiable, Equatable {
    let id: UUID
    let content: String
    let isFromUser: Bool
    
    static func == (lhs: Message, rhs: Message) -> Bool {
        lhs.id == rhs.id && lhs.content == rhs.content && lhs.isFromUser == rhs.isFromUser
    }
}

