//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Marcus Deuß on 18.10.22.
//

import SwiftUI

struct DetailView: View {
    let index: Int
    let note: Note
    let count: Int
    
    var body: some View {
        VStack(alignment: .leading){
            Text(note.text)
                .bold()
                .navigationTitle("Note \(index + 1)")
                .padding()
                .foregroundColor(.blue)
            Text("Note \(index + 1)/\(count)")
                .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationStack{
            DetailView(index: 0, note: Note(id: UUID(), text: "Example"), count: 1)
        }
    }
}
