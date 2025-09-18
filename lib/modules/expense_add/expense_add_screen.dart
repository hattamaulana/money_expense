import 'package:flutter/material.dart';
import 'package:money_expense/widgets/input/select.dart';
import 'package:money_expense/widgets/input/textfield.dart';

class ExpenseAddScreen extends StatefulWidget {
  const ExpenseAddScreen({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _ExpenseAddScreen();
  }
}

class _ExpenseAddScreen extends State<ExpenseAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        title: const Text(
          'Tambah Pengeluaran Baru',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DOTTextField(
              hintText: 'Nama Pengeluaran',
            ),
            const SizedBox(height: 16),

            DOTSelectorField(
              onTap: () {
                // TODO: Handle category selection logic
                print('Category selector tapped');
              },
              leadingIcon: Icon(Icons.fastfood_rounded, color: Colors.amber.shade600),
              text: 'Makanan',
              trailingIcon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            DOTSelectorField(
              onTap: () {
                // TODO: Handle date picker logic
                print('Date selector tapped');
              },
              leadingIcon: const SizedBox.shrink(),
              text: 'Tanggal Pengeluaran',
              trailingIcon: Icon(
                Icons.calendar_today_rounded, 
                size: 20, 
                color: Colors.grey.shade600
              ),
            ),
            const SizedBox(height: 16),
            
            const DOTTextField(
              hintText: 'Nominal',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),

            // Save Button 
            ElevatedButton(
              onPressed: () {
                // TODO: Handle save logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black54,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Simpan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}