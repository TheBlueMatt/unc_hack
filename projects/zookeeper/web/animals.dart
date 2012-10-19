library animals;
import 'boardState.dart';

/*
 * A generic animal.
 */
abstract class Animal {
    int x, y;
    int radius;
    BoardState _state; // _ signifies private
    
    /* Move the animal/update board state */
    void doMove();
}

class TheOneTheOnlyAnimal extends Animal {
    int xVelocity, yVelocity;

    TheOneTheOnlyAnimal(BoardState state) {
        this._state = state;
    }
  
    /* Move the animal/update board state */
    void doMove() {
        // TODO: Implement me!
    }
}