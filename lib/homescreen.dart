import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider((ref) {
  return 0;
});

final radio = StateProvider<bool>((ref) {
  return false;
});

class Homescreen1 extends ConsumerStatefulWidget {
  const Homescreen1({super.key});

  @override
  ConsumerState<Homescreen1> createState() => _Homescreen1State();
}

class _Homescreen1State extends ConsumerState<Homescreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final count = ref.watch(counter);
              print('Building Counter Text');
              return Center(
                child: Text(
                  'Count: $count',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(counter.notifier).state++;
            },
            child: const Text('Increment'),
          ),
          SizedBox(height: 20),
          Consumer(
            builder: (context, ref, child) {
              final isRadioOn = ref.watch(radio);
              print('Building Radio Switch');
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Toggle Radio'),
                  Switch(
                    value: isRadioOn,
                    onChanged: (value) {
                      ref.read(radio.notifier).state = value;
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
