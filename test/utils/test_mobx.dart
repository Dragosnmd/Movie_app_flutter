import 'dart:async';
import 'package:mobx/mobx.dart';

Future<T> asyncValue<T>(T Function(Reaction) fn,
    [int timeoutMillis = 3000]) async {
  final completer = Completer<T>();
  final disposer = reaction<T>(fn, (item) {
    completer.complete(item);
  });
  final item =
      await completer.future.timeout(Duration(milliseconds: timeoutMillis));
  disposer();
  return item;
}

Stream<T> streamOf<T>(T Function(Reaction) fn) {
  late final ReactionDisposer disposer;
  final controller = StreamController<T>(onCancel: () => disposer());
  disposer = reaction<T>(fn, (item) {
    controller.add(item);
  }, fireImmediately: true);

  return controller.stream;
}
