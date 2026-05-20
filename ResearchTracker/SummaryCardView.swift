//
//  SummaryCardView.swift
//  ResearchTracker
//  ABC Computers PVT LTD — Research Division
//

import SwiftUI

struct SummaryCardView: View {
    let title:  String
    let value:  Int
    let color:  Color
    let icon:   String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.system(size: 14))
                Spacer()
            }
            Text("\(value)")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(color)
            Text(title)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.secondary)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(color.opacity(0.08))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(color.opacity(0.18), lineWidth: 0.5)
        )
    }
}
