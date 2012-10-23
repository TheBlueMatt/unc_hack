import 'boardState.dart';
import 'animals.dart';
import 'player.dart';
import 'htmlGen.dart';
import 'dart:html';

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
    }
}

num rotatePos = 0;

void main() {
    GameManager manager = new GameManager();
    manager.setupGame();
    new HtmlGen().genHtml(manager.boardState);
}