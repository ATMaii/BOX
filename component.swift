// MARK: - Components

struct CardRowView: View {
    let title: String
    let cards: [Card]

    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
            HStack {
                ForEach(cards, id: \ .id) { card in
                    Text(card.display)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 2)
                }
            }
        }
    }
}

struct DraggableCard: View {
    let card: Card

    var body: some View {
        Text(card.display)
            .padding()
            .background(Color.yellow)
            .cornerRadius(8)
            .shadow(radius: 2)
            .onDrag {
                NSItemProvider(object: NSString(string: card.display))
            }
    }
}