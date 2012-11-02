library animals;
import 'boardState.dart';
import 'player.dart';
import 'canvasState.dart';
import 'dart:math';

/*
 * A generic animal.
 */
abstract class Animal {
    int radius;
    BoardState _state; // _ signifies private
    
    /* Move the animal/update board state */
    UpdateCoordinates doMove(Player playerToTarget);
    
    int getX();
    int getY();
}

/**
 * A generic animal class.
 * 
 * It moves around with a given x and y velocity until it gets out of the blocks area,
 * it then follows around a player and uses a location integer for its location.
 */
class TheOneTheOnlyAnimal extends Animal {
    // x and y position and velocity
    double xVelocity, yVelocity;
    double x, y;
    // the location outside of the blocks area
    int location;
    // if (false) use x/y; if (true) use location
    bool outside;
    const double VELOCITY = 0.1;

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
        
        this.outside = false;
    }
    
    int getX() {
        return x.toInt();
    }
    
    int getY() {
        return y.toInt();
    }
  
    /* Move the animal/update board state */
    UpdateCoordinates doMove(Player playerToTarget) {
        if (this._state.isOutisideOfBlocksArea(getX(), getY())) {
            this.outside = true;
            this.location = this._state.getLocation(getX(), getY());
            //TODO return
            return new UpdateCoordinates(0,0,0,0);
        } else {
            bool invertV = false;
            int origX = getX();
            int origY = getY();
            
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
            if (xVelocity > 0) {
                if (yVelocity > 0)
                    return new UpdateCoordinates(origX, origY, xVelocity.ceil().toInt() + 1, yVelocity.ceil().toInt() + 1);
                else
                    return new UpdateCoordinates(origX, getY(), xVelocity.ceil().toInt() + 1, -yVelocity.floor().toInt() + 1);
            } else {
                if (yVelocity > 0)
                    return new UpdateCoordinates(getX(), origY, -xVelocity.floor().toInt() + 1, yVelocity.ceil().toInt() + 1);
                else
                    return new UpdateCoordinates(getX(), getY(), -xVelocity.floor().toInt() + 1, -yVelocity.floor().toInt() + 1);
            }
        }
    }
}