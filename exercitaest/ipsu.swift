import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = ItemsViewModel()

    var body: some View {
        VStack {
            ForEach(viewModel.items) { item in
                ItemView(isPlaying: $viewModel.items[viewModel.index(of: item)!].isPlaying, id: item.id)
            }
        }
    }
}

class ItemsViewModel: ObservableObject {
    @Published var items = [Item(id: 1), Item(id: 2), Item(id: 3)]
    
    func index(of item: Item) -> Int? {
        items.firstIndex(where: { $0.id == item.id })
    }
}

struct Item: Identifiable {
    let id: Int
    var isPlaying: Bool = false
}

struct ItemView: View {
    @Binding var isPlaying: Bool
    let id: Int

    var body: some View {
        HStack {
            Text("Item \(id)")
            Spacer()
            Button(action: {
                isPlaying.toggle()
            }) {
                Text(isPlaying ? "Pause" : "Play")
            }
        }
        .padding()
    }
}
