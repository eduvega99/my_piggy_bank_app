import 'package:my_piggy_bank_app/database/database_connection.dart';
import 'package:my_piggy_bank_app/models/transaction.dart';


class TransactionsProvider {
  
  final String _tableName = 'transactions';

  Future<int> createTransaction(Transaction transaction) async {
    final db = await DatabaseConnection.connection.database;
    final result = await db.insert(_tableName, transaction.toJson());
    return result;
  } 

  Future<Transaction?> getTransaction(int id) async {
    final db = await DatabaseConnection.connection.database;
    final result = await db.query(_tableName, where: 'id=?', whereArgs: [id]);
    return result.isNotEmpty ? Transaction.fromJson(result[0]) : null;
  }

  Future<List<Transaction>> getAllTransactions() async {
    final db = await DatabaseConnection.connection.database;
    final results = await db.query(_tableName);
    final transactions = results.map((record) => Transaction.fromJson(record)).toList();
    return transactions;
  }

  Future<int> updateTransaction(Transaction transaction) async {
    final db = await DatabaseConnection.connection.database;
    final result = await db.update(_tableName, transaction.toJson(), where: 'id=?', whereArgs: [transaction.id]);
    return result;
  }

  Future<int> deleteTransaction(int id) async {
    final db = await DatabaseConnection.connection.database;
    final result = db.delete(_tableName, where: 'id=?', whereArgs: [id]);
    return result;
  }

  Future<int> deleteAllTransaction() async{
    final db = await DatabaseConnection.connection.database;
    final results = await db.delete(_tableName);
    return results;
  }

}