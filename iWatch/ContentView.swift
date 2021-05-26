//
//  ContentView.swift
//  iWatch
//
//  Created by codestorm on 2021/5/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    @State var index = "ALL"
    @State var tab = 0
    @Binding var detailData : Watch
    @Binding var detail : Bool
    var bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.05).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                HStack {
                    Button(action: {
                        
                    }){
                        Image(systemName: "line.horizontal.3.decrease.circle")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Welcome!")
                        
                        Text("Discovery")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 25){
                        ForEach(menu, id: .self){i in
                            Button(action: {
                                self.index = i
                            }) {
                                Text(i)
                                    .foregroundColor(self.index == i ? Color("Color1") : Color.black.opacity(0.6))
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 25) {
                        ForEach(data, id: .self){i in
                            ZStack(alignment: .bottom) {
                                Color("Color")
                                    .frame(height: UIScreen.main.bounds.height / 3)
                                    .cornerRadius(20)
                                VStack(spacing: 20){
                                    Image(i.image)
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width / 1.7)
                                        .onTapGesture {
                                            self.detailData
                                            self.detail.toggle()
                                        }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


struct CShape : Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 45, height: 45))
        
        return Path(path.cgPath)
    }
}










var menu = ["ALL", "CLASSIC", "GRAND", "FOFRMAL", "ORIGINAL", "TREND"]

struct Watch : Identifiable,Hashable {
    var id : Int
    var color : String
    var price : String
    var image : String
    var title : String
}

var data = [
    Watch(id: 0, color: "Dark Black", price: "$500", image: "black", title: "Classic Black"),
    Watch(id: 1, color: "Light Yellow", price: "$450", image: "yellow", title: "Classic Yellow"),
    Watch(id: 2, color: "Rose Gold", price: "$510", image: "gold", title: "Classic Gold"),
    Watch(id: 3, color: "Red", price: "$500", image: "red", title: "Classic Red"),
    Watch(id: 4, color: "White", price: "$400", image: "white", title: "Classic White")
]
