//
//  Note.swift
//  Notes Watch App
//
//  Created by Marcus Deuß on 18.10.22.
//

import Foundation


struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
    let createDate: Date
}
