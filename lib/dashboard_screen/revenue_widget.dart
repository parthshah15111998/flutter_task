import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RevenueWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          width: 2
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Revenue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 2,
                      color: Colors.black.withOpacity(0.1)
                    )
                  ),
                  child: DropdownButton<String>(
                    value: 'All Products',
                    items: [
                      DropdownMenuItem(
                        value: 'All Products',
                        child: Text('All Products'),
                      ),
                      DropdownMenuItem(
                        value: 'Product A',
                        child: Text('Product A'),
                      ),
                      DropdownMenuItem(
                        value: 'Product B',
                        child: Text('Product B'),
                      ),
                    ],
                    onChanged: (value) {},
                    underline: SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.black.withOpacity(0.1),
          ),
          SizedBox(height: 16),
         Container(
           padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 '\$23,569.00',
                 style: TextStyle(
                   fontSize: 28,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               Row(
                 children: [
                   Icon(
                     Icons.arrow_upward,
                     color: Colors.green,
                     size: 16,
                   ),
                   SizedBox(width: 4),
                   Text(
                     '10.5%',
                     style: TextStyle(
                       color: Colors.green,
                       fontSize: 14,
                     ),
                   ),
                   Text(
                     ' from last period',
                     style: TextStyle(
                       fontSize: 14,
                       color: Colors.grey,
                     ),
                   ),
                 ],
               ),
               SizedBox(height: 16),
               SizedBox(
                 height: 200,
                 child: LineChart(
                   LineChartData(
                     gridData: FlGridData(show: true,),
                     borderData: FlBorderData(show: false),
                     titlesData: FlTitlesData(show: true,),
                     lineBarsData: [
                       LineChartBarData(
                         spots: [
                           FlSpot(0, 12),
                           FlSpot(1, 18),
                           FlSpot(2, 15),
                           FlSpot(3, 20),
                         ],
                         isCurved: true,
                         color: Colors.green,
                         barWidth: 3,
                         belowBarData: BarAreaData(show: false),
                       ),
                       LineChartBarData(
                         spots: [
                           FlSpot(0, 10),
                           FlSpot(1, 12),
                           FlSpot(2, 14),
                           FlSpot(3, 13),
                         ],
                         isCurved: true,
                         color: Colors.blue,
                         barWidth: 3,
                         belowBarData: BarAreaData(show: false),
                       ),
                     ],
                   ),
                 ),
               ),
               SizedBox(height: 8),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('Jan 28, 2024', style: TextStyle(color: Colors.grey)),
                   Text('Feb 28, 2024', style: TextStyle(color: Colors.grey)),
                 ],
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
}
