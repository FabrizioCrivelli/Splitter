import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/expense_item.dart';

class ExpensesNotifier extends StateNotifier<List<ExpenseItem>> {
  ExpensesNotifier() : super(const []);

  void addExpense({
    required String product,
    required double amount,
    required String person,
  }) {
    if (product.trim().isEmpty || person.trim().isEmpty || amount.isNaN) return;
    state = [
      ...state,
      ExpenseItem(product: product.trim(), amount: amount, person: person.trim()),
    ];
  }

  void removeAt(int index) {
    if (index < 0 || index >= state.length) return;
    final newList = [...state]..removeAt(index);
    state = newList;
  }

  void clear() => state = const [];
}

final expensesProvider =
    StateNotifierProvider<ExpensesNotifier, List<ExpenseItem>>((ref) {
  return ExpensesNotifier();
});
