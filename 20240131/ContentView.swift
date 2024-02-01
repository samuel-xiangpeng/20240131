//
//  ContentView.swift
//  20240131
//
//  Created by 周祥鹏 on 2024/1/30.
//

import SwiftUI

struct ContentView: View {
    
    @State var animationShow: Bool = false
    
    @State var currentCardPosition = CGSize.zero
    
    @State var bottomCardShow: Bool = false
    
    var body: some View {
        ZStack {
            TitleView()
                .offset(CGSize(width: 0, height: bottomCardShow ? -150 : 0))
                .blur(radius: animationShow ? 20 : 0)
                .animation(Animation.default.delay(0.3), value: animationShow || bottomCardShow)
            
            BackCardView()
                .background(Color(animationShow ? "card3" : "card4"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: animationShow ? -400 : -40)
                .offset(CGSize(width: currentCardPosition.width, height: currentCardPosition.height))
                .offset(y: bottomCardShow ? -180 : 0)
                .scaleEffect(bottomCardShow ? 1.02 : 0.9)
                .rotationEffect(.degrees(animationShow ? 0 : 10))
                .rotationEffect(.degrees(bottomCardShow ? -10 : 0))
                .rotation3DEffect(
                    .degrees(bottomCardShow ? 0 : 10),
                    axis: (x: 10.0, y: 10.0, z: 0.0)
                )
                .blendMode(.hardLight) // 混合模式
                .animation(.easeOut(duration: 0.5), value: animationShow)
            
            BackCardView()
                .background(Color(animationShow ? "card4" : "card3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: animationShow ? -200 : -20)
                .offset(CGSize(width: currentCardPosition.width, height: currentCardPosition.height))
                .offset(y: bottomCardShow ? -100 : 0)
                .scaleEffect(bottomCardShow ? 1.02 : 0.9)
                .rotationEffect(.degrees(animationShow ? 0 : 5))
                .rotationEffect(.degrees(bottomCardShow ? -5 : 0))
                .rotation3DEffect(
                    .degrees(bottomCardShow ? 0 : 5),
                    axis: (x: 10.0, y: 10.0, z: 0.0)
                )
                .blendMode(.hardLight) // 混合模式
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: animationShow)
            
            CardView()
                .scaleEffect(bottomCardShow ? 1.05 : 1)
                .animation(.easeIn, value: bottomCardShow)
                .offset(CGSize(width: currentCardPosition.width, height: currentCardPosition.height))
                .blendMode(.hardLight)
                .onTapGesture {
                    self.bottomCardShow.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            currentCardPosition = value.translation
                            animationShow = true
                        })
                        .onEnded({ value in
                            currentCardPosition = CGSize.zero
                            animationShow = false
                        })
                )
            
            BottomPopupview()
                .blur(radius: animationShow ? 20 : 0)
                .offset(CGSize(width: 0, height: bottomCardShow ? -80 : 1000))
                .zIndex(currentCardPosition != CGSize.zero ? -10 : 1.0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: (animationShow || bottomCardShow))
            
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
