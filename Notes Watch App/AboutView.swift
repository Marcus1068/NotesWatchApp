//
//  AboutView.swift
//  Notes Watch App
//
//  Created by Marcus Deuß on 18.10.22.
//

import SwiftUI

struct AboutView: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Author:")
                    .foregroundColor(.green)
                    .padding(10)
                Text(name)
                    .navigationTitle("About")
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(name: "Marcus")
    }
}
