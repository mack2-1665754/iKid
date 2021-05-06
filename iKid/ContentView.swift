//
//  ContentView.swift
//  iKid
//
//  Created by stlp on 5/5/21.
//

import SwiftUI
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

struct ContentView: View {
    @State private var orientation = UIDeviceOrientation.unknown

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
        }.onRotate { newOrientation in
            orientation = newOrientation
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(JokeItemStorage())
    }
}
