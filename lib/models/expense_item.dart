class ExpenseItem {
  final String id;          // ← id del documento en Firestore
  final String product;
  final double amount;
  final String person;
  final DateTime? createdAt;

  const ExpenseItem({
    required this.id,
    required this.product,
    required this.amount,
    required this.person,
    this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'product': product,
    'amount': amount,
    'person': person,
    'createdAt': createdAt,
  };

  factory ExpenseItem.fromDoc(String id, Map<String, dynamic> json) {
    return ExpenseItem(
      id: id,
      product: (json['product'] ?? '') as String,
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      person: (json['person'] ?? '') as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'].toString()),
    );
  }
}
