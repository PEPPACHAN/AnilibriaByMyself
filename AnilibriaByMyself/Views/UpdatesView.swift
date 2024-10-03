//
//  UpdatesView.swift
//  AnilibriaByMyself
//
//  Created by PEPPA CHAN on 02.10.2024.
//

import SwiftUI

struct UpdatesView: View {
    private let screen = UIScreen.main.bounds
    var limit = 20
    
    @StateObject private var title = GetTitle()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                ScrollView{
                    ForEach(0..<limit){ index in
                        if let item = title.returnData?.list![index]{
                            HStack(alignment: .top){
                                AsyncImage(url: URL(string: String(describing: "https://a.anilibria.sbs" + (item.posters?.small?.url ?? "")))){ phase in
                                    switch phase {
                                    case .empty:
                                        Rectangle()
                                            .foregroundStyle(.secondary)
                                            .frame(width: screen.width/3.5, height: screen.height/5)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: screen.width/3.5, height: screen.height/5)
                                    case .failure(_):
                                        Rectangle()
                                            .foregroundStyle(.secondary)
                                            .frame(width: screen.width/3.5, height: screen.height/5)
                                    @unknown default:
                                        Rectangle()
                                            .foregroundStyle(.secondary)
                                            .frame(width: screen.width/3.5, height: screen.height/5)
                                    }
                                }
                                if let episodes = item.player?.episodes{
                                    VStack{
                                        Text((item.names?.ru ?? "Unknown") + (episodes.first != episodes.last ? " (\(episodes.first ?? 0) - \(episodes.last ?? 0))": " (\(episodes.first ?? 0))"))
                                            .frame(width: screen.width/1.5, alignment: .leading)
                                            .aspectRatio(contentMode: .fill)
                                            .bold()
                                        Text(item.description ?? "Unknown")
                                            .foregroundStyle(.secondary)
                                    }
                                    .frame(maxHeight: screen.height/5)
                                }
                                Spacer()
                            }
                            .frame(width: screen.width-20, height: screen.height/5)
                            .background(Color.white)
                            .cornerRadius(5)
                            .shadow(radius: 7, x: 5, y: 5)
                            .padding(7)
                        }
                    }
                }
                //                    NavigationLink(destination: Text("Destination")) { /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/ }
            }
            .onAppear{
                title.fetchTitlesChanges(limit: limit)
            }
        }
    }
}

#Preview {
    UpdatesView()
}
