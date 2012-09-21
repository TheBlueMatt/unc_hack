console.log("Loaded view script.");

// the game model
var game = new Game();
game.onReset = function() { refreshView(true); };
$(document).ready(setup);

function setup()
{
	// setup the game and tie the view to the model
	generateBoardView();
	$("#resetBtn").click(onResetClicked);
}

function generateBoardView()
{
	var tableElement = $("<table></table>");
	
	for (var r = 0; r < height; r++)
	{
		var row = game.rows[r];
		var rowElement = $("<tr></tr>");
		for (var c = 0; c < width; c++)
		{
			var cell = row[c];
			var cellElement = $("<td></td>");
			
			cellElement.click(onCellClicked);
			cellElement.data("cell", cell);
			
			rowElement.append(cellElement);
		}
		tableElement.append(rowElement);
	}
	
	$("#boardDiv").append(tableElement);
}

function onCellClicked(event)
{
	console.log("A cell was clicked.");
	var cell = $(event.srcElement).data("cell");
	
	// tell the model
	game.tryMove(cell);
	// update the view
	event.srcElement.innerHTML = cell.mark;
	refreshView(false);
}
function onResetClicked()
{
	console.log("Reset button was clicked.");
	game.reset();
}

function refreshView(full)
{
	if (full)
	{
		// also refresh grid
		$("td").each(function (index, element) {
			var e = $(element);
			element.innerHTML = e.data("cell").mark;
		});
	}

	if (game.alive)
	{
		$("#statusTxt").text("It is " + game.currentPlayer.name + "'s turn.");
	}
	else
	{
		$("#statusTxt").text(game.winner.winningTxt);
	}
}