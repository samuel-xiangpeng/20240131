//
//  ContentView.swift
//  20240131
//
//  Created by 周祥鹏 on 2024/1/30.
//

import SwiftUI

struct ContentView: View {
    
    @State var animationShow: Bool = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: animationShow ? 20 : 0)
                .animation(.default, value: animationShow)
            
            BackCardView()
                .background(Color(animationShow ? "card3" : "card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: animationShow ? -400 : -40)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(animationShow ? 0 : 10))
                .rotation3DEffect(
                    .degrees(10),
                    axis: (x: 10.0, y: 10.0, z: 0.0)
                )
                .blendMode(.hardLight) // 混合模式
                .animation(.easeOut(duration: 0.5), value: animationShow)
            
            BackCardView()
                .background(Color(animationShow ? "card4" : "card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: animationShow ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(animationShow ? 0 : 5))
                .rotation3DEffect(
                    .degrees(5),
                    axis: (x: 10.0, y: 10.0, z: 0.0)
                )
                .blendMode(.hardLight) // 混合模式
                .animation(.easeOut(duration: 0.5), value: animationShow)
            
            CardView()
                .blendMode(.hardLight)
                .onTapGesture {
                    self.animationShow.toggle()
                }
            
            BottomPopupview()
                .blur(radius: animationShow ? 20 : 0)
                .animation(.default, value: animationShow)
        }
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Dedign")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    Text("Cetificate")
                        .foregroundStyle(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 100, alignment: .top)
        }
        .frame(width: 340, height: 220)
        .background(.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    
    var body: some View {
        VStack {}
            .frame(width: 340, height: 220)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Cetificate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            
            Spacer()
        }
    }
}

struct BottomPopupview: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 100, height: 10)
                .opacity(0.1)
                .cornerRadius(30)
            Text("This certificate is proof that Meng To has achieved the Ul Design course with approval from a Design +Code instructor.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: 500)
    }
}
