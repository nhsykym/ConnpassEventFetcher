//
//  TopListView.swift
//  ConnpassEventFetcher
//
//  Created by 横山尚久 on 2020/10/29.
//

import SwiftUI

struct TopListView: View {
    
//    let eventsData: [Event] = mockEventsData
    
    @ObservedObject var fetcher = EventFethcer()
    
    var body: some View {
        NavigationView {
            List(fetcher.eventData) { event in
                Text(event.title)
            }
            .navigationBarTitle(Text("YUMEMI.swift一覧"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TopListView()
    }
}
