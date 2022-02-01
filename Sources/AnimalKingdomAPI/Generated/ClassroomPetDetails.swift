import ApolloAPI

public struct ClassroomPetDetails: AnimalKingdomAPI.SelectionSet, Fragment {
  public let data: DataDict
  public init(data: DataDict) { self.data = data }

  public static var __parentType: ParentType { .Union(AnimalKingdomAPI.ClassroomPet.self) }
  public static var selections: [Selection] { [
    .typeCase(AsAnimal.self),
    .typeCase(AsPet.self),
    .typeCase(AsWarmBlooded.self),
    .typeCase(AsCat.self),
    .typeCase(AsBird.self),
    .typeCase(AsPetRock.self),
  ] }

  public var asAnimal: AsAnimal? { _asType() }
  public var asPet: AsPet? { _asType() }
  public var asWarmBlooded: AsWarmBlooded? { _asType() }
  public var asCat: AsCat? { _asType() }
  public var asBird: AsBird? { _asType() }
  public var asPetRock: AsPetRock? { _asType() }

  public struct AsAnimal: AnimalKingdomAPI.TypeCase {
    public let data: DataDict
    public init(data: DataDict) { self.data = data }

    public static var __parentType: ParentType { .Interface(AnimalKingdomAPI.Animal.self) }
    public static var selections: [Selection] { [
      .field("species", String.self),
    ] }

    public var species: String { data["species"] }
  }

  public struct AsPet: AnimalKingdomAPI.TypeCase {
    public let data: DataDict
    public init(data: DataDict) { self.data = data }

    public static var __parentType: ParentType { .Interface(AnimalKingdomAPI.Pet.self) }
    public static var selections: [Selection] { [
      .field("humanName", String?.self),
    ] }

    public var humanName: String? { data["humanName"] }
  }

  public struct AsWarmBlooded: AnimalKingdomAPI.TypeCase {
    public let data: DataDict
    public init(data: DataDict) { self.data = data }

    public static var __parentType: ParentType { .Interface(AnimalKingdomAPI.WarmBlooded.self) }
    public static var selections: [Selection] { [
      .field("laysEggs", Bool.self),
    ] }

    public var laysEggs: Bool { data["laysEggs"] }
    public var species: String { data["species"] }
  }

  public struct AsCat: AnimalKingdomAPI.TypeCase {
    public let data: DataDict
    public init(data: DataDict) { self.data = data }

    public static var __parentType: ParentType { .Object(AnimalKingdomAPI.Cat.self) }
    public static var selections: [Selection] { [
      .field("bodyTemperature", Int.self),
      .field("isJellicle", Bool.self),
    ] }

    public var bodyTemperature: Int { data["bodyTemperature"] }
    public var isJellicle: Bool { data["isJellicle"] }
    public var species: String { data["species"] }
    public var humanName: String? { data["humanName"] }
    public var laysEggs: Bool { data["laysEggs"] }
  }

  public struct AsBird: AnimalKingdomAPI.TypeCase {
    public let data: DataDict
    public init(data: DataDict) { self.data = data }

    public static var __parentType: ParentType { .Object(AnimalKingdomAPI.Bird.self) }
    public static var selections: [Selection] { [
      .field("wingspan", Int.self),
    ] }

    public var wingspan: Int { data["wingspan"] }
    public var species: String { data["species"] }
    public var humanName: String? { data["humanName"] }
    public var laysEggs: Bool { data["laysEggs"] }
  }

  public struct AsPetRock: AnimalKingdomAPI.TypeCase {
    public let data: DataDict
    public init(data: DataDict) { self.data = data }

    public static var __parentType: ParentType { .Object(AnimalKingdomAPI.PetRock.self) }
    public static var selections: [Selection] { [
      .field("favoriteToy", String.self),
    ] }

    public var favoriteToy: String { data["favoriteToy"] }
    public var humanName: String? { data["humanName"] }
  }
}