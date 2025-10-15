import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/expenses_repository.dart';
import '../models/expense_item.dart';

class ExpensesScreen extends ConsumerWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesAsync = ref.watch(expensesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gastos simples'),
        actions: [
          IconButton(
            tooltip: 'Borrar todo',
            onPressed: () => ref.read(expensesRepoProvider).clear(),
            icon: const Icon(Icons.delete_sweep),
          ),
        ],
      ),
      body: expensesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (expenses) {
          if (expenses.isEmpty) return const _EmptyState();
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: expenses.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final ExpenseItem item = expenses[index];
              return Dismissible(
                key: ValueKey(item.id),
                direction: DismissDirection.endToStart,
                onDismissed: (_) =>
                    ref.read(expensesRepoProvider).remove(item.id),
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.redAccent,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: Card(
                  child: ListTile(
                    title: Text(item.product),
                    subtitle: Text('Persona: ${item.person}'),
                    trailing: Text('\$ ${item.amount.toStringAsFixed(2)}'),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openAddDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Agregar ítem'),
      ),
    );
  }

  Future<void> _openAddDialog(BuildContext context, WidgetRef ref) async {
    final productCtrl = TextEditingController();
    final amountCtrl = TextEditingController();
    final personCtrl = TextEditingController();

    await showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Nuevo gasto'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: productCtrl,
              decoration: const InputDecoration(labelText: 'Producto'),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: amountCtrl,
              decoration: const InputDecoration(labelText: 'Total gastado'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: personCtrl,
              decoration: const InputDecoration(labelText: 'Persona'),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) =>
                  _submit(ref, productCtrl, amountCtrl, personCtrl, context),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
          FilledButton(
            onPressed: () => _submit(ref, productCtrl, amountCtrl, personCtrl, context),
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }

  void _submit(
    WidgetRef ref,
    TextEditingController productCtrl,
    TextEditingController amountCtrl,
    TextEditingController personCtrl,
    BuildContext context,
  ) {
    final product = productCtrl.text.trim();
    final person = personCtrl.text.trim();
    final parsed = double.tryParse(amountCtrl.text.replaceAll(',', '.'));

    if (product.isEmpty || person.isEmpty || parsed == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Verificá los datos.')));
      return;
    }

    ref.read(expensesRepoProvider).add(
      product: product,
      amount: parsed,
      person: person,
    );

    Navigator.pop(context);
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Aún no hay gastos.\nTocá “Agregar ítem” para empezar.',
        textAlign: TextAlign.center,
      ),
    );
  }
}
