import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'id_ID': {
      // Home
      'home_header': 'Halo, User!',
      'home_header_desc': 'Jangan lupa catat keuanganmu setiap hari!',
      'section_category_title': 'Pengeluaran berdasarkan kategori',
      'section_today': 'Hari ini',
      'section_yesterday': 'Kemarin',
      'home_summary_day': 'Pengeluaranmu hari ini',
      'home_summary_month': 'Pengeluaranmu bulan ini',


      // Expense Add
      'expense_add_title': 'Tambah Pengeluaran Baru',
      'expense_add_form_name': 'Nama Pengeluaran',
      'expense_add_form_datetime': 'Tanggal Pengeluaran',
      'expense_add_form_amount': 'Nominal',
      'expense_add_button_save': 'Simpan',
    }
  };
  
}