//
//  ContentView.swift
//  H4X0R News
//
//  Created by Yun Ni on 2024-05-23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationView{
            List(networkManager.post) { item in
                NavigationLink(destination: DetailView(url: item.url)) {
                    HStack {
                        Text(String(item.points))
                        Text(item.title)
                    }
                }
            }
            .navigationTitle("H4X0R NEWS")
        }
        //catch the obj
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

#Preview {
    ContentView()
}

//
//
//let post = [
//    Post(id: 1, title: "Hello"),
//    Post(id: 2, title: "Hi"),
//    Post(id: 3, title: "Hola"),
//    Post(id: 4, title: "Bonjour")
//]
