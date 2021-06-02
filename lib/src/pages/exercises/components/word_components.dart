import 'package:flutter/material.dart';
import 'package:tfg_ione/src/widgets/myButton.dart';

class WordsComponent extends StatefulWidget {
  final List response;
  final List load;
  final incrementExercise;

  WordsComponent(
      {@required this.response,
      @required this.load,
      @required this.incrementExercise});

  @override
  _WordsComponentState createState() => _WordsComponentState();
}

class _WordsComponentState extends State<WordsComponent> {
  List<String> selectedWords = [];
  List<String> incorrectWords = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        children: [
          Container(
            width: size.width,
            margin: EdgeInsets.all(10),
            child: _responseContainer(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: size.width,
            height: 3,
            color: Colors.blue[200],
            child: Text(''),
          ),
          Container(
            width: size.width,
            margin: EdgeInsets.all(10),
            color: Colors.blue[50],
            child: _loadContainer(context),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: _checkButton(size),
          ),
        ],
      ),
    );
  }

  Widget _responseContainer() {
    List<Container> chips = [];

    chips = _generateChips(selectedWords);

    return Container(
      child: Wrap(
        children: chips,
      ),
    );
  }

  List<Container> _generateChips(List<String> words) {
    List<Container> chips = [];

    words.forEach((word) => chips.add(_chip(word)));

    return chips;
  }

  Widget _loadContainer(BuildContext context) {
    List<String> words = [];

    List<Container> chips = [];

    words = _deleteSelectedWords(widget.load);

    chips = _generateChips(words);

    return Container(
      height: 110,
      padding: EdgeInsets.all(5),
      child: Wrap(
        children: chips,
      ),
    );
  }

  List<String> _deleteSelectedWords(List words) {
    List<String> returnWords = [];

    words.forEach((w) => {if (!_wordIsSelected(w)) returnWords.add(w)});

    return returnWords;
  }

  Container _chip(String word) {
    Color backgroundColor = Colors.white;
    Color textColor = Colors.black;

    if (_wordIsIncorrect(word)) {
      backgroundColor = Colors.red;
      textColor = Colors.white;
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: () => _selectWords(word),
        child: Chip(
          backgroundColor: backgroundColor,
          shadowColor: Colors.black,
          elevation: 5,
          label: Text(
            word,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }

  void _selectWords(String word) {
    if (_wordIsSelected(word)) {
      selectedWords.removeWhere((w) => w == word);

      incorrectWords.removeWhere((w) => w == word);
    } else {
      selectedWords.add(word);
    }

    setState(() {});
  }

  bool _wordIsSelected(String word) {
    return (selectedWords.indexWhere((w) => w == word) != -1) ? true : false;
  }

  bool _wordIsIncorrect(String word) {
    return (incorrectWords.indexWhere((w) => w == word) != -1) ? true : false;
  }

  Widget _checkButton(Size size) {
    int colorNumber = 500;

    if (_disableButton()) colorNumber = 200;

    return GestureDetector(
      onTap: () => _validate(),
      child: MyButton(
        text: 'Comprobar',
        size: 0.6,
        icon: Icons.check,
        color: Colors.green[colorNumber],
      ),
    );
  }

  bool _disableButton() {
    return (selectedWords.length == widget.response.length) ? false : true;
  }

  void _validate() {
    for (var i = 0; i < widget.response.length; i++) {
      if (selectedWords[i] != widget.response[i])
        incorrectWords.add(selectedWords[i]);
    }

    if (incorrectWords.length == 0) {
      _reset();
      
      widget.incrementExercise();
    }

    setState(() {});
  }

  void _reset() {
    selectedWords = [];
    incorrectWords = [];
  }
}
