import Foundation
import CoreLocation

class EventService: ObservableObject {
    @Published var events: [Event] = []
    
    func loadEvents() {
        guard let url = Bundle.main.url(forResource: "events", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Ошибка: JSON файл не найден")
            // Временно используем тестовые данные
            self.events = MockEvents.events
            return
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            self.events = try decoder.decode([Event].self, from: data)
        } catch {
            print("Ошибка декодирования JSON: \(error)")
            // Временно используем тестовые данные
            self.events = MockEvents.events
        }
    }
} 