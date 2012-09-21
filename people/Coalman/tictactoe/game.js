// these control the width and height of the board
// could be changed to be instance variables in the Game object
var width = 3;
var height = 3;

var Marks = 
{
	Empty : " ",
	X : "X",
	O : "O"
};
var Players = 
{
	X : {
		name : "Player X",
		mark : Marks.X,
		winningTxt : "Player X Wins!"
	},
	O : {
		name : "Player O",
		mark : Marks.O,
		winningTxt : "Player O Wins!"
	},
	None : {
		name : "None",
		mark : Marks.Empty,
		winningTxt : "It's a tie!"
	}
};

function Game (type)
{
	this.type = type;
	this.currentPlayer = Players.X;
	this.alive = true;
	this.rows = genBoard();
	this.winner = Players.None;
	// reset event handler
	this.onReset = function() { };
	
	this.tryMove = tryMove;
	this.reset = reset;
}

function genBoard()
{
	var cells = [];
	
	for (var r = 0; r < width; r++)
	{
		var row = [];
		for (var c = 0; c < height; c++)
		{
			row[c] = {
				mark : Marks.Empty,
				x : c,
				y : r
			};
		}
		cells[r] = row;
	}
	
	return cells;
}

function tryMove(cell)
{
	if (!this.alive)
	{
		this.reset();
		this.alive = true;
	}
	
	if (cell.mark == Marks.Empty)
	{
		// we will make the move
		cell.mark = this.currentPlayer.mark;
		if (this.currentPlayer == Players.X)
		{
			this.currentPlayer = Players.O;
		}
		else
		{
			this.currentPlayer = Players.X;
		}
		checkWinCondition(this);
	}
}

function checkWinCondition(game)
{
	for (var row = 0; row < height; row++)
	{
		checkDir(game, [row, 0], [0, 1]);
	}
	for (var column = 0; column < width; column++)
	{
		checkDir(game, [0, column], [1, 0]);
	}
	checkDir(game, [0, 0], [1, 1]);
	checkDir(game, [0, width - 1], [1, -1]);
	
	if (game.alive)
	{
		var someEmpty = false;
		// look if there are anly available moves left
		for (var r = 0; r < height && !someEmpty; r++)
		{
			for (var c = 0; c < width && !someEmpty; c++)
			{
				someEmpty = someEmpty || (game.rows[r][c].mark == Marks.Empty);
			}
		}
		if (!someEmpty)
		{
			game.alive = false;
			game.winner = Players.None;
		}
	}
}
function checkDir(game, start, dir)
{
	token = game.rows[start[0]][start[1]].mark;
	while (start[0] >= 0 && start[0] < height &&
		start[1] >= 0 && start[1] < width)
	{	
		if (game.rows[start[0]][start[1]].mark != token)
		{
			return false;
		}
		start[0] = start[0] + dir[0];
		start[1] = start[1] + dir[1];
	}
	if (token != Marks.Empty)
	{
		game.alive = false;
		if (token == Marks.X)
		{
			game.winner = Players.X;
		}
		else
		{
			game.winner = Players.O;
		}
		return true;
	}
	return false;
}

function reset()
{
	this.alive = true;
	this.currentPlayer = Players.X;
	for (var r = 0; r < height; r++)
	{
		for (var c = 0; c < width; c++)
		{
			console.log(r + "," + c);
			this.rows[r][c].mark = Marks.Empty;
		}
	}
	this.onReset();
}