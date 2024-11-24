import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Клас для зберігання значень RGB
class ColorConfig with ChangeNotifier {
  double red = 0.0;
  double green = 0.0;
  double blue = 0.0;

  // Методи для зміни значень
  void setRed(double value) {
    red = value;
    notifyListeners();
  }

  void setGreen(double value) {
    green = value;
    notifyListeners();
  }

  void setBlue(double value) {
    blue = value;
    notifyListeners();
  }

  // Повертаємо колір у форматі RGB
  Color get color => Color.fromRGBO(red.toInt(), green.toInt(), blue.toInt(), 1.0);
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorConfig(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorConfigurator(),
    );
  }
}

class ColorConfigurator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RGB Color Configurator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Секція з слайдерами для RGB
            Column(
              children: [
                Text('Red'),
                Slider(
                  value: context.watch<ColorConfig>().red,
                  min: 0.0,
                  max: 255.0,
                  onChanged: (value) {
                    context.read<ColorConfig>().setRed(value);
                  },
                ),
                Text('Green'),
                Slider(
                  value: context.watch<ColorConfig>().green,
                  min: 0.0,
                  max: 255.0,
                  onChanged: (value) {
                    context.read<ColorConfig>().setGreen(value);
                  },
                ),
                Text('Blue'),
                Slider(
                  value: context.watch<ColorConfig>().blue,
                  min: 0.0,
                  max: 255.0,
                  onChanged: (value) {
                    context.read<ColorConfig>().setBlue(value);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Consumer<ColorConfig>(
              builder: (context, colorConfig, child) {
                return Container(
                  width: 200,
                  height: 200,
                  color: colorConfig.color,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
