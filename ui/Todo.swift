import SwiftUI

struct TodoView: View {
    @State private var todos: [String] = []
    @State private var isShowingSheet = false
    @State private var newTodoText = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(todos.indices, id: \.self) { index in
                    HStack {
                        Text(todos[index])
                            .lineLimit(1)

                        Spacer()

                        Button {
                            todos.remove(at: index)
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("TODO App 🌞")
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingSheet) {
                VStack(spacing: 20) {
                    HStack {
                            Spacer()
                            Button {
                                isShowingSheet = false
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .font(.title2)
                            }
                        }
                    
                    Text("add a new Todo")
                        .font(.headline)
                    
                    TextField("Enter task", text: $newTodoText)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    Button("Add") {
                        if !newTodoText.isEmpty {
                            todos.append(newTodoText)
                            newTodoText = ""
                            isShowingSheet = false
                        }
                    }
                    .buttonStyle(.bordered)

                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    TodoView()
}
