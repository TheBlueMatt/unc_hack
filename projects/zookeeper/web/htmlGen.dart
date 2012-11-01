library htmlGen;
import 'boardState.dart';
import 'dart:html';

/**
 * This is entirely temporary until we have actual UI
 */
class HtmlGen {
    genHtml(BoardState board) {
        //WOO slowest possible html generator possible!
        List<String> html = new List();
        for (int x = 0; x < board.board.length; x++) {
            html.add("<tr>");
            for (int y = 0; y < board.board[x].length; y++) {
                if (board.board[x][y] == null) {
                    board.board[x][y] = new BoardSquare();
                    board.board[x][y].state = false;
                }
                html.add("<td id='$x.$y'>${board.board[x][y].state.toString()[0]}</td>");
            }
            html.add("</tr>");
        }
        String htmlContent = '<table id="stuffGoesHere" border="1">'
            .concat(Strings.concatAll(html));
        query("#stuffGoesHere").replaceWith(new Element.html(htmlContent));
    }
}
