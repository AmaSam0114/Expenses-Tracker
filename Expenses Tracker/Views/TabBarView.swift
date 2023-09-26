//
//  TabBarView.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-20.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabHome()
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

struct TabHome: View {
    @State var seletedtab = "home"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    //Location for each Curve
    @State var xAxis: CGFloat = 0
    
    @Namespace var animation
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $seletedtab){
                HomeView()
                    .ignoresSafeArea(.all,edges: .all)
                    .tag("home")
                AddExpenseView()
                    .ignoresSafeArea(.all,edges: .all)
                    .tag("add")
                ExpenseTrackView()
                    .ignoresSafeArea(.all,edges: .all)
                    .tag("expen")
                ReportView()
                    .ignoresSafeArea(.all,edges: .all)
                    .tag("chart")
            }
            //custom TabBar
            HStack{
                ForEach(tabs,id: \.self){ image in
                 
                    GeometryReader {reader in
                        Button(action: {
                            
                            withAnimation(.spring()){
                                seletedtab = image
                                xAxis = reader.frame(in: .global).minX
                            }
                            
                        }, label: {
                            Image(image)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25,height: 25)
                                .foregroundColor(seletedtab == image ? getColor(image: image): Color.gray)
                                .padding(seletedtab == image ? 15:0)
                                .background(Color("Lblue").opacity(seletedtab == image ? 1:0).clipShape(Circle()))
                                .matchedGeometryEffect(id: image , in: animation)
                                .offset(x:seletedtab == image ? (reader.frame(in: .global).minX - reader.frame(in: .global).midX): 0,y: seletedtab == image ? -45:0)
                        })
                        .onAppear(perform: {
                            if image == tabs.first{
                                xAxis = reader.frame(in: .global).minX
                            }
                        })
                    }
                    .frame(width: 25,height: 25)
                    if image != tabs.last{Spacer(minLength: 0)}
                    
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
            .background(Color("Lblue").clipShape(CustomShape(xAxis: xAxis)).cornerRadius(12))
            
            .padding(.horizontal)
            //Bottom Edge
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
        }
        .ignoresSafeArea(.all,edges: .bottom)
        
    }
    //getting image color
    func getColor(image: String)->Color{
        switch image{
        case "home":
            return Color("Color")
        case "add":
            return Color("Color")
        case "expen":
            return Color("Color")
        case "chart" :
            return Color("Color")
        default:
            return Color.blue
        }
    }
}
var tabs = ["home","add","expen","chart"]

//curve
struct CustomShape: Shape {
    
    var xAxis: CGFloat
    
    //Animatig Path....
    var animatableData: CGFloat{
        get{return xAxis}
        set{xAxis = newValue}
    }
    
    
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = xAxis
            path.move(to: CGPoint(x: center - 50, y: 0))
            
            let to1 = CGPoint(x: center, y: 35)
            let conrol1 = CGPoint(x: center - 25, y: 0)
            let conrol2 = CGPoint(x: center - 25, y: 35)
            
            let to2 = CGPoint(x: center + 50, y: 0)
            let conrol3 = CGPoint(x: center + 25, y: 35)
            let conrol4 = CGPoint(x: center + 25, y: 0)
            
            path.addCurve(to: to1, control1: conrol1, control2: conrol2)
            path.addCurve(to: to2, control1: conrol3, control2: conrol4)
            
            
            
        }
    }
}
