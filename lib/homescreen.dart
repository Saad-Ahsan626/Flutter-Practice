import 'package:flutter/material.dart';
import 'package:flutter_practice/MyProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homescreen1 extends ConsumerStatefulWidget {
  const Homescreen1({super.key});

  @override
  ConsumerState<Homescreen1> createState() => _Homescreen1State();
}

class _Homescreen1State extends ConsumerState<Homescreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final counter = ref.watch(
                MyProvider.select((state) => state.count),
              );
              print('Building Counter Text');
              return Center(
                child: Text(
                  'Count: $counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(MyProvider.notifier).update((state) {
                return state.copyWith(count: state.count + 1);
              });
            },
            child: const Text('Increment'),
          ),
          const SizedBox(height: 20),

          Consumer(
            builder: (context, ref, child) {
              final forRadio = ref.watch(
                MyProvider.select((state) => state.isRadioOn),
              );
              print('Building Radio Switch');
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Toggle Radio'),
                  Switch(
                    value: forRadio,
                    onChanged: (value) {
                      ref.read(MyProvider.notifier).update((state) {
                        return state.copyWith(isRadioOn: value);
                      });
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
