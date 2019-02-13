import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListDemo extends StatelessWidget {
  static const String routeName = "/myapp";

  @override
  Widget build(BuildContext context) {
    return RandomWords();
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {

  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>(); // 新增本行
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
//    return new Text(new WordPair.random().asPascalCase);
    return new Scaffold ( // 代码从这里...
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute<void>(
        builder: (BuildContext context)
    {
      final Iterable<ListTile> tiles = _saved.map(
              (WordPair pair) {
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          }
      );

      final List<Widget> divided = ListTile
          .divideTiles(
        context: context,
        tiles: tiles,
      )
          .toList();

      return new Scaffold(
        appBar: new AppBar(
          title: const Text("Saved Suggestions"),
        ),
        body: new ListView(children: divided,),
      );
    }
    )
    ,
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair); // 新增本行
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),

        // 对于每个建议的单词对都会调用一次 itemBuilder，
        // 然后将单词对添加到 ListTile 行中
        // 在偶数行，该函数会为单词对添加一个 ListTile row.
        // 在奇数行，该行书湖添加一个分割线 widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。

        itemBuilder: (BuildContext _context, int i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) {
            return new Divider();
          }

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整）
          // 比如 i 为：1, 2, 3, 4, 5 时，结果为 0, 1, 1, 2, 2，
          // 这可以计算出 ListView 中减去分隔线后的实际单词对数量
          final int index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

}