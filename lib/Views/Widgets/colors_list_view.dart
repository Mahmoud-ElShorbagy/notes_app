import 'package:app_note/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClolorItem extends StatelessWidget {
  const ClolorItem({super.key, required this.isActive, required this.color});
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Container(
            width: 53,
            height: 53,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3.5),
                borderRadius: BorderRadius.circular(10),
                color: color),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: color),
            ),
          )
        : Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: color),
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({
    super.key,
  });

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentindex = 0;
  List<Color> colors = const [
    Color(0xff62FCD7),
    Color(0xffffa384),
    Color(0xffefe7bc),
    Color(0xffD200FF),
    Color(0xff2DFF00),
    Color(0xff74bdcb),
    Color(0xffCB3489),
    Color(0xff16E9D1),
    Color(0xff688997),
    Color(0xff8EFF00),
    Color(0xff636D9C),
    Color(0xffb6a1a1),
    Color(0xffD49FFF),
    Color(0xffceff91),
    Color(0xff00ffaa),
    Color(0xff4cb3b3),
    Color(0xff7fb34c),
    Color(0xffa3ebb1),
    Color(0xff116530),
    Color(0xff21b6a8),
    Color(0xff18a558),
    Color(0xff05445e),
    Color(0xff189ab4),
    Color(0xff75e6da),
    Color(0xffefe7bc),
    Color(0xff2ff3e0),
    Color(0xfff8d210),
    Color(0xfffa26a0),
    Color(0xfff51720),
    Color(0xfff9f1f0),
    Color(0xfffadcd9),
    Color(0xfff8afa6),
    Color(0xfff79489),
    Color(0xffe7f2f8),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  currentindex = index;
                  BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                  setState(() {});
                },
                child: ClolorItem(
                  color: colors[index],
                  isActive: currentindex == index,
                ),
              ),
            );
          }),
    );
  }
}
