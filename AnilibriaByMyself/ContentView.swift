//
//  ContentView.swift
//  AnilibriaByMyself
//
//  Created by PEPPA CHAN on 03.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var title = GetTitle()
    
    private let date = Calendar.current.component(.weekday, from: Date()) - 2
    private let weekDays = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"] //String(weekDays[date>=0 ? date: 6])
    private let screen = UIScreen.main.bounds
    var limit = 20
    
    var body: some View {
        if title.returnData?.list?.count != 0{
            NavigationView{
                VStack(alignment: .leading) {
                    Text("Обновления")
                        .bold()
                    ScrollView{
                        ForEach(0..<limit){ index in
                            if let item = title.returnData?.list![index]{
                                HStack{
                                    AsyncImage(url: URL(string: String(describing: "https://a.anilibria.sbs" + (item.posters?.small?.url ?? "")))){ phase in
                                        switch phase {
                                        case .empty:
                                            Rectangle()
                                                .foregroundColor(.secondary)
                                                .frame(width: screen.width/3.5, height: screen.height/5)
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: screen.width/3.5, height: screen.height/5)
                                        case .failure(_):
                                            Rectangle()
                                                .foregroundColor(.secondary)
                                                .frame(width: screen.width/3.5, height: screen.height/5)
                                        @unknown default:
                                            Rectangle()
                                                .foregroundColor(.secondary)
                                                .frame(width: screen.width/3.5, height: screen.height/5)
                                        }
                                    }
                                    if let episodes = item.player?.episodes{
                                        Text((item.names?.ru ?? "Unknown") + (episodes.first != episodes.last ? " (\(episodes.first ?? 0) - \(episodes.last ?? 0))": " (\(episodes.first ?? 0))"))
                                            .bold()
                                    }
                                }
                            }
                            Spacer()
                            
                        }
                    }
//                    NavigationLink(destination: Text("Destination")) { /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/ }
                }
                .onAppear{
                    title.fetchTitlesChanges(limit: limit)
                }
                .padding()
            }
        }else{
            Image(systemName: "plane")
        }
    }
}
        #Preview {
            ContentView()
        }
