import 'boardState.dart';
import 'animals.dart';
import 'player.dart';
import 'htmlGen.dart';
import 'dart:html';
import 'dart:math';

/**
 * Manages the game logic, starts timers, etc
 */
class GameManager {
    BoardState boardState = new BoardState();
    List<Animal> animals;
    Player player;
    
    /*
     * Initialze game board and start timers
     */
    setupGame() {
        // create our player object.
        this.player = new Player(this.boardState);
        
        // Set up our keyboard event handlers.
        // keyDown! Not keyPress!
        document.on.keyDown.add(this.player.handleKeyEvent);
        
        // Generate the initial box field.
        genBoxField();
    }
    
    genBoxField() {
        // Generate left and white portions of the board.
        int topLeftX = (boardState.WIDTH~/2) - (boardState.BLOCKS_WIDTH~/2);
        int topLeftY = (boardState.HEIGHT~/2) - (boardState.BLOCKS_HEIGHT~/2);
        for (int i = 0; i < boardState.BLOCKS_HEIGHT; i++) {
            BoardSquare bs = new BoardSquare();
            bs.state = 1;
            boardState.board[topLeftX][topLeftY+i] = bs;
            boardState.board[topLeftX+boardState.BLOCKS_WIDTH-1][topLeftY+i] = bs;
        }
        
        for (int i = 0; i < boardState.BLOCKS_WIDTH; i++) {
            BoardSquare bs = new BoardSquare();
            bs.state = 1;
            boardState.board[topLeftX+i][topLeftY] = bs;
            boardState.board[topLeftX+i][topLeftY+boardState.BLOCKS_HEIGHT-1] = bs;
        }
    }
}

num rotatePos = 0;

void main() {
    GameManager manager = new GameManager();
    manager.setupGame();
    new HtmlGen().genHtml(manager.boardState);
}