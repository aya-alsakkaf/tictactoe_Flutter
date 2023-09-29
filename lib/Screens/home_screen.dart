import 'package:flutter/material.dart';
import 'package:tictactoe/Constants/colors.dart';
import '../components/scoreGrid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> board = List<String>.generate(9, (index) => '');
  bool _oTurn = true;
  bool winner = false;
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  String winnerAnnoucement = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              _oTurn ? "O Turn!" : "X Turn!",
              style: TextStyle(
                  color: annouceColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            ScoreGrid(oScore: oScore, xScore: xScore), //Building the Score Grid
            Expanded(
                //Building the game tiles
                flex: 3,
                child: GridView.builder(
                physics: NeverScrollableScrollPhysics(), //Locks the scroll
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      //places the X or O when player plays
                      onTap: () {
                        if (!winner) {
                          _tapped(index);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.white, width: 3),
                              left: BorderSide(color: Colors.white, width: 3)),
                        ),
                        child: Center(
                          child: Text(
                            board[index],
                            style: TextStyle(fontSize: 64, color: xOColors),
                          ),
                        ),
                      ),
                    );
                  },
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( //annoucing the winner
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    winnerAnnoucement,
                    style: TextStyle(fontSize: 34, color: annouceColor),
                  ),
                ),
                Container( //clearning the board to play again
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _clearBoard();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                    ),
                    label: Text(
                      'Play Again',
                      style: TextStyle(
                          color: xOColors,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    icon: Icon(
                      Icons.replay_circle_filled_rounded,
                      color: Colors.green,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() { //placing the X or O on the screen based on where the user taps
      if (_oTurn && board[index] == '') {
        board[index] = 'O';
        filledBoxes++;
      } else if (!_oTurn && board[index] == '') {
        board[index] = 'X';
        filledBoxes++;
      }
      _oTurn = !_oTurn;
      _checkwinnerAnnoucement();
    });
  }

  //Game winning logic 
  void _checkwinnerAnnoucement() {
    var player = '';

    //Check first row
    if (board[0] != '' && board[0] == board[1] && board[0] == board[2]) {
      setState(() {
        player = board.elementAt(0);
        winnerAnnoucement = "Player $player Wins! ";
        _updateScore(player);
      });
    }

    //Check Second Row
    if (board[3] != '' && board[3] == board[4] && board[3] == board[5]) {
      setState(() {
        player = board.elementAt(3);
        winnerAnnoucement = "Player $player Wins! ";
        _updateScore(player);
      });
    }

    //Check Third Row
    if (board[6] != '' && board[6] == board[7] && board[6] == board[8]) {
      setState(() {
        player = board.elementAt(6);
        winnerAnnoucement = "Player $player Wins! ";
        _updateScore(player);
      });
    }

    //Check first Columns
    if (board[0] != '' && board[0] == board[3] && board[0] == board[6]) {
      setState(() {
        player = board.elementAt(0);
        winnerAnnoucement = "Player $player Wins! ";
        _updateScore(player);
      });
    }

    //Check second column
    if (board[1] != '' && board[1] == board[4] && board[1] == board[7]) {
      setState(() {
        player = board.elementAt(1);
        winnerAnnoucement = "Player $player Wins! ";
      });
    }

    //check third column
    if (board[2] != '' && board[2] == board[5] && board[2] == board[8]) {
      setState(() {
        player = board.elementAt(2);
        winnerAnnoucement = "Player $player Wins! ";
        _updateScore(player);
      });
    }

    //check for first diagnoal
    if (board[0] != '' && board[0] == board[4] && board[0] == board[8]) {
      setState(() {
        player = board.elementAt(0);
        winnerAnnoucement = "Player $player Wins! ";
        _updateScore(player);
      });
    }

    //check for second diagonal
    if (board[2] != '' && board[2] == board[4] && board[2] == board[6]) {
      setState(() {
        player = board.elementAt(2);
        winnerAnnoucement = "Player $player Wins! ";
        _updateScore(player);
      });
    }

    if (filledBoxes == 9 && winner == false) {
      setState(() {
        winnerAnnoucement = "It's a Tie! No one wins";
      });
    }
  }
  _updateScore(String player) {
    if (player == 'O') {
      oScore++;
    } else {
      xScore++;
    }
    winner = true;
  }

  _clearBoard() {
    List<String> b = ['', '', '', '', '', '', '', '', ''];
    setState(() {
      board.replaceRange(0, 8, b);
      winnerAnnoucement = '';
    });
    filledBoxes = 0;
    winner = false;
    _oTurn = true;
  }
}
