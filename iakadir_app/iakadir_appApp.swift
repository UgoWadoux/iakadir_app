//
//  iakadir_appApp.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 28/11/2024.
//

import SwiftUI
import PostHog

@main
struct iakadir_appApp: App {
    init(){
        let POSTHOG_API_KEY = "phx_8cI6OWvTSjdJqwpCOxnf21LHDaUQ84qPE0iNRLvb2DmYkDg"
        // usually 'https://us.i.posthog.com' or 'https://eu.i.posthog.com'
        let POSTHOG_HOST = "https://us.i.posthog.com"
        
        let config = PostHogConfig(apiKey: POSTHOG_API_KEY, host: POSTHOG_HOST)
        PostHogSDK.shared.setup(config)
    }
    var body: some Scene {
        WindowGroup {
                OnboardingView()
        }
    }
}
