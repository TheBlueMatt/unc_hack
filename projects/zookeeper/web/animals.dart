library animals;
import 'boardState.dart';
import 'dart:math';

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
    const int VELOCITY = 5;

    /**
     * 
     */
    TheOneTheOnlyAnimal(BoardState state, int animalNum, int numAnimals) {
        this._state = state;
        //TODO Decide on const here
        this.radius = 1;
        // Start at the middle of the board and move outward in a circle with angles evenly split between each animal
        this.x = state.WIDTH ~/ 2;
        this.y = state.HEIGHT ~/ 2;
        
        this.xVelocity = (VELOCITY * cos(2*PI * animalNum/numAnimals)).toInt();
        this.yVelocity = (VELOCITY * sin(2*PI * animalNum/numAnimals)).toInt();
    }
  
    /* Move the animal/update board state */
    void doMove() {
        if (this._state.isOutisideOfBlocksArea(x, y)) {
            //TODO Move like the player (towards the player)
        } else {
            int origX = this.x;
            int origY = this.y;
            for (int i = 0; i < VELOCITY; i++) {
                bool invertV = false;
                this.x = origX + (xVelocity * i ~/ VELOCITY);
                this.y = origY + (yVelocity * i ~/ VELOCITY);
                for (int i = 0; i < this.radius; i++) {
                    //TODO: UPdate me when radius is > 1
                    if (this._state.board[this.x][this.y].state) {
                        invertV = true;
                        this._state.board[this.x][this.y].state = false;
                    }
                }
                if (invertV) {
                    origX = this.x + xVelocity * (VELOCITY - i) ~/ VELOCITY;
                    origY = this.y + yVelocity * (VELOCITY - i) ~/ VELOCITY;
                    xVelocity = -xVelocity;
                    yVelocity = -yVelocity;
                }
                //TODO Update display here
            }
        }
    }
}