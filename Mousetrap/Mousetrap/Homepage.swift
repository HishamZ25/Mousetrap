//
//  ContentView.swift
//  Mousetrap
//
//  Created by Hisham Zannoun on 9/30/24.
//

import SwiftUI

struct Homepage: View {
    var body: some View {
        TabView {
            // Home Tab
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            // Apps Tab
            NavigationView {
                AppsView()
                    .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "app.badge")
                Text("Apps")
            }
            
            // Metrics Tab
            NavigationView {
                MetricsView()
                    .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "chart.bar")
                Text("Metrics")
            }
            
            // Accountability Tab
            NavigationView {
                AccountabilityView()
                    .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "checkmark.circle")
                Text("Accountability")
            }
            
            // Profile Tab
            NavigationView {
                ProfileView()
                    .navigationBarHidden(true)
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
        }
        .accentColor(.green)
        Color(red: 1.0, green: 0.98, blue: 0.94)
        .navigationBarHidden(true)
    }
}

// Home View with Current Screen Time and Blocked Apps
struct HomeView: View {
    private let maxScreenTime: CGFloat = 5 * 60 // 5 hours in minutes
    private let currentScreenTime: CGFloat = 3 * 60 + 56 // 3 hours 56 minutes in minutes
    
    var body: some View {
        VStack(spacing: 20) {
            // Current Screen Time Component
            VStack {
                Text("Current Screen Time")
                    .font(.headline)
                    .padding(.top, 20)
                
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 20)
                        .frame(width: 150, height: 150)
                    
                    Circle()
                        .trim(from: 0, to: currentScreenTime / maxScreenTime)
                        .stroke(Color.green, lineWidth: 20)
                        .frame(width: 150, height: 150)
                        .rotationEffect(.degrees(-90))
                    
                    Text("3h 56m")
                        .font(.title2)
                        .bold()
                }
            }
            
            // Blocked Apps Section
            VStack(alignment: .leading) {
                Text("Blocked Apps")
                    .font(.headline)
                    .padding(.top, 20)
                
                HStack(spacing: 20) {
                    ForEach(["tiktok", "snapchat", "youtube", "instagram"], id: \.self) { appName in
                        VStack {
                            Image(appName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                            Text(appName.capitalized)
                                .font(.caption)
                        }
                    }
                }
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
    }
}

// Placeholder Views for Other Tabs
struct AppsView: View {
    var body: some View {
        Text("Apps Screen")
    }
}

struct MetricsView: View {
    var body: some View {
        Text("Metrics Screen")
    }
}

struct AccountabilityView: View {
    var body: some View {
        Text("Accountability Screen")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Screen")
    }
}

#Preview {
    Homepage()
}
