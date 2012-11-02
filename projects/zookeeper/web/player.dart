library player;
import 'boardState.dart';
import 'canvasState.dart';
import 'dart:html';
import 'dart:math';

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
    
    UpdateCoordinates handleKeyEvent(KeyboardEvent e) {
        int origX = this._state.getXPosition(this.location);
        int origY = this._state.getYPosition(this.location);
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
        //TODO jump key
        int newX = this._state.getXPosition(this.location);
        int newY = this._state.getYPosition(this.location);
        return new UpdateCoordinates((origX < newX ? origX : newX) - 1, (origY < newY ? origY : origY) -1,
            (origX - newX).abs()+2, (origY - newY).abs()+2);
    }
    
    /**
     * Handle the "move left" key
     */
    void handleLeftKey () {
        if (location < this._state.BLOCKS_WIDTH) {
            location -= 1;
            if (location == -1)
                location = locationSize-1;
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
            if (location == locationSize)
                location = 0;
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