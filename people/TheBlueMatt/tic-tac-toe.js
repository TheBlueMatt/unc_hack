var next = "X";
var done = false;
var widthheight = 3;

function won(who) {
	alert(who + " Won!");
	done = true;
}

function clickHandler(event) {
	if (!done && event.currentTarget.innerHTML == "") {
		event.currentTarget.innerHTML = next;
		var x = event.currentTarget.id[0];
		var y = event.currentTarget.id[1];

		// Really bad win checker
		var didWin = true;
		for (var row = 0; row < widthheight; row++) {
			if ($("#"+x+row).html() != next) {
				didWin = false;
				break;
			}
		}
		if (didWin)
			won(next);
		else {
			didWin = true;
			for (var col = 0; col < widthheight; col++) {
				if ($("#"+col+y).html() != next) {
					didWin = false;
					break;
				}
			}
			if (didWin)
				won(next);
			else {
				didWin = true;
				if (x == y) {
					for (var i = 0; i < widthheight; i++) {
						if ($("#"+i+i).html() != next) {
							didWin = false;
							break;
						}
					}
					if (didWin)
						won(next);
				} else if (x == widthheight - y - 1) {
					for (var i = 0; i < widthheight; i++) {
						if ($("#"+i+(widthheight-i-1)).html() != next) {
							didWin = false;
							break;
						}
					}
					if (didWin)
						won(next);
				}
			}
		}

		if (next == "X")
			next = "O";
		else if (next == "O")
			next = "X";
	}
};

$(document).ready(function() {
	var table = $("<table style='border: none;'>");

	for (var i = 0; i < widthheight; i++) {
		var row = $("<tr>");
		for (var n = 0; n < widthheight; n++) {
			row.append('<td id="' + i + n + '"></td>');
		}
		row.append("</tr>");
		table.append(row);
	}
	table.append("</table>");
	$(document.body).append(table);

	$('td').click(clickHandler);
});
