library player;
import 'boardState.dart';
import 'dart:html';

/*
 * Keeps track of the player
 */
class Player {
    BoardState _state;
    // Starts top left goes clockwise
    int location;
    // The max value + 1 of location
    int locationSize;
    
    // The height of the player (ie starts at 0, grows/decreases after jump)
    int height;
    // Whether we are going up or falling back down
    bool goingUp;
    
    Player(BoardState state) {
        this._state = state;
        // Start in the middle of the top bar
        this.location = state.BLOCKS_WIDTH ~/ 2;
        this.locationSize = 2*state.BLOCKS_HEIGHT + 2*state.BLOCKS_WIDTH;
        // Start on the blocks
        this.height = 0;
        this.goingUp = true;
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
        // up key.
        else if (e.keyCode == 38) {
            handleUpKey();
        }
        // down key.
        else if (e.keyCode == 40) {
            handleDownKey();
        }
        // space/build key.
        else if (e.keyCode == 32) {
            handleBuildKey();
        }
    }
    
    /**
     * Handle the "move left" key
     */
    void handleLeftKey () {
        if (location < this._state.BLOCKS_WIDTH) {
            location -= 1;
        } else if (location >= this._state.BLOCKS_WIDTH + this._state.BLOCKS_HEIGHT && location < 2*this._state.BLOCKS_WIDTH + this._state.BLOCKS_HEIGHT) {
            location += 1;
        }
    }
    
    /**
     * Handle the "move right" key
     */
    void handleRightKey () {
        if (location < this._state.BLOCKS_WIDTH) {
            location += 1;
        } else if (location >= this._state.BLOCKS_WIDTH + this._state.BLOCKS_HEIGHT && location < 2*this._state.BLOCKS_WIDTH + this._state.BLOCKS_HEIGHT) {
            location -= 1;
        }
    }
    
    /**
     * Handle the "move up" key
     */
    void handleUpKey () {
        if (location >= this._state.BLOCKS_WIDTH && location < this._state.BLOCKS_WIDTH + this._state.BLOCKS_HEIGHT) {
            location -= 1;
        } else if (location >= 2*this._state.BLOCKS_WIDTH + this._state.BLOCKS_HEIGHT) {
            location += 1;
        }
    }
    
    /**
     * Handle the "move down" key
     */
    void handleDownKey () {
        if (location >= this._state.BLOCKS_WIDTH && location < this._state.BLOCKS_WIDTH + this._state.BLOCKS_HEIGHT) {
            location += 1;
        } else if (location >= 2*this._state.BLOCKS_WIDTH + this._state.BLOCKS_HEIGHT) {
            location -= 1;
        }
    }
    
    /**
     * Handle the "build" key
     */
    void handleBuildKey () {
        //TODO: Implement me!
    }
    
    /**
     * Handle the "jump" key
     */
    void handleJumpKey() {
        //TODO: Implement me!
    }
}