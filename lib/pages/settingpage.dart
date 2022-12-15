import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:bloc/bloc.dart";
import 'package:hr_task/cubit/app_cubit.dart';
import '../constants/constant.dart';
import '../cubit/app_state.dart';
import '../widgets/drawerlist.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            title: const Center(
              child: Text("Setting"),
            ),
            backgroundColor: BlocProvider.of<AppCubit>(context).appbarColor,
          ),
          backgroundColor: BlocProvider.of<AppCubit>(context).mainColor,
          drawer: DrawerList(),
          body: ListView(
            children: [
              ListTile(
                title: Text(
                  BlocProvider.of<AppCubit>(context).themeColor,
                  style: TextStyle(
                    color: BlocProvider.of<AppCubit>(context).textCardColor,
                  ),
                ),
                trailing: Switch(
                  value: BlocProvider.of<AppCubit>(context).value,
                  onChanged: (val) {
                    BlocProvider.of<AppCubit>(context).changeColor(val);
                    setState(() {
                      BlocProvider.of<AppCubit>(context).value = val;
                    });
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
