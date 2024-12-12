//
//  ActionCardView.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 29/11/2024.
//

import SwiftUI

struct ActionCardView: View {
    let icon: String
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
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


//#Preview {
//    ActionCardView()
//}
