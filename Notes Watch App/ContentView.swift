//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Marcus Deuß on 18.10.22.
//

import SwiftUI

struct ContentView: View {
    @State private var notes = [Note]()
    
    var body: some View {
        VStack {
            Text("Notes: \(notes.count)")
            
            Button("Add Note"){
                let note = Note(id: UUID(), text: "Example")
                notes.append(note)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
