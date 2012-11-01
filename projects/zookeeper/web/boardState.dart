library boardState;

/*
 * Represents the state of any given square in the board.
 * Probably doesn't need a class, but you never know what may be needed
 */
class BoardSquare {
    /*
     * 0: empty
     * 1: full
     * 3: full (replaced - draw partially)
     */
    int state;
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
        for (int i = 0; i < WIDTH; i++)
            board[i] = new List<BoardSquare>(HEIGHT);
    }
    
    void setSquareState(int x, int y, BoardSquare state) {
        board[x][y] = state;
    }
}