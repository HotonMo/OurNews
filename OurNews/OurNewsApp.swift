//
//  OurNewsApp.swift
//  OurNews
//
//  Created by hoton on 08/04/1444 AH.
//

import SwiftUI

@main
struct OurNewsApp: App {
    var body: some Scene {
        WindowGroup {
            OurNewsPage(AddedMessage: Binding<String>.constant("excavtion on the main street"),
                        AddedName: Binding<String>.constant("Rakan"),AddedGender: Binding<String>.constant("MaleProfile"))
        }
    }
}
