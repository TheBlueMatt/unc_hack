library boardState;

/*
 * Represents the state of any given square in the board.
 * Probably doesn't need a class, but you never know what may be needed
 */
class BoardSquare {
    bool state;
    BoardSquare() {
        this.state = false;
    }
}

/*
 * State of the board - mostly just a matrix of BoardSquares
 */
class BoardState {
    const int WIDTH = 120, HEIGHT = 60;
    const int BLOCKS_WIDTH = 60, BLOCKS_HEIGHT = 30;
    
    List<List<BoardSquare>> board;
    
    BoardState() {
        board = new List<List<BoardSquare>>(WIDTH);
        for (int x = 0; x < WIDTH; x++) {
            board[x] = new List<BoardSquare>(HEIGHT);
            for (int y = 0; y < HEIGHT; y++) {
                board[x][y] = new BoardSquare();
            }
        }
    }
    
    void setSquareState(int x, int y, BoardSquare state) {
        board[x][y] = state;
    }
    
    // Helper functions for examining board state
    /** true if the given point is outside of the blocks area
     */
    bool isOutisideOfBlocksArea(int x, int y) {
        return x < (WIDTH - BLOCKS_WIDTH) / 2 ||
            x > (WIDTH - BLOCKS_WIDTH) / 2 + BLOCKS_WIDTH ||
            y < (HEIGHT - BLOCKS_HEIGHT) / 2 ||
            y > (HEIGHT - BLOCKS_HEIGHT) / 2 + BLOCKS_HEIGHT;
    }
}