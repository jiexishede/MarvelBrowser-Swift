//  TDD sample app MarvelBrowser-Swift by Jon Reid, https://qualitycoding.org/
//  Copyright 2018 Jonathan M. Reid. See LICENSE.txt

struct CharacterResponseBuilder {
    let name: String?

    init(dictionary dict: [String: Any]) {
        name = dict["name"] as? String
    }

    func build() -> CharacterResponseModel? {
        guard let name = name else {
            return nil
        }
        return CharacterResponseModel(name: name)
    }
}
