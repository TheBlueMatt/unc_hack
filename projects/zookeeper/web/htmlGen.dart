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
        for (int y = 0; y < board.HEIGHT; y++) {
            html.add("<tr>");
            for (int x = 0; x < board.WIDTH; x++) {
                html.add("<td id='$x.$y' style='width: 20px;background-color:${board.board[x][y].state ? "green" : "white"}'>${board.board[x][y].state.toString()[0]}");
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
