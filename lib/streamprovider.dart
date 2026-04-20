import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

final streamProvider = StreamProvider<String>((ref) async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    final random = Random();
    final randomNumber = random.nextInt(100);
    yield 'Stream value: $randomNumber';
  }
});

class StreamproviderWidget extends ConsumerStatefulWidget {
  const StreamproviderWidget({super.key});

  @override
  ConsumerState<StreamproviderWidget> createState() => _StreamproviderWidgetState();
}

class _StreamproviderWidgetState extends ConsumerState<StreamproviderWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('StreamProvider Example'))),
      body: Consumer(
        builder: (context, ref, child) => Center(
          child: ref.watch(streamProvider).when(
            data: (data) => Text(data),
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}


