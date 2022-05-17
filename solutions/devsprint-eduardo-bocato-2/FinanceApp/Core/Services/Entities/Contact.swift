import Foundation

struct Contact: Decodable, Equatable {
    let name: String
    let phone: String
}

#if DEBUG
 extension Contact {
     static func fixture(
         name: String = "John Doe",
         phone: String = "123 456 789"
     ) -> Self {
         .init(
            name: name,
            phone: phone
         )
     }
 }
#endif
