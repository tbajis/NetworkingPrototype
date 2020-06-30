import Foundation
import PlaygroundSupport
import Networking
import Combine

PlaygroundPage.current.needsIndefiniteExecution = false

func getMemberId() -> AnyPublisher<Int, ClientError> {
    return Future { completion in
        sleep(2)
        completion(.success(1))
    }
    .eraseToAnyPublisher()
}


func runRequest() {
    let request = DarkSkyRequest()
    let client = Client()
    
    let semaphore = DispatchSemaphore(value: 0)
    
    getMemberId()
        .flatMap { _ in return client.send(request) }
        .sink(receiveCompletion: { completion in
             if case .failure(let error) = completion {
                 print(error)
             }
             semaphore.signal()
         }, receiveValue: { response in
             print(response.response.latitude)
             semaphore.signal()
         })
    
    semaphore.wait()
}

runRequest()
