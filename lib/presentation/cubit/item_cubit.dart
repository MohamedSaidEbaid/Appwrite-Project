import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/item.dart';
import '../../domain/usecases/fetch_items_use_case.dart';
part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  final FetchItemsUseCase fetchItemsUseCase;

  ItemCubit(this.fetchItemsUseCase) : super(ItemInitial());

  Future<void> loadItems() async {
    emit(ItemLoading());
    final result = await fetchItemsUseCase();
    result.fold(
          (error) => emit(ItemError(error)),
          (items) => emit(ItemLoaded(items)),
    );
  }
}
