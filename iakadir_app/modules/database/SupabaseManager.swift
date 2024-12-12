//
//  SupabaseManager.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 11/12/2024.
//

import Foundation
import Supabase



public class SupabaseManager{
    
    static let shared = SupabaseManager()
    let client : SupabaseClient
    private init(){
        self.client = SupabaseClient(
          supabaseURL: URL(string: "https://ajtvsvhxcpkbwrtbqakj.supabase.co")!,
          supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFqdHZzdmh4Y3BrYndydGJxYWtqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM5MjAxNDEsImV4cCI6MjA0OTQ5NjE0MX0.iUapIqhjyTti3rgKHi8tJZhrmzbXm-bEBKgji8MbpG8"
        )
    }
}
