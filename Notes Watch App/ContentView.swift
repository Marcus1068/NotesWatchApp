//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Marcus Deuß on 18.10.22.
//

import SwiftUI

struct ContentView: View {
    @State private var notes = [Note]()
    @State private var text = ""
    
    var body: some View {
    
        NavigationStack {
            NavigationLink(destination: AboutView(name: "Marcus")){
                Text("About Notes App...")
                    .fixedSize()
                    .foregroundColor(.green)
            }
            .fixedSize()
            
            HStack {
                TextField("Add note", text: $text)
                
                Button {
                    guard text.isEmpty == false else { return }
                    
                    let note = Note(id: UUID(), text: text)
                    notes.append(note)
                    text = ""
                } label: {
                    Image(systemName: "plus")
                        .padding()
                }
                .fixedSize()
                .tint(.blue)
            }
            
            List {
                ForEach(0..<notes.count, id: \.self) { i in
                    NavigationLink {
                        DetailView(index: i, note: notes[i], count: notes.count)
                    } label: {
                        Text(notes[i].text)
                            .lineLimit(3)
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Notes App")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
