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


pokemonList: HashMap[uint256, Pokemon]
