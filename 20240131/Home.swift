//
//  Home.swift
//  20240131
//
//  Created by 周祥鹏 on 2024/2/2.
//

import SwiftUI

struct Home: View {
    
    @State var showProfile: Bool = false
    
    @State var profilePosition: CGSize = CGSize.zero
    
    init() {
        print(CGFloat(screen!.height))
    }
    
    var body: some View {
        
        ZStack {
            
            Color(red: 0.8549, green: 0.8745, blue: 0.9176, opacity: 1)
                .ignoresSafeArea(edges: .all)
            
            HomeTopView(showProfile: $showProfile)
                .padding(.top, 40)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .rotation3DEffect(
                    Angle(degrees: showProfile ? (Double(profilePosition.height / -10) - 10) : 0),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
                .offset(y: showProfile ? -400 : 0)
                .scaleEffect(showProfile ? 0.9 : 1.0)
                .ignoresSafeArea(.all)
            
            ZStack {
                Color.white
                    .ignoresSafeArea()
                    .opacity(0.0001)
                    .offset(CGSize(width: 0, height: showProfile ? profilePosition.height : 1000))
                    .onTapGesture {
                        showProfile.toggle()
                    }
                
                MenuView()
                    .offset(CGSize(width: 0, height: showProfile ? profilePosition.height : CGFloat(screen?.height ?? 1000)))
                    .animation(.spring(response: 0.5, dampingFraction: 0.6), value: showProfile)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                profilePosition = value.translation
                                if profilePosition.height < -400 {
                                    profilePosition = CGSize.zero
                                }
                            })
                            .onEnded({ value in
                                if profilePosition.height > 20 {
                                    showProfile.toggle()
                                }
                                profilePosition = .zero
                            }))
            }
            
        }
    }
}

#Preview {
    Home()
}

struct AvatorView: View {
    
    @Binding var showProfile: Bool
    
    var body: some View {
        Button(action: {
            showProfile.toggle()
        }, label: {
            Image("Avatar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 80)
                .clipShape(Circle())
        })
        .buttonStyle(.borderless)
    }
}
