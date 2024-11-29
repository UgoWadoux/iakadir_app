//
//  HistoryItemView.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 29/11/2024.
//

import SwiftUI

struct HistoryItemView: View {
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
//
//#Preview {
//    HistoryItemView()
//}
