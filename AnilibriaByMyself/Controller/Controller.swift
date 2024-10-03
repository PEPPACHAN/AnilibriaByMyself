//
//  Controller.swift
//  AnilibriaByMyself
//
//  Created by PEPPA CHAN on 10.09.2024.
//

import Foundation

final class GetTitle: ObservableObject {
    
    @Published var returnData: ResponseData?
    let titleUpdateUrl = "https://api.anilibria.tv/v3/title/updates?limit="
    let titleChangesUrl = "https://api.anilibria.tv/v3/title/changes?limit="
    let titleScheduleUrl = "https://api.anilibria.tv/v3/title/schedule"
    
    func fetchTitlesUpdate(limit: Int){
        
        let urlRequest = URLRequest(url: URL(string: titleUpdateUrl + String(limit))!)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            guard let response = response as? HTTPURLResponse else {return}
            print(response.statusCode, response.url!)
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let data = data else {
                print("no data")
                return
            }
            self.decodeData(data: data)
        }
        task.resume()
    }
    
    func fetchTitlesChanges(limit: Int){
            
            let urlRequest = URLRequest(url: URL(string: titleChangesUrl + String(limit))!)
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                
                guard let response = response as? HTTPURLResponse else {return}
                print(response.statusCode, response.url!)
                if let error = error{
                    print(error.localizedDescription)
                    return
                }
                guard let data = data else {
                    print("no data")
                    return
                }
                self.decodeData(data: data)
            }
            task.resume()
        }
        
    func fetchTitlesSchedule(){
                
                let urlRequest = URLRequest(url: URL(string: titleScheduleUrl)!)
                let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                    
                    guard let response = response as? HTTPURLResponse else {return}
                    print(response.statusCode, response.url!)
                    if let error = error{
                        print(error.localizedDescription)
                        return
                    }
                    guard let data = data else {
                        print("no data")
                        return
                    }
                    self.decodeData(data: data)
                }
                task.resume()
            }
            
    private func decodeData(data: Data){
        DispatchQueue.main.async {
            do {
                self.returnData = try JSONDecoder().decode(ResponseData.self, from: data)
            }
            catch let decodingError as DecodingError {
                switch decodingError {
                case .typeMismatch(let type, let context):
                    print(type, context.debugDescription)
                case .valueNotFound(_, _):
                    print("value")
                case .keyNotFound(_, _):
                    print("key")
                case .dataCorrupted(_):
                    print("data")
                @unknown default:
                    print("unknown")
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
}
