import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider((ref) {
  return 0;
});

class Homescreen1 extends ConsumerWidget {
  const Homescreen1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     print('Building Homescreen1');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final count = ref.watch(counter);
          print('Building Counter Text');
          return Column(
            children: [
              Center(
                child: Text(
                  'Count: $count',
                  style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(counter.notifier).state++;
              },
              child: const Text('Increment'),
            ),
          ],
        );
      },
      ),
    );
  }
}
