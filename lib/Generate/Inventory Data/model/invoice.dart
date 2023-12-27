import 'package:abyssinia_pharmacy/Generate/Inventory%20Data/model/supplier.dart';

class Invoice {
  final InvoiceInfo info;
  final Supplier supplier;
  final List<InvoiceItem> items;

  const Invoice({
    required this.info,
    required this.supplier,
    required this.items,
  });
}

class InvoiceInfo {
  final String number;
  final DateTime date;
  //final DateTime dueDate;

  const InvoiceInfo({
    required this.number,
    required this.date,
    //required this.dueDate,
  });
}

class InvoiceItem {
  final String ProductName;
  final DateTime DateOfPurchased;
  final int Quantity;
  final double PurchasePrice;
  final double MRP;

  const InvoiceItem({
    required this.ProductName,
    required this.DateOfPurchased,
    required this.Quantity,
    required this.MRP,
    required this.PurchasePrice,
  });

}
