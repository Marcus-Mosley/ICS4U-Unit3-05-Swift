//
// ContentView.swift
// ICS4U-Unit3-05-Swift
//
// Created by Marcus A. Mosley on 2021-05-25
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    @State private var arr: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    var body: some View {
        VStack {
            Text("All of the order 3 Magic Squares: ")
                .padding()
            Button("Enter", action: {
                solve(0)
            }).padding()
            Text("\(text)")
        }
    }

    // Uses recursion to solve the order 3 Magic Squares
    func solve(_ pos: Int) {

        if pos == 8 {
            if test() == true {
                printArr()
            }
        } else {
            for count in pos..<9 {
                swap(pos, count)
                solve(pos + 1)
                swap(pos, count)
            }
        }
    }

    // Permutes the array
    func swap(_ id1: Int, _ id2: Int) {

        let tmp = arr[id1]
        arr[id1] = arr[id2]
        arr[id2] = tmp
    }

    // Checks if the array is a magic square
    func test() -> Bool {
        let num = 15
        let row1 = Int(arr[0]) + Int(arr[1]) + Int(arr[2])
        let row2 = Int(arr[3]) + Int(arr[4]) + Int(arr[5])
        let row3 = Int(arr[6]) + Int(arr[7]) + Int(arr[8])
        let col1 = Int(arr[0]) + Int(arr[3]) + Int(arr[6])
        let col2 = Int(arr[1]) + Int(arr[4]) + Int(arr[7])
        let col3 = Int(arr[2]) + Int(arr[5]) + Int(arr[8])
        let diag1 = Int(arr[0]) + Int(arr[4]) + Int(arr[8])
        let diag2 = Int(arr[2]) + Int(arr[4]) + Int(arr[6])

        if row1 == num && row2 == num && row3 == num && col1 == num &&
            col2 == num && col3 == num && diag1 == num && diag2 == num {
            return true
        } else {
            return false
        }
    }

    // Print the array
    func printArr() {

        for count in 0..<arr.count {
            if count == 3 || count == 6 {
                text += "\n\(arr[count]) "
            } else {
                text += "\(arr[count]) "
            }
        }
        text += "\n\n"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
