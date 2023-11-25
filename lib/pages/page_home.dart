import 'package:flutter/material.dart';
import 'package:occupied/common/my_colors.dart';
import 'package:occupied/common/my_dimens.dart';
import 'package:occupied/common/my_theme.dart';
import 'package:occupied/components/widget_cell.dart';
import 'package:occupied/providers/provider_game.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}): super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}


class _PageHomeState extends State<PageHome> {
  ProviderGame? _providerGame;

  late TextTheme _textTheme;

  @override
  void initState() {
    super.initState();
    _textTheme = MyTheme.textTheme;
  }


  @override
  void dispose() {
    _providerGame!.stop();
    _providerGame!.onEnd = null;
    super.dispose();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_providerGame != null) return;
    _providerGame = context.watch<ProviderGame>();
    _providerGame!.start();
    _providerGame!.onEnd = _onEnd;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildTitle(),
          _buildGrid(),
          _buildTimeCount(),
          _buildMineTimer(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapFloating,
        tooltip: 'REFRESH',
        child: const Icon(Icons.refresh),
      ),
    );
  }


  Widget _buildTitle() {
    return Positioned(
      left: (MyDimens.screenWidth - MyDimens.iconSize10 * 3) / 2,
      top: MyDimens.padding2,
      width: MyDimens.iconSize10 * 3,
      height: MyDimens.iconSize10,
      child: Center(
        child: Text(
          'Keep your strawberries alive from the bomb',
          maxLines: 2,
          textAlign: TextAlign.center,
          style: _textTheme.labelMedium,
        ),
      ),
    );
  }


  Widget _buildGrid() {
    return Positioned(
      top: _providerGame!.gridY,
      left: _providerGame!.gridX,
      width: _providerGame!.gridW,
      height: _providerGame!.gridH,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.grid,
            width: MyDimens.borderWidth2, 
          ),
          borderRadius: MyDimens.borderRadius1,
        ),
        child: GridView.count(
          crossAxisCount: 5,
          children: List.generate(
            25,
            (index) => WidgetCell(
              index: index,
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildTimeCount() {
    int seconds = _providerGame!.countTime ~/ _providerGame!.periodDiv;
    return Positioned(
      left: (MyDimens.screenWidth - MyDimens.iconSize10 * 3) / 2,
      bottom: MyDimens.padding5 * 3,
      width: MyDimens.iconSize10 * 3,
      height: MyDimens.iconSize10,
      child: Center(
        child: Text(
          '$seconds s',
          style: _textTheme.titleLarge,
        ),
      ),
    );
  }


  Widget _buildMineTimer() {
    return Positioned(
      left: (MyDimens.screenWidth - MyDimens.iconSize10) / 2,
      bottom: MyDimens.padding6,
      width: MyDimens.iconSize10,
      height: MyDimens.iconSize10,
      child: CircularPercentIndicator(
        radius: MyDimens.iconSize5,
        lineWidth: MyDimens.borderWidth6,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: MyColors.progress,
        percent: (_providerGame!.countTime % _providerGame!.periodSteps + 1)
            / _providerGame!.periodSteps,
        center: Image.asset(
          _providerGame!.explodeIndex >= 0
            ? 'assets/explosion.png'
            : 'assets/mine.png',
          width: MyDimens.iconSize6,
          height: MyDimens.iconSize6,
        ),
      ),
    );
  }


  void _onTapFloating() {
    Navigator.pop(context);
  }


  void _onEnd() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'CONGRATULATION!',
          style: _textTheme.bodyMedium!.copyWith(
            color: MyColors.button,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Your Score : ${_providerGame!.countTime ~/ _providerGame!.periodDiv}s',
          style: _textTheme.bodyLarge!.copyWith(
            color: MyColors.black,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Container(
                  color: MyColors.button,
                  padding: EdgeInsets.symmetric(
                    horizontal: MyDimens.padding5,
                    vertical: MyDimens.padding1,
                  ),
                  child: const Text('OK'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
