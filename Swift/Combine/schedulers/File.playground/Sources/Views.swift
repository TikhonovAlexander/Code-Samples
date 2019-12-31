import SwiftUI
import Combine

struct EventValueView: View {
    let index: Int
    var body: some View {
        Text("\(self.index)")
            .padding(3.0)
            .frame(width: 28.0, height: 28.0)
            .allowsTightening(true)
            .minimumScaleFactor(0.1)
            .foregroundColor(.white)
            .background(Circle().fill(Color.blue))
            .fixedSize()
    }
}

struct EventCompletedView: View {
    var body: some View {
        Text("-")
            .padding(3.0)
            .frame(width: 28.0, height: 28.0)
            .foregroundColor(.white)
            .background(Circle().fill(Color.black))
    }
}

struct EventFailureView: View {
    var body: some View {
        Text("X")
            .padding(3.0)
            .frame(width: 28.0, height: 28.0)
            .foregroundColor(.white)
            .background(Circle().fill(Color.red))
    }
}

struct EventView: View {
    let data: RecorderData
    
    var body: some View {
        switch self.data.event {
        case .value:
            return AnyView(EventValueView(index: self.data.index))
        case .completion:
            return AnyView(EventCompletedView())
        case .failure:
            return AnyView(EventFailureView())
        }
    }
}

public typealias SetupClosure = (ThreadRecorder) -> AnyPublisher<RecorderData, Never>

public struct ThreadRecorderView: View {
    @ObservedObject public var recorder = ThreadRecorder()
    let title: String
    let setup: SetupClosure
    
    public init(title: String, setup: @escaping SetupClosure) {
        self.title = title
        self.setup = setup
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fixedSize(horizontal: false, vertical: true)
            List(recorder.chains.reversed()) { chain in
                RecorderDataView(data: chain.data)
            }
        }.onAppear {
            self.recorder.start(with: self.setup)
        }
    }
}

struct RecorderDataView: View {
    let data: [RecorderData]
    
    var body: some View {
        HStack() {
            EventView(data: self.data[0])
            if self.data[0].event == .value {
                ForEach(data) { event in
                    Rectangle()
                        .frame(width: 16, height: 3, alignment: .center)
                        .foregroundColor(.gray)
                    if !event.context.isEmpty {
                        Text(event.context)
                            .padding([.leading, .trailing], 5)
                            .padding([.top, .bottom], 2)
                            .background(Color.gray)
                            .foregroundColor(.white)
                    }
                    Text("Thread \(event.thread)")
                }
            }
        }
    }
}
