class Transaction {
  
  final int? id;
  final double amount;
  final String date;
  final int type;
  final int category;
  final String? description;

  Transaction({
    this.id,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
    this.description,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id:       json['id'], 
    amount:   double.parse(json['amount']),
    date:     json['date'], 
    type:     json['type'],
    category: json['category'],
    description: json['description'],
  );

  Map<String, dynamic> toJson() => {
    'id':     id,
    'amount': amount.toString(),
    'date':   date,
    'type':   type,
    'category_id': category,
    'description': description
  };

}