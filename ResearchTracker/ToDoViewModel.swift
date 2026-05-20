//
//  ToDoViewModel.swift
//  ResearchTracker
//  ABC Computers PVT LTD — Research Division
//

import Foundation
import Combine

// MARK: - Filter Mode
enum FilterMode: String, CaseIterable {
    case allEven      = "TestSet 2 (All)"
    case completed    = "Completed"
    case pending      = "Pending"
    case all          = "All Days"
}

// MARK: - ViewModel
class ToDoViewModel: ObservableObject {

    @Published var filterMode: FilterMode = .allEven
    @Published var searchText: String     = ""

    // Raw source — all 20 items
    let allToDos: [ToDo] = toDoList

    // Result of the required filter function (senior's report)
    var seniorReport: [ToDo] {
        filterCompletedEvenToDos(toDoArray: allToDos)
    }

    // Items shown in the list based on selected filter + search
    var displayedToDos: [ToDo] {
        let base: [ToDo]
        switch filterMode {
        case .allEven:
            base = allToDos.filter { $0.toDoId % 2 == 0 }
        case .completed:
            base = filterCompletedEvenToDos(toDoArray: allToDos)   // calls the required function
        case .pending:
            base = allToDos.filter { $0.toDoId % 2 == 0 && $0.toDoStatus == "pending" }
        case .all:
            base = allToDos
        }

        guard !searchText.isEmpty else { return base }
        return base.filter {
            $0.toDoTitle.lowercased().contains(searchText.lowercased())
        }
    }

    // Summary stats
    var totalEven:     Int { allToDos.filter { $0.toDoId % 2 == 0 }.count }
    var completedEven: Int { seniorReport.count }
    var pendingEven:   Int { allToDos.filter { $0.toDoId % 2 == 0 && $0.toDoStatus == "pending" }.count }
}
