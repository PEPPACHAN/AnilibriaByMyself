//
//  ContentView.swift
//  AnilibriaByMyself
//
//  Created by PEPPA CHAN on 03.07.2024.
//

import SwiftUI

struct ListOfTitles: View {
    
    let url: String = "https://api.anilibria.tv/v3"
    
    var body: some View {
        
        let str = getTitleUpdates()
        
        VStack{
            Text("\(str)")
        }
    }
}

extension ListOfTitles{
    func getTitleUpdates() -> TitleUpdate? {
        
        var jsonData: TitleUpdate?
        
        var request = URLRequest(url: URL(string: "https://api.anilibria.tv/v3/title/updates")!,timeoutInterval: Double.infinity)
        
        request.addValue("46.226.227.20", forHTTPHeaderField: "6ccc185483c5e56d35cd295a23724489f962b6c5")
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            
            do{
                let decoder = JSONDecoder()
                jsonData = try decoder.decode(TitleUpdate.self, from: data)
            }catch{
                jsonData = nil
            }
        }
        
        task.resume()
        
        return jsonData
    }
}

#Preview {
    ListOfTitles()
}
