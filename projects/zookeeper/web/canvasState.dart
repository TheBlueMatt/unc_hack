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

    CanvasElement canvas1;
    CanvasElement canvas2;
    CanvasRenderingContext2D ctx1;
    CanvasRenderingContext2D ctx2;
  
    CanvasState (canvas1, canvas2) {
        this.ctx1 = canvas1.getContext("2d");
        this.ctx2 = canvas2.getContext("2d");
    }
    
    void drawBlock1(x, y, color, [opacity=true]) {
        //this.ctx1.globalAlpha = (opacity) ? (0) : (1);
        this.ctx1.fillStyle = color;
        this.ctx1.fillRect(x*6, y*3, 6, 3);
        this.ctx1.globalAlpha = 1;
    }
    
    void drawBlock2(x, y, color, [opacity=true]) {
      this.ctx1.globalAlpha = (opacity) ? (0) : (1);
      this.ctx2.fillStyle = color;
      this.ctx2.fillRect(x*6, y*3, 7, 7);
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
    void drawBoardState(BoardState boardState, Player player, List<Animal> animals, UpdateCoordinates coordinates) {
        if (coordinates.boxHeight == -1) {
            // if boxHeight is -1, then that means boxWidth is still -1.
            coordinates.boxWidth = boardState.board.length;
            coordinates.boxHeight = boardState.board[0].length;
        }

        // clear the second context.
        this.ctx2.clearRect(0, 0, 1000, 500);
        
        // Draw the animals.
        for (int i = 0; i < animals.length; i++) {
            this.drawBlock2(animals[i].getX(), animals[i].getY(), "#ff0000");
        }
        
        // Draw the player!
        this.drawBlock2(boardState.getXPosition(player.location), boardState.getYPosition(player.location), "#0000ff");

        
        for (int x = coordinates.offsetX; x < coordinates.offsetX + coordinates.boxWidth; x++) {
            for (int y = coordinates.offsetY; y < coordinates.offsetY + coordinates.boxHeight; y++) {
                if (boardState.board[x][y].state) {
                    this.drawBlock1(x, y, "#000000");
                }
                else {
                    this.drawBlock1(x, y, "#ffffff", true);
                }
            }
        }
    }
}
