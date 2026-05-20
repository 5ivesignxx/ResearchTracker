//
//  ContentView.swift
//  ResearchTracker
//  ABC Computers PVT LTD — Research Division
//

import SwiftUI

// Ensure this app only compiles and runs on iOS / iPadOS
#if !os(iOS)
#error("ResearchTracker is an iOS-only app. Please select an iPhone or iPad simulator.")
#endif

struct ContentView: View {
    @StateObject private var vm = ToDoViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {

                // ── Summary Cards ──────────────────────────────
                summarySection
                    .padding(.horizontal)
                    .padding(.top, 8)
                    .padding(.bottom, 12)

                Divider()

                // ── Filter Chips ───────────────────────────────
                filterChips
                    .padding(.horizontal)
                    .padding(.vertical, 10)

                Divider()

                // ── To-Do List ─────────────────────────────────
                toDoList

            }
            .navigationTitle("Research Tracker")
            .navigationBarTitleDisplayMode(.large)          // iOS only
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {  // iOS only
                    VStack(alignment: .trailing, spacing: 1) {
                        Text("ABC Computers")
                            .font(.system(size: 10, weight: .semibold))
                            .foregroundColor(.blue)
                        Text("PVT LTD")
                            .font(.system(size: 9))
                            .foregroundColor(.secondary)
                    }
                }
            }
            .searchable(text: $vm.searchText, prompt: "Search tests…")
        }
        .navigationViewStyle(.stack)   // forces single-column on all iOS devices
    }

    // MARK: - Summary Cards
    private var summarySection: some View {
        HStack(spacing: 10) {
            SummaryCardView(
                title: "TestSet 2\n(even days)",
                value: vm.totalEven,
                color: .blue,
                icon:  "list.number"
            )
            SummaryCardView(
                title: "Completed\n(filterFn result)",
                value: vm.completedEven,
                color: .green,
                icon:  "checkmark.seal.fill"
            )
            SummaryCardView(
                title: "Pending\n(even days)",
                value: vm.pendingEven,
                color: .orange,
                icon:  "clock.badge.exclamationmark"
            )
        }
    }

    // MARK: - Filter Chips
    private var filterChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(FilterMode.allCases, id: \.self) { mode in
                    Button(action: { vm.filterMode = mode }) {
                        Text(mode.rawValue)
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(vm.filterMode == mode ? .white : .blue)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 7)
                            .background(
                                Capsule()
                                    .fill(vm.filterMode == mode ? Color.blue : Color.blue.opacity(0.1))
                            )
                    }
                }
            }
        }
    }

    // MARK: - To-Do List
    private var toDoList: some View {
        Group {
            if vm.displayedToDos.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "tray")
                        .font(.system(size: 40))
                        .foregroundColor(.secondary.opacity(0.4))
                    Text("No tests match this filter")
                        .foregroundColor(.secondary)
                        .font(.system(size: 15))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List(vm.displayedToDos, id: \.toDoId) { todo in
                    ToDoRowView(todo: todo)
                        .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                }
                .listStyle(.plain)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
