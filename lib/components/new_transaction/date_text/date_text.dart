import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateText extends StatelessWidget {
  final DateTime? selectedDate;
  final Function() showDatePicker;

  DateText({
    required this.selectedDate,
    required this.showDatePicker,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        children: [
          Expanded(
            child: Text(selectedDate == null
                ? 'Nenhuma data selecionada!'
                : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate!)}'),
          ),
          TextButton(
            onPressed: showDatePicker,
            child: const Text(
              'Selecionar Data',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
