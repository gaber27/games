import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> _games = [
    "Tic Tac Toe",
    "Don Don Ziki",
    "Racing",
    "Tapping Game",
    'Spin Wheel'
  ];
  final List<int> _players = [2, 1, 2, 2,1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          sliverAppBar(context),
          sliverList(),
        ],
      ),
    );
  }

  SliverAppBar sliverAppBar(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: MediaQuery.of(context).size.height * 0.3,
      centerTitle: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        title: GradientText(
          'Games',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.1,
            fontWeight: FontWeight.bold,
          ),
          colors: const <Color>[
            Colors.blue,
            Colors.deepOrange,
          ],
        ),
        centerTitle: true,
        background: Image.asset(
          "./assets/games.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  SliverList sliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(
              MediaQuery.of(context).size.width * 0.02,
            ),
            child: ListTile(
              title: Text(
                _games[index],
                style: TextStyle(
                  color: Colors.green,
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Row(
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Text(
                    "${_players[index]} Player",
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.orange,
              ),
              onTap: () {
                Navigator.pushNamed(context, _games[index]);
              },
            ),
          );
        },
        childCount: _games.length,
      ),
    );
  }
}
