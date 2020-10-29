//
//  EventGroupFetcher.swift
//  ConnpassEventFetcher
//
//  Created by 横山尚久 on 2020/10/29.
//

import Foundation

class EventFethcer: ObservableObject {
    private let urlLink = "https://connpass.com/api/v1/event/?keyword=YUMEMI.swift"
    
    @Published var eventData: [Event] = []
    
    init() {
        fetchEventData()
    }
    
    func fetchEventData() {
        URLSession.shared.dataTask(with: URL(string: urlLink)!) { (data, response, error) in
            guard let data = data else { return }
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let searchResultData = try decoder.decode(StudyGroup.self, from: data)
                DispatchQueue.main.async {
                    self.eventData = searchResultData.events.reversed()
                }
            } catch {
                print("json convert failed in JSONDecoder. " + error.localizedDescription)
            }
        }.resume()
    }
}
