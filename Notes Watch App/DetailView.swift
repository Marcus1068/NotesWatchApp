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
                //.bold()
                .navigationTitle("Note \(index + 1)")
                .padding()
                .foregroundColor(.blue)
                .font(.title3)
            
            Text("Note \(index + 1)/\(count)")
                .padding()
                .font(.footnote)
            
            HStack(alignment: .lastTextBaseline){
                Text("created: ")
                    .font(.footnote)
                Text(dateToString(date: note.createDate))
                    .font(.footnote)
            }
        }
        //.ignoresSafeArea()
    }
}

func dateToString(date: Date) -> String{
    var str: String
    // Create Date Formatter
    let dateFormatter = DateFormatter()

    // Set Date Format
    dateFormatter.dateFormat = "dd/MM/YYYY hh:MM"

    // Convert Date to String
    str = dateFormatter.string(from: date)
    return str
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationStack{
            DetailView(index: 0, note: Note(id: UUID(), text: "Example", createDate: Date.now), count: 1)
        }
    }
}
