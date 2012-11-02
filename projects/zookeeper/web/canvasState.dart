library canvasState;

import 'dart:html';
import 'boardState.dart';
import 'animals.dart';
import 'player.dart';

/**
 * Update coordinates for drawBoardState (see comment at drawBoardState)
 */
class UpdateCoordinates {
    int offsetX, offsetY, boxWidth, boxHeight;
    UpdateCoordinates([int offsetX = 0, int offsetY = 0, int boxWidth = -1, int boxHeight = -1]) {
        this.offsetX = offsetX;
        this.offsetY = offsetY;
        this.boxWidth = boxWidth;
        this.boxHeight = boxHeight;
    }
}

class CanvasState {

    CanvasElement canvas;
    CanvasRenderingContext2D ctx;
    int width;
    int height;
  
    CanvasState (canvas) {
        this.width = canvas.width;
        this.height = canvas.height;
        this.ctx = canvas.getContext("2d");
    }
    
    drawBlock(x, y, color) {
        this.ctx.fillStyle = color;
        this.ctx.fillRect(x, y, 10, 10);
    }
    
    /** 
     * The box{Height,Width} vars are -1 by default, b/c I can't
     * access the board height and width here (I'm not adding a member
     * variable 'boardState' b/c I want to keep the two separate).
     * 
     * Parameter description:
     *     offsetX: Offset (in single board tiles) in width.
     *     offsetY: Offset (in single board tiles) in height.
     *     boxWidth: Width (in single board tiles) of map portion to draw.
     *     boxHeight: Height (in single board tiles) of map portion to draw.
     */
    drawBoardState(BoardState boardState, Player player, List<Animal> animals, UpdateCoordinates coordinates) {
        if (coordinates.boxHeight == -1) {
            // if boxHeight is -1, then that means boxWidth is still -1.
            coordinates.boxWidth = boardState.board.length;
            coordinates.boxHeight = boardState.board[0].length;
        }
        for (int x = coordinates.offsetX; x < coordinates.offsetX + coordinates.boxWidth; x++) {
            for (int y = coordinates.offsetY; y < coordinates.offsetY + coordinates.boxHeight; y++) {
                if (boardState.board[x][y].state) {
                    this.drawBlock(x*10, y*10, "#000000");
                }
            }
        }
        // Draw the animals.
        for (int i = 0; i < animals.length; i++) {
            this.drawBlock(animals[i].getX()*10, animals[i].getY()*10, "#ff0000");
        }
        
        // Draw the player!
        this.drawBlock(boardState.getXPosition(player.location)*10, boardState.getYPosition(player.location), "#0000ff");
    }
}
