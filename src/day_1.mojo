"""
Following these rotations would cause the dial to move as follows:

    The dial starts by pointing at 50.
    The dial is rotated L68 to point at 82.
    The dial is rotated L30 to point at 52.
    The dial is rotated R48 to point at 0.
    The dial is rotated L5 to point at 95.
    The dial is rotated R60 to point at 55.
    The dial is rotated L55 to point at 0.
    The dial is rotated L1 to point at 99.
    The dial is rotated L99 to point at 0.
    The dial is rotated R14 to point at 14.
    The dial is rotated L82 to point at 32.
"""

def move(position_from: Int, rotation: String) -> Int:
    """Rotates the 100-positions-dial from a position to right or left."""
    var position_to : Int
    var distance = Int(rotation[1:])

    if rotation[0] == 'L':
        position_to = (position_from - distance) % 100
    elif rotation[0] == 'R':
        position_to = (position_from + distance) % 100
    else:
        raise Error("Error while treating this rotation:", rotation)
    return position_to

def main():
    rotations_raw = """L68
    L30
    R48
    L5
    R60
    L55
    L1
    L99
    R14
    L82"""
    
    position : Int = 50
    position_sequence : List[Int] = [position]
    
    rotations = StringSlice(rotations_raw).split("\n")

    for i in range(len(rotations)):
        rotation = rotations[i].strip()
        position = move(position, String(rotation))
        position_sequence.append(position)

        print("new position is ", position)


