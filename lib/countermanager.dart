import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stm/models/countermodel.dart';


class CounterNotifier extends StateNotifier<CounterModel> {
  CounterNotifier() : super(CounterModel(0));

  void Increment() {
    state = CounterModel(state.counter + 1);
  }

  void Decrement() {
    state = CounterModel(state.counter - 1);
  }
}
