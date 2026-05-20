//
//  ToDoData.swift
//  ResearchTracker
//  ABC Computers PVT LTD — Research Division
//

import Foundation

// MARK: - Sample Data
// Odd  toDoId  → TestSet 1 (odd days)
// Even toDoId  → TestSet 2 (even days)
let toDoList: [ToDo] = [
    ToDo(toDoId: 1,  toDoTitle: "CPU Benchmark",               toDoStatus: "completed"),
    ToDo(toDoId: 2,  toDoTitle: "Memory Stress Test",           toDoStatus: "completed"),
    ToDo(toDoId: 3,  toDoTitle: "Disk I/O Performance Test",    toDoStatus: "pending"),
    ToDo(toDoId: 4,  toDoTitle: "Network Latency Test",          toDoStatus: "completed"),
    ToDo(toDoId: 5,  toDoTitle: "GPU Rendering Test",            toDoStatus: "completed"),
    ToDo(toDoId: 6,  toDoTitle: "Battery Drain Analysis",        toDoStatus: "pending"),
    ToDo(toDoId: 7,  toDoTitle: "Thermal Throttle Test",         toDoStatus: "pending"),
    ToDo(toDoId: 8,  toDoTitle: "Cache Performance Test",        toDoStatus: "completed"),
    ToDo(toDoId: 9,  toDoTitle: "Boot Time Benchmark",           toDoStatus: "completed"),
    ToDo(toDoId: 10, toDoTitle: "Power Consumption Analysis",    toDoStatus: "completed"),
    ToDo(toDoId: 11, toDoTitle: "Multithreading Stress Test",    toDoStatus: "pending"),
    ToDo(toDoId: 12, toDoTitle: "Peripheral Response Test",      toDoStatus: "pending"),
    ToDo(toDoId: 13, toDoTitle: "Voltage Regulation Test",       toDoStatus: "pending"),
    ToDo(toDoId: 14, toDoTitle: "RAM Bandwidth Benchmark",       toDoStatus: "completed"),
    ToDo(toDoId: 15, toDoTitle: "PCIe Throughput Test",          toDoStatus: "completed"),
    ToDo(toDoId: 16, toDoTitle: "Thermal Management Test",       toDoStatus: "pending"),
    ToDo(toDoId: 17, toDoTitle: "USB Controller Test",           toDoStatus: "pending"),
    ToDo(toDoId: 18, toDoTitle: "Storage Endurance Test",        toDoStatus: "completed"),
    ToDo(toDoId: 19, toDoTitle: "Interrupt Latency Test",        toDoStatus: "pending"),
    ToDo(toDoId: 20, toDoTitle: "Display Color Accuracy Test",   toDoStatus: "pending"),
]

// MARK: - Core Filter Function
/// Accepts an array of ToDo and returns a new array containing only
/// entries where toDoId is even AND toDoStatus is "completed".
/// This gives the senior the TestSet 2 completion report.
func filterCompletedEvenToDos(toDoArray: [ToDo]) -> [ToDo] {
    return toDoArray.filter { todo in
        todo.toDoId % 2 == 0 && todo.toDoStatus == "completed"
    }
}
