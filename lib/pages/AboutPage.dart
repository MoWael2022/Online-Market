import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_task/cubit/app_cubit.dart';
import 'package:hr_task/cubit/app_state.dart';
import 'package:hr_task/widgets/drawerlist.dart';
import 'package:sizer/sizer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          drawer: DrawerList(),
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            title: const Center(
              child: Text("About"),
            ),
            backgroundColor: BlocProvider.of<AppCubit>(context).appbarColor,
          ),
          backgroundColor: BlocProvider.of<AppCubit>(context).mainColor,
          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(2.w, 2.w, 2.w, 2.w),
                child: Text(
                  "Information About the Application",
                  style: TextStyle(
                    fontSize: 11.w,
                    color: BlocProvider.of<AppCubit>(context).textCardColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(2.w, 2.w, 2.w, 2.w),
                child: Text(
                  """1 - you can change the color mode in the setting\n2 - you can drag the product to clear it in payment page\n3 - you can make search to find your category in category page""",
                  style: TextStyle(
                    fontSize: 5.w,
                    color: BlocProvider.of<AppCubit>(context).textCardColor,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(2.w, 2.w, 2.w, 2.w),
                child: Text(
                  "About",
                  style: TextStyle(
                    fontSize: 11.w,
                    color: BlocProvider.of<AppCubit>(context).textCardColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),


               Container(
                 padding: EdgeInsets.fromLTRB(2.w, 2.w, 2.w, 2.w),
                 child: Text('''An online marketplace (or online e-commerce marketplace) is a type of e-commerce website where product or service information is provided by multiple third parties. Online marketplaces are the primary type of multichannel ecommerce and can be a way to streamline the production process.
In an online marketplace, consumer transactions are processed by the marketplace operator and then delivered and fulfilled by the participating retailers or wholesalers. These type of websites allow users to register and sell single items to many items for a "post-selling" fee.
In general, because marketplaces aggregate products from a wide array of providers, selection is usually more wide, and availability is higher than in vendor-specific online retail stores.[1] Since 2014 online marketplaces have become abundant.[2] Some online marketplaces have a wide variety of general interest products that cater to almost all the needs of the consumers, others are consumer specific and cater to a particular segment.''',
                  style: TextStyle(
                    fontSize: 4.w,
                    color: BlocProvider.of<AppCubit>(context).textCardColor,
                  ),
              ),
               ),
            ],
          ),
        );
      },
    );
  }
}
