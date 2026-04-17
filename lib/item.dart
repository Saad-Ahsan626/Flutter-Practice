import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemModel {
  final String id;
  final String name;
  final double price;
  final bool isFavorite;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.isFavorite,
  });
}

class ItemsListState {
  final List<ItemModel> allItems;
  final List<ItemModel> favoriteItems;
  final String search;

  ItemsListState({
    required this.allItems,
    required this.favoriteItems,
    required this.search,
  });

  ItemsListState copyWith({
    List<ItemModel>? allItems,
    List<ItemModel>? favoriteItems,
    String? search,
  }) {
    return ItemsListState(
      allItems: allItems ?? this.allItems,
      favoriteItems: favoriteItems ?? this.favoriteItems,
      search: search ?? this.search,
    );
  }
}

class ItemsNotifier extends StateNotifier<ItemsListState> {
  ItemsNotifier()
    : super(ItemsListState(allItems: [], favoriteItems: [], search: ''));

  void addItem() {
    ItemModel item1 = ItemModel(
      id: '1',
      name: 'Iphone 13 Pro Max',
      price: 10.0,
      isFavorite: false,
    );
    ItemModel item2 = ItemModel(
      id: '2',
      name: 'Iphone 14 Pro Max',
      price: 20.0,
      isFavorite: true,
    );
    ItemModel item3 = ItemModel(
      id: DateTime.now().toString(),
      name: 'Google Pixel 7 Pro',
      price: 30.0,
      isFavorite: false,
    );
    state = state.copyWith(allItems: [...state.allItems, item1, item2, item3]);
  }

  void deleteItem(String id) {
    List<ItemModel> updatedItems = List.from(state.allItems);
    updatedItems.removeWhere((item) => item.id == id);
    state = state.copyWith(allItems: updatedItems);
  }

  void showFavoriteItems() {
    List<ItemModel> favoriteItems = state.allItems
        .where((item) => item.isFavorite)
        .toList();
    state = state.copyWith(favoriteItems: favoriteItems);
  }

  void showAllItems() {
    state = state.copyWith(allItems: state.allItems);
  }

  void searchItems(String query) {
    
    if (query == '') {
      state = state.copyWith(search: '', allItems: state.allItems);
    }
    
    List<ItemModel> searchResults = state.allItems
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    state = state.copyWith(search: query, allItems: searchResults);
  }
}

final ItemProvider = StateNotifierProvider<ItemsNotifier, ItemsListState>(
  (ref) => ItemsNotifier(),
);



class ItemScreen extends ConsumerWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Items')),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == '1') {
                ref.read(ItemProvider.select((state) => state.allItems)).isEmpty
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No items available')),
                      )
                    : ref.read(ItemProvider.notifier).showFavoriteItems();
              } else if (value == '2') {
                ref.read(ItemProvider.select((state) => state.allItems)).isEmpty
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No items available')),
                      )
                    : ref.read(ItemProvider.notifier).showAllItems();
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(value: '1', child: Text('Show Favorites')),
                const PopupMenuItem(value: '2', child: Text('Show All')),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              ref.read(ItemProvider.notifier).addItem();
            },
            child: const Text('Add Items'),
          ),
          const SizedBox(height: 8),
          TextField(
            onChanged: (value) {
              ref.read(ItemProvider.notifier).searchItems(value);
            },
            decoration: const InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ref.watch(ItemProvider).allItems.length,
              itemBuilder: (context, index) {
                final item = ref.watch(ItemProvider).allItems[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('\$${item.price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref.read(ItemProvider.notifier).deleteItem(item.id);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
