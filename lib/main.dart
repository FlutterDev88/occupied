import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:occupied/common/my_dimens.dart';
import 'package:occupied/common/my_theme.dart';
import 'package:occupied/pages/page_start.dart';
import 'package:occupied/providers/provider_game.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [SystemUiOverlay.top],
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    MyDimens.init(context);
    MyTheme.init();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderGame()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Occupied',
        theme: MyTheme.theme,
        home: const PageStart(),
      ),
    );
  }
}

