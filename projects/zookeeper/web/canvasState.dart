library canvasState;

import 'dart:html';
import 'boardState.dart';

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
    
    // The box{Height,Width} vars are -1 by default, b/c I can't
    // access the board height and width here (I'm not adding a member
    // variable 'boardState' b/c I want to keep the two separate).
    // 
    // Parameter description:
    //     offsetX: Offset (in single board tiles) in width.
    //     offsetY: Offset (in single board tiles) in height.
    //     boxWidth: Width (in single board tiles) of map portion to draw.
    //     boxHeight: Height (in single board tiles) of map portion to draw.
    drawBoardState(BoardState boardState, List animals, [int offsetX = 0, int offsetY = 0, int boxWidth = -1, int boxHeight = -1]) {
        if (boxHeight == -1) {
            // if boxHeight is -1, then that means boxWidth is still -1.
            boxWidth = boardState.board.length;
            boxHeight = boardState.board[0].length;
        }
        for (int x = offsetX; x < offsetX+boxWidth; x++) {
            for (int y = offsetY; y < offsetY+boxHeight; y++) {
                if (boardState.board[x][y].state) {
                    this.drawBlock(x*10, y*10, "#000000");
                }
            }
        }
        // Draw the animals.
        for (int i = 0; i < animals.length; i++) {
            this.drawBlock(animals[i].x*10, animals[i].y*10, "#ff0000");
        }
    }
}
