//
//  ToDoRowView.swift
//  ResearchTracker
//  ABC Computers PVT LTD — Research Division
//

import SwiftUI

struct ToDoRowView: View {
    let todo: ToDo

    private var isEven: Bool    { todo.toDoId % 2 == 0 }
    private var isDone: Bool    { todo.toDoStatus == "completed" }
    private var setLabel: String { isEven ? "TestSet 2" : "TestSet 1" }

    var body: some View {
        HStack(spacing: 14) {

            // Status circle
            ZStack {
                Circle()
                    .stroke(isDone ? Color.green : Color.gray.opacity(0.4), lineWidth: 1.5)
                    .frame(width: 26, height: 26)
                if isDone {
                    Image(systemName: "checkmark")
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.green)
                }
            }

            VStack(alignment: .leading, spacing: 3) {
                Text(todo.toDoTitle)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(isDone ? .secondary : .primary)
                    .strikethrough(isDone, color: .secondary)

                HStack(spacing: 6) {
                    // Day badge
                    Text("Day \(todo.toDoId)")
                        .font(.system(size: 11, weight: .semibold, design: .monospaced))
                        .foregroundColor(isEven ? .blue : .gray)
                        .padding(.horizontal, 7)
                        .padding(.vertical, 2)
                        .background(
                            Capsule().fill(isEven ? Color.blue.opacity(0.12) : Color.gray.opacity(0.1))
                        )

                    // TestSet badge
                    Text(setLabel)
                        .font(.system(size: 10, weight: .medium, design: .monospaced))
                        .foregroundColor(isEven ? .blue.opacity(0.8) : .gray)
                }
            }

            Spacer()

            // Status pill
            Text(todo.toDoStatus)
                .font(.system(size: 10, weight: .semibold))
                .foregroundColor(isDone ? .green : .orange)
                .padding(.horizontal, 9)
                .padding(.vertical, 4)
                .background(
                    Capsule().fill(isDone ? Color.green.opacity(0.12) : Color.orange.opacity(0.12))
                )
        }
        .padding(.vertical, 6)
    }
}
