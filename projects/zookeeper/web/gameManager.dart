import 'boardState.dart';
import 'animals.dart';
import 'player.dart';

/**
 * Manages the game logic, starts timers, etc
 */
class GameManager {
    BoardState boardState = new BoardState();
    List<Animal> animals;
    
    /*
     * Initialze game board and start timers
     */
    setupGame() {
        // TODO: Implement me!
    }
}

num rotatePos = 0;

void main() {
    GameManager manager = new GameManager();
    manager.setupGame();
}