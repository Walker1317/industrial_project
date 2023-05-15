import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer(this.onChanged, this.currentIndex, {super.key});
  ValueChanged<int> onChanged;
  double currentIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.grey[900],
        child: Column(
          children: [
            //button(index: 0, icon: Icons.widgets_outlined, title: 'Início'),
            button(index: 0, icon: Icons.factory_outlined, title: 'Produção'),
            button(index: 1, icon: Icons.report_problem_outlined, title: 'Paradas'),
            button(index: 2, icon: Icons.speed_outlined, title: 'Indicador OEE'),
            button(index: 3, icon: Icons.shelves, title: 'Produtos'),
            button(index: 4, icon: Icons.precision_manufacturing_outlined, title: 'Máquinas'),
            button(index: 5, icon: Icons.pan_tool, title: 'Tipo de Paradas'),
            button(index: 6, icon: Icons.book_online, title: 'Conceito OEE'),
          ],
        ),
      ),
    );
  }

  Widget button({required int index, required IconData icon, required String title}){
    return Column(
      children: [
        ListTile(
          selected: currentIndex == index ? true : false,
          onTap: (){
            onChanged.call(index);
          },
          leading: Icon(icon),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold),),
        ),
        const Divider()
      ],
    );
  }
}