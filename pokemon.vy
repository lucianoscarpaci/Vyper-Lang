# @version >= 0.2.4 <0.3.0

DNA_DIGITS: constant(uint256) = 16
DNA_MOD: constant(uint256) = 10**DNA_DIGITS


# a struct to represent a pokemon
struct Pokemon:
        name: String[32]
        dna: uint256
        HP: uint256
        matches: uint256
        wins: uint256


totalPokemonCount: public(uint256)
pokemonList: HashMap[uint256, Pokemon]

# An external function that creates a pokemon and adds it to the pokemonList
@internal
def _createPokemon(_name: String[32], _dna: uint256, _HP: uint256):
    self.pokemonList[self.totalPokemonCount] = Pokemon(
        {_name: name, _dna: dna, _HP: HP, _matches: 0, _wins: 0}
    )
    self.totalPokemonCount += 1


@pure
@internal
def _generateRandomDNA(_name: String[32]) -> uint256:
    pass
