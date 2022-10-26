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
    
    
    @AppStorage("lineCount") var lineCount = 1
    
    var body: some View {
    
        NavigationStack {
            NavigationLink(destination: AboutView(name: "Marcus")){
                Text("About Notes App...")
                    .fixedSize()
                    .foregroundColor(.green)
            }
            .fixedSize()
            
            Divider()
                .padding(2)
            
            HStack {
                TextField("Add note", text: $text)
                
                Button {
                    guard text.isEmpty == false else { return }
                    
                    let note = Note(id: UUID(), text: text, createDate: Date.now)
                    notes.append(note)
                    save()
                    text = ""
                } label: {
                    Image(systemName: "plus")
                        .padding()
                }
                .fixedSize()
                .tint(.blue)
                .buttonBorderShape(.roundedRectangle)
            }
            
            List {
                ForEach(0..<notes.count, id: \.self) { i in
                    NavigationLink {
                        DetailView(index: i, note: notes[i], count: notes.count)
                    } label: {
                        Text(notes[i].text)
                            .lineLimit(lineCount)
                    }
                }
                .onDelete(perform: delete)
                
                Button("Lines: \(lineCount)") {
                    lineCount += 1

                    if lineCount == 4 {
                        lineCount = 1
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                //.fixedSize()
                
                
                

            }
            .navigationTitle("Notes App")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: load)
        }
    }
    
    // delete row from list
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    // load from JSON file
    func load() {
        do {
            let url = URL.documentsDirectory.appending(path: "notes")
            let data = try Data(contentsOf: url)
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            // do nothing
        }
    }
    
    // save to JSON file in document dir
    func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            let url = URL.documentsDirectory.appending(path: "notes")
            try data.write(to: url, options: [.atomic, .completeFileProtection])
        } catch {
            print("Save failed")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
