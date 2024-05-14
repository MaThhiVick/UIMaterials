//
//  SuggestionsComponent.swift
//  UIMaterials
//
//  Created by Matheus Vicente on 13/05/24.
//

import SwiftUI

struct SuggestionsComponent: View {
    let title: String
    let suggestionsList: [String]

    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]

    init(title: String, suggestionsList: [String]) {
        self.title = title
        self.suggestionsList = suggestionsList
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            divider()
            coordinateSuggestionsElements()
        }
        .padding(.leading, 12)
    }

    @ViewBuilder
    private func divider() -> some View {
        Color.gray.frame(height: 0.5)
            .padding(.trailing, 12)
    }

    @ViewBuilder
    private func coordinateSuggestionsElements() -> some View {
        LazyVGrid(columns: adaptiveColumn, alignment: .leading, spacing: 0)  {
            ForEach(Array(suggestionsList.enumerated()), id: \.element) { index, element in
                VStack(alignment: .leading ,spacing: 8) {
                    suggestionElementSetup(element)
                        .padding(.top, 8)
                    if index < (suggestionsList.count - 2) {
                        divider()
                    }
                }
            }
            .foregroundStyle(.blue)
        }
    }

    @ViewBuilder
    private func suggestionElementSetup(_ element: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 12))
            Text(handleLongString(element))
                .font(.system(size: 14))
        }
    }

    private func handleLongString(_ element: String) -> String {
        if element.count < 19 {
            return element
        } else {
            let newString = String(element.prefix(15))
            return newString + "..."
        }
    }
}

#Preview {
    SuggestionsComponent(title: "Discover", suggestionsList: ["Sony", "Candy Crush", "Instagram", "pou", "emprestimo pessoal", "authenticator"])
}
