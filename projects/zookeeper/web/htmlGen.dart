library htmlGen;
import 'boardState.dart';
import 'dart:html';
import 'animals.dart';

/**
 * This is entirely temporary until we have actual UI
 */
class HtmlGen {
    genHtml(BoardState board, List<Animal> animals) {
        //WOO slowest possible html generator possible!
        List<String> html = new List();
        for (int x = 0; x < board.board.length; x++) {
            html.add("<tr>");
            for (int y = 0; y < board.board[x].length; y++) {
                html.add("<td id='$x.$y'>${board.board[x][y].state.toString()[0]}");
                for (int i = 0; i < animals.length; i++) {
                    if (animals[i].x == x && animals[i].y == y) {
                        html.add(" A$i");
                    }
                }
                html.add("</td>");
            }
            html.add("</tr>");
        }
        String htmlContent = '<table id="stuffGoesHere" border="1">'
            .concat(Strings.concatAll(html));
        query("#stuffGoesHere").replaceWith(new Element.html(htmlContent));
    }
}
