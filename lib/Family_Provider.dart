import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final testprovider = StateProvider.family<int, int>((ref, id) {
  return id * 2;
});

class FamilyProviderScreen extends ConsumerStatefulWidget {
  const FamilyProviderScreen({super.key});

  @override
  ConsumerState<FamilyProviderScreen> createState() =>
      _FamilyProviderScreenState();
}

class _FamilyProviderScreenState extends ConsumerState<FamilyProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Value for ID 1: ${ref.watch(testprovider(5))}'),
            Text('Value for ID 2: ${ref.watch(testprovider(2))}'),
            Text('Value for ID 3: ${ref.watch(testprovider(3))}'),
          ],
        ),
      ),
    );
  }
}
