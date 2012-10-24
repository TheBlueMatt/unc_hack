library player;
import 'boardState.dart';
import 'dart:html';

/*
 * Keeps track of the player
 */
class Player {
    BoardState _state;
    int moveDirection;
    
    Player(BoardState state) {
        this._state = state;
        // The initial move direction is 0; player is initially not moving.
        this.moveDirection = 0;
    }
    
    void handleKeyEvent(KeyboardEvent e) {
        // left key.
        if (e.keyCode == 37) {
            handleLeftKey();
        }
        // right key.
        else if (e.keyCode == 39) {
            handleRightKey();
        }
        else if (e.keyCode == 32) {
            handleBuildKey();
        }
    }
    
    /*
     * Handle the "move left" key
     */
    void handleLeftKey () {
        //TODO: Implement me!
    }
    
    /*
     * Handle the "move right" key
     */
    void handleRightKey () {
        //TODO: Implement me!
    }
    
    /*
     * Handle the "build" key
     */
    void handleBuildKey () {
        //TODO: Implement me!
    }
}