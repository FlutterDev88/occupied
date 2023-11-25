// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:occupied/common/my_dimens.dart';
import 'package:occupied/common/my_theme.dart';
import 'package:occupied/pages/page_home.dart';
import 'package:occupied/providers/provider_game.dart';
import 'package:provider/provider.dart';

class PageStart extends StatefulWidget {
  const PageStart({Key? key}): super(key: key);

  @override
  State<PageStart> createState() => _PageStartState();
}


class _PageStartState extends State<PageStart> {

  ProviderGame? _providerGame;
  late TextTheme _textTheme;

  int _countPieces = 1;


  @override
  void initState() {
    super.initState();
    _textTheme = MyTheme.textTheme;
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_providerGame != null) return;
    _providerGame = context.read<ProviderGame>();
    _providerGame!.initDimens();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  size: MyDimens.iconSize10,
                ),
                iconSize: MyDimens.iconSize10,
                onPressed: _onTapInc,
              ),
              Text(
                _countPieces.toString(),
                style: _textTheme.headlineLarge,
              ),
              IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: MyDimens.iconSize10,
                ),
                iconSize: MyDimens.iconSize10,
                onPressed: _onTapDec,
              ),
              SizedBox(height: MyDimens.padding10),
              ElevatedButton(
                child: Padding(
                  padding: EdgeInsets.all(MyDimens.padding1),
                  child: Text(
                    'START',
                    style: _textTheme.titleLarge,
                  ),
                ),
                onPressed: _onTapStart,
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _onTapInc() {
    if (_countPieces >= 25) return;
    setState(() => _countPieces++);
  }


  void _onTapDec() {
    if (_countPieces <= 1) return;
    setState(() => _countPieces--);
  }


  void _onTapStart() {
    _providerGame!.countPieces = _countPieces;
    _providerGame!.initCells(_countPieces);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const PageHome(),
        //builder: (_) => const PageGame(),
      ),
    );
  }

}
