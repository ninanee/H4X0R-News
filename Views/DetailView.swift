//
//  DetailView.swift
//  H4X0R News
//
//  Created by Yun Ni on 2024-05-23.
//

import SwiftUI


struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}

