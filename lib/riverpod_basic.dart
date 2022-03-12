import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'AllProviders/allProviders.dart';

class RiverpodBasics extends StatelessWidget {
  const RiverpodBasics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Consumer(
            builder: (context, ref, child) {
              var title = ref.watch(TitleProvider);
              return Text(title);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyCounterText(),
              MyText(),
            ],
          ),
        ),
        floatingActionButton: MyButton());
  }
}

class MyText extends ConsumerWidget {
  const MyText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(ref.watch(TextProvider));
  }
}

class MyButton extends ConsumerWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(CounterStateProvider.state).state++;
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class MyCounterText extends ConsumerWidget {
  const MyCounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counter = ref.watch(CounterStateProvider);
    return Text(
      counter.toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
