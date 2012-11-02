library animals;
import 'boardState.dart';
import 'dart:math';

/*
 * A generic animal.
 */
abstract class Animal {
    int radius;
    BoardState _state; // _ signifies private
    
    /* Move the animal/update board state */
    void doMove();
    
    int getX();
    int getY();
}

class TheOneTheOnlyAnimal extends Animal {
    double xVelocity, yVelocity;
    double x, y;
    const int VELOCITY = 1;

    /**
     * 
     */
    TheOneTheOnlyAnimal(BoardState state, int animalNum, int numAnimals) {
        this._state = state;
        //TODO Decide on const here
        this.radius = 1;
        // Start at the middle of the board and move outward in a circle with angles evenly split between each animal
        this.x = state.WIDTH / 2;
        this.y = state.HEIGHT / 2;
        
        this.xVelocity = VELOCITY * cos(2*PI * animalNum/numAnimals);
        this.yVelocity = VELOCITY * sin(2*PI * animalNum/numAnimals);
    }
    
    int getX() {
        return x.toInt();
    }
    
    int getY() {
        return y.toInt();
    }
  
    /* Move the animal/update board state */
    void doMove() {
        if (this._state.isOutisideOfBlocksArea(getX(), getY())) {
            //TODO Move like the player (towards the player)
        } else {
            bool invertV = false;
            this.x += xVelocity;
            this.y += yVelocity;
            for (int i = 0; i < this.radius; i++) {
                //TODO: Update me when radius is > 1
                if (this._state.board[getX()][getY()].state) {
                    invertV = true;
                    this._state.board[getX()][getY()].state = false;
                }
            }
            if (invertV) {
                xVelocity = -xVelocity;
                yVelocity = -yVelocity;
            }
            //TODO Update display here
        }
    }
}