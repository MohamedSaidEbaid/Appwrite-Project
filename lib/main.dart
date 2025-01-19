import 'package:appwrite_project/constants/app_constants.dart';
import 'package:appwrite_project/presentation/cubit/item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'di_container.dart' as di;
import 'domain/usecases/fetch_items_use_case.dart';
import 'presentation/views/pages/items_screen.dart';

void main() {
  // Initialize Dependency Injection
  di.init();

  runApp(MultiBlocProvider(
      providers: [
        Provider(create: (_) => di.sl<FetchItemsUseCase>()), //  FetchItemsUseCase
        BlocProvider(create: (context) => ItemCubit(context.read<FetchItemsUseCase>())), // Provide ItemCubit
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ItemScreen(),
    );  }
}