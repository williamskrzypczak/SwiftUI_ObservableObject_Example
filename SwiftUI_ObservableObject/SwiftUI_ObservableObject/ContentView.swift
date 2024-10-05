//
//  ContentView.swift
//  SwiftUI_ObservableObject
//
//  Created by Bill Skrzypczak on 10/5/24.
//

import SwiftUI

// Step 1: Create a class that conforms to ObservableObject

class Counter: ObservableObject {
    
    // Step 2: Use @Published to mark the properties that should trigger view updates
    
    @Published var value: Int = 0
    
    // Increment function
    func increment() {
        value += 1
    }
    
    // Decrement function
    func decrement() {
        value -= 1
    }
}

struct ContentView: View {
    
    // Step 3: Use @StateObject to instantiate the ObservableObject in the view
    @StateObject private var counter = Counter()
    
    var body: some View {
        VStack {
            // Step 4: Bind the view to the observable property
            Text("Counter value: \(counter.value)")
                .font(.largeTitle)
                .padding()

            HStack {
                Button(action: {
                    counter.increment()
                }) {
                    Text("Increment")
                        .font(.title)
                        .padding()
                }

                Button(action: {
                    counter.decrement()
                }) {
                    Text("Decrement")
                        .font(.title)
                        .padding()
                }
            }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
