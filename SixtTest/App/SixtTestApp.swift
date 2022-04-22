//
//  SixtTestApp.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 17.04.2022.
//

import SwiftUI
import SixtTestCore

/*
    Comment:
        - I decided to realize clear project, without external dependencies from another packages.
        - For displaying images I used default `AsyncImage`, without caching. I have thought about adding Kingfisher to project for support image caching (it`s really simple and easy to update, if needed), but I didn't and stay on the clear project concept.
 
        - I use MVVM-C architecture pattern for project and simple version of StateMachine for ViewModel. By using SwiftUI, the implementation is different from UIKit projects. Coordinator in SwiftUI projects - it`s 2 files: object and view.
        - Realize onNavigation event to hide NivigationLink and dependencies between Views: ViewModel and Views doesn't know about each other.
 */

@main
struct SixtTestApp: App {
    
    let appCoordinatingService: AppCoordinating = AppCoordinatingService()

    var body: some Scene {
        WindowGroup {
            TabBarCoordinatorView(object: TabBarCoordinatorObject(appCoordinating: appCoordinatingService))
                .background(Color.background)
        }
    }
}
