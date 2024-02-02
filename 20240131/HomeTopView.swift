//
//  HomeTopView.swift
//  20240131
//
//  Created by 周祥鹏 on 2024/2/2.
//

import SwiftUI

struct HomeTopView: View {
    
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                AvatorView(showProfile: $showProfile)
                
            }
            .padding(.horizontal, 20)
            
            //轮播 showsIndicators: 显示指标
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(sectionData) { section in
                    
                        GeometryReader { geometry in
                            
                            let geometryObj = geometry.frame(in: .global)
                            
                            VStack {
                                SectionCardView(section: section)
                                    .rotation3DEffect(
                                        .degrees((Double(geometryObj.minX - 30) / -20)),
                                        axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                            }
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .onHover(perform: { hovering in
                    print(hovering.description)
                })
                .padding()
                .padding(.bottom, 30 )
            }
            
            
            
            Spacer()
            
        }
    }
}

#Preview {
    HomeTopView(showProfile: .constant(false))
}


struct Section: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
    var caption: String
    var image: String
    var bgColor: Color
}

var sectionData: [Section] = [
    Section(title: "Prototype design in swift ui", icon: "Logo1", caption: "18 Section", image: "Card1", bgColor: Color("card1")),
    Section(title: "Prototype design in swift ui", icon: "Logo2", caption: "12 Section", image: "Card2", bgColor: Color("card2")),
    Section(title: "Prototype design in swift ui", icon: "Logo3", caption: "11 Section", image: "Card3", bgColor: Color("card3")),
    Section(title: "Prototype design in swift ui", icon: "Logo2", caption: "9 Section", image: "Card4", bgColor: Color("card4"))
]

struct SectionCardView: View {
    
    var section: Section
    
    var body: some View {
        VStack {
            HStack {
                Text(section.title)
                    .bold()
                    .foregroundStyle(.white)
                    .font(.system(size: 24))
                    .lineLimit(3)
                    .frame(width: 160, alignment: .leading)
                Spacer()
                Image(section.icon)
            }
            Text(section.caption)
                .textCase(.uppercase)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
            Image(section.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        .frame(width: 275, height: 275)
        .background(section.bgColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.2), radius: 20, x: 5, y: 10)
    }
}
