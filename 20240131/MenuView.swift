//
//  MenuView.swift
//  20240131
//
//  Created by 周祥鹏 on 2024/2/2.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        
        VStack {
            Spacer()
            VStack {
                Text("Have a Good Time")
                    .font(.caption)
                    .fontWeight(.light)
                
                Color.white
                    .frame(width: 30, height: 6)
                    .cornerRadius(3.0)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color(red: 0, green: 0, blue: 0, opacity: 0.3))
                    .cornerRadius(3.0)
                    .frame(width: 150, height: 24)
                    .cornerRadius(3.0)
                    .background(Color(red: 0.7, green: 0.87, blue: 0.86, opacity: 0.2))
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
                    .padding(.vertical, 10)
                
                
                MenuRow(icon: "gear", title: "Account")
                MenuRow(icon: "creditcard", title: "Billing")
                MenuRow(icon: "person.circle", title: "Sign out")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color("a18cd1").opacity(0.1), Color("fbc2eb").opacity(0.3)]), startPoint: .bottom, endPoint: .trailing))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(radius: 5, x: 2.0)
            .padding(.horizontal, 30)
            .overlay {
                Image("Avatar")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                    .offset(y: -140)
            }
        }
    }
}

#Preview {
    MenuView()
}

struct MenuRow: View {
    
    let icon: String
    let title: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
                .frame(width: 16, height: 16)
                .foregroundStyle(.black.opacity(0.6))
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .frame(width: 120, alignment: .leading)
                .foregroundStyle(.black.opacity(0.7))
        }
    }
}
