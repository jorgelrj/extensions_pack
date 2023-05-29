import 'dart:async';

import 'package:flutter/material.dart';

typedef FutureCallback = Future<void> Function();
typedef ContextCallback = void Function(BuildContext);
typedef FutureOrCallback<T> = FutureOr<T> Function();
typedef DeleteFn<T> = Future<bool> Function(T);
typedef SaveFn<T> = Future<bool> Function(T);
typedef FutureValueChanged<T> = Future<void> Function(T);
typedef ReplaceFn<O, N> = void Function({required O oldItem, required N newItem});

typedef Json = Map<String, dynamic>;

typedef FormKey = GlobalKey<FormState>;
