//
// ---------------------------- //
// Original Project: PredictiveCodeCompletion
// Created on 2024-10-09 by Tim Mitra
// Mastodon: @timmitra@mastodon.social
// Twitter/X: timmitra@twitter.com
// Web site: https://www.it-guy.com
// ---------------------------- //
// Copyright © 2024 iT Guy Technologies. All rights reserved.


import SwiftUI

struct ContentView: View {
    
    @State var profiles: [Profile] = [
        .init(name: "Tim Mitra"),
        .init(name:"John Doe"),
        .init(name:"Jane Smith"),
        .init(name: "Jane Doe")
    ]
    
    var body: some View {
        List {
            ForEach(profiles) { profile in
                Text(profile.name)
                    .font(.headline)
            }
        }
    }
}

#Preview {
    ContentView()
}

// a profile struct that is Codable and Identifiable and has a name variable property
struct Profile: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    init(name: String) {
        self.name = name
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
