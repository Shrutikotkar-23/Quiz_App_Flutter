import 'package:flutter/material.dart';
import 'package:advv_basics/Results_updates/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.dataSummary, {super.key});

  final List<Map<String, Object>> dataSummary;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: dataSummary.map((data) {
            return SummaryItem(data);
            
          }).toList(),
        ),
      ),
    );
  }
}
