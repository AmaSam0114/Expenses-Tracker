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
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $seletedtab){
                HomeView()
                    .ignoresSafeArea(.all,edges: .all)
                    .tag("home")
                AddExpenseView()
                    .ignoresSafeArea(.all,edges: .all)
                    .tag("add")
                Color.purple
                    .ignoresSafeArea(.all,edges: .all)
                    .tag("expen")
                ReportView()
                    .ignoresSafeArea(.all,edges: .all)
                    .tag("chart")
            }
            //custom TabBar
            HStack{
                ForEach(tabs,id: \.self){ image in
                    Button(action: {
                        
                        withAnimation(.spring()){
                            seletedtab = image
                        }
                        
                    }, label: {
                        Image(image)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25,height: 25)
                            .foregroundColor(seletedtab == image ? getColor(image: image): Color.gray)
                    })
                    if image != tabs.last{Spacer(minLength: 0)}
                    
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
            //Bottom Edge
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.white)
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
