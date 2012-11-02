import 'boardState.dart';
import 'animals.dart';
import 'player.dart';
import 'htmlGen.dart';
import 'canvasState.dart';
import 'dart:html';
import 'dart:math';
import 'dart:isolate';

/**
 * Manages the game logic, starts timers, etc
 */
class GameManager {
    BoardState boardState = new BoardState();
    List<Animal> animals;
    Player player;
    CanvasState canvas;
    
    /*
     * Initialze game board and start timers
     */
    setupGame() {
        // create our player object.
        this.player = new Player(this.boardState);
        
        // create our canvas object.
        this.canvas = new CanvasState(document.query("#gameCanvas"));
        
        // Set up our keyboard event handlers.
        // keyDown! Not keyPress!
        document.on.keyDown.add(function(KeyboardEvent e) {
            this.canvas.drawBoardState(this.boardState, this.animals, this.player.handleKeyEvent(e));
        });
        
        // Generate the initial box field.
        genBoxField();
                
        // Create animals and setup a timer for them to run
        this.animals = new List<Animal>();
        for (int i = 0; i < 3; i++) {
            this.animals.add(new TheOneTheOnlyAnimal(boardState, i, 3));
        }
        Timer timer = new Timer.repeating(100, function(Timer timer) {
            this.animals.forEach(function(Animal animal) {
                this.canvas.drawBoardState(this.boardState, this.animals, animal.doMove(player));
            });
        });
        
        this.canvas.drawBoardState(this.boardState, this.animals, new UpdateCoordinates());
        // Example of how to draw only a portion of the map.
        //this.canvas.drawBoardState(this.boardState, this.animals, 30, 16, 2, 30);
    }
    
    genBoxField() {
        // Generate left and white portions of the board.
        int topLeftX = (boardState.WIDTH~/2) - (boardState.BLOCKS_WIDTH~/2);
        int topLeftY = (boardState.HEIGHT~/2) - (boardState.BLOCKS_HEIGHT~/2);
        for (int i = 0; i < boardState.BLOCKS_HEIGHT; i++) {
            boardState.board[topLeftX][topLeftY+i].state = true;
            boardState.board[topLeftX+boardState.BLOCKS_WIDTH][topLeftY+i].state = true;
        }
        for (int i = 0; i < boardState.BLOCKS_WIDTH; i++) {
            boardState.board[topLeftX+i][topLeftY].state = true;
            boardState.board[topLeftX+i][topLeftY+boardState.BLOCKS_HEIGHT].state = true;
        }
        boardState.board[(boardState.WIDTH - boardState.BLOCKS_WIDTH) ~/ 2 + boardState.BLOCKS_WIDTH]
                        [(boardState.HEIGHT - boardState.BLOCKS_HEIGHT) ~/ 2 + boardState.BLOCKS_HEIGHT].state = true;
    }
}

num rotatePos = 0;

void main() {
    GameManager manager = new GameManager();
    manager.setupGame();
    //new HtmlGen().genHtml(manager.boardState, manager.animals);
}