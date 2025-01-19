import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/item_cubit.dart';
import '../widgets/item_widget.dart';

class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Items')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => ItemCubit(context.read()), // Inject Use Case
          child: BlocBuilder<ItemCubit, ItemState>(
            builder: (context, state) {
              if (state is ItemInitial) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () => context.read<ItemCubit>().loadItems(),
                    child: const Text('Load Data'),
                  ),
                );
              } else if (state is ItemLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ItemLoaded) {
                return ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return ItemWidget(

                      title: item.title,
                      text: item.description,
                    );
                  },
                );
              } else if (state is ItemError) {
                return Center(
                  child: Text(state.message, style: TextStyle(color: Colors.red)),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
