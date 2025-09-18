import 'package:intl/intl.dart';

extension DoubleExt on double {
  String formatToRupiah() {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ', 
      decimalDigits: 0,
    );

    return formatter.format(this);
  }
}
