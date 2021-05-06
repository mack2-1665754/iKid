//
//  ContentView.swift
//  iKid
//
//  Created by stlp on 5/5/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var jokeItemStorage: JokeItemStorage
    var body: some View {
        NavigationView {
            Text("Choose a Joke Category Below")
            .toolbar {
                ToolbarItemGroup(placement: ToolbarItemPlacement.bottomBar) {
                        HStack {
                            NavigationLink(destination: DadJokes(jokeItemStorage.goodJokes)) {
                            Text("Good")}
                            NavigationLink(destination: DadJokes(jokeItemStorage.punJokes)) {
                            Text("Pun")}
                            NavigationLink(destination: DadJokes(jokeItemStorage.dadJokes)) {
                            Text("Dad")}
                        }
                    
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(JokeItemStorage())
    }
}
