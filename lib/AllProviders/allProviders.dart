import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stm/countermanager.dart';
import 'package:stm/models/countermodel.dart';

final TitleProvider = Provider<String>(
  (ref) {
    return "Riverpod Basics";
  },
);
final Title2Provider = Provider<String>(
  (ref) {
    return "Riverpod State Notifier Usage";
  },
);
final TextProvider = Provider<String>(
  (ref) {
    return "Pressed this many times";
  },
);

final CounterStateProvider = StateProvider<int>(
  (ref) {
    //var title = ref.watch(TitleProvider);
    return 0;
  },
);

final CounterNotifiterProvider =
    StateNotifierProvider<CounterNotifier, CounterModel>(
  (ref) {
    return CounterNotifier();
  },
);

final oddevenProvider = Provider<bool>((ref) {
  var CounterModel = ref.watch(CounterNotifiterProvider);
//   if(CounterModel.counter%2 == 0){
// return true;
//   }
//   else return false;
  return CounterModel.counter % 2 == 0 ? true : false;
});
