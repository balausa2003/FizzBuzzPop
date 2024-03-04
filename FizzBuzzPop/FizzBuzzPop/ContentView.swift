//
//  ContentView.swift
//  FizzBuzzPop
//
//  Created by Балауса Косжанова on 17.04.2023.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
            }
            .listStyle(PlainListStyle())
            .listRowBackground(Color.blue.opacity(0.1))
            .background(Color.blue.opacity(0.1))
            .navigationBarTitle("My List")
            
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
