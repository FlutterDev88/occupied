// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:occupied/common/my_colors.dart';
import 'package:occupied/common/my_dimens.dart';
import 'package:occupied/providers/provider_game.dart';
import 'package:provider/provider.dart';

class WidgetCell extends StatefulWidget {

  final int index;

  const WidgetCell({
    Key? key,
    required this.index,
  }): super(key: key);

  @override
  State<WidgetCell> createState() => _WidgetCellState();
}


class _WidgetCellState extends State<WidgetCell> {

  ProviderGame? _providerGame;
  int _index = 0;
  double _width = 0;
  double _height = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_providerGame != null) return;
    _providerGame = context.watch<ProviderGame>();
    _index = widget.index;
    _width = _providerGame!.cellW;
    _height = _providerGame!.cellH;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColors.grid,
          width: MyDimens.borderWidth2, 
        ),
      ),
      child: _buildContent(),
    );
  }


  Widget _buildContent() {
    return DragTarget<int>(
      builder: (context, candidateData, rejectedData) {
        return _buildDraggable();
      },
      onWillAccept: (data) {
        return _providerGame!.explodeIndex != data
            && !_providerGame!.cellFlags[_index];
      },
      onAccept: (data) {
        if (_providerGame!.explodeIndex == data) return;
        if (!_providerGame!.cellFlags[data]) return;
        _providerGame!.move(data, _index);
      },
    );
  }


  Widget _buildDraggable() {
    if (_providerGame!.explodeIndex == _index) {
      return Image.asset(
        'assets/explosion.png',
        width: _width,
        height: _height,
      );
    }
    if (!_providerGame!.cellFlags[_index]) {
      return SizedBox();
    }
    return Draggable<int>(
      data: _index,
      child: Image.asset(
        'assets/berry.png',
        width: _width,
        height: _height,
      ),
      childWhenDragging: SizedBox(),
      feedback: Image.asset(
        'assets/berry.png',
        width: _width,
        height: _height,
      ),
    );
  }

}
