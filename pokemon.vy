# @version >= 0.2.4 <0.3.0

DNA_DIGITS: constant(uint256) = 16
DNA_MOD: constant(uint256) = 10**DNA_DIGITS
# constant named HP_LIMIT with a value of 1000
HPP_LIMIT: constant(uint256) = 1000


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
def _createPokemon(_name: String[32], _dna: uint256, _HP: uint256, randomDNA: uint256):
    self.pokemonList[self.totalPokemonCount] = Pokemon(
        {_name: name, _matches: 0, _wins: 0}
    )
    self.totalPokemonCount += 1
    # call the function _generateRandomDNA using the self environment variable and pass the _name variable as an argument
    randomDNA: uint256 = self._generateRandomDNA(_name)


@pure
@internal
def _generateRandomDNA(_name: String[32]) -> uint256:
    # generate keccak256 hash of the pokemon name
    keccak256Hash: uint256 = uint256(sha3_256(_name))
    # convert this hash into a uint256 and assign its value to a uint256 variable named random
    random: uint256 = uint256(keccak256Hash)
    return random % DNA_MOD
