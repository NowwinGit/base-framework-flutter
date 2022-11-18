import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_base_framework/src/Constants/style.dart';
import 'package:sample_base_framework/src/Services/Languages/Languages.dart';
import 'package:sample_base_framework/src/bloc/sample_cubit.dart';
import 'package:sample_base_framework/src/bloc/sample_state.dart';
import 'package:sample_base_framework/src/model/sample_model.dart';
import 'package:sample_base_framework/src/provider/sample_provider.dart';
import 'package:sample_base_framework/src/repository/sample_repository.dart';
import 'package:sample_base_framework/src/widget/CustomAppBar/custom_app_bar.dart';

import 'adddetails_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.context}) : super(key: key);

  final BuildContext context;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TouristModel> sampleList = [];
  late SampleCubit _sampleCubit;

  SampleModel sampleModel = SampleModel();

  @override
  void initState() {
    //TODO: implement initState
    registerGetIt();
    _sampleCubit = GetIt.I.get<SampleCubit>();
    _sampleCubit.getTourist();
    /*SampleRepository _sampleProvider = GetIt.I.get<SampleRepository>();
    _sampleProvider.getTouriestList().then((value) {
      sampleModel = value;
      setState(() {
        sampleList = sampleModel.data!;
      });
    });*/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
      appBar: CustomAppBar(
        backbutton: 'hide',
        title: Text(
          'Locations',
          style: sHeading6White(context)
              .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        menu: 'hide',
        centerAlign: true,backGroundColor: Colors.blue,settings: false,),
        body: _getBodyWidget(context),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.brown,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddDetails()));
          },
          child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddDetails()));
            },
            icon: const Icon(Icons.add),
          ),
        ),
      );

       /* return AppScaffold(
          showAppBar: true,
          backbutton: 'hide',
         // title: T('Locations'),
          menu: 'hide',
          centerAlignAppBar: true,
          backGroundColor: Colors.blue,
          // appBar: CustomAppBar(backbutton: 'hide', title:  Text('Locations',style: sHeading6White(context),), menu: 'hide',
          // centerAlign: true,backGroundColor: Colors.blue,),
          body: AppContentView(
            showMenu: false,
           // title: T('Locations'),
            mobile: MobileView(
              widget:  _getBodyWidget(context),
            ),
            desktop: DesktopView(
              showAppBar: false,
              widget:  _getBodyWidget(context),
              backGroundColor: Colors.blue,
            ),
          ),
          // showFAB: true,
          // colorFAB:  Colors.brown,
          // onPressFAB:() {
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (context) => AddDetails()));
          // },
          // iconFAB: Icons.add,

          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: Colors.brown,
          //   onPressed: () {},
          //   child: IconButton(
          //     onPressed: () {
          //
          //     },
          //     icon: ,
          //   ),
          // ),
        );*/

  //});
  }

  registerGetIt() {
    GetIt.I.registerSingleton<SampleProvider>(SampleProvider());
    GetIt.I.registerSingleton<SampleRepository>(SampleRepository());
    GetIt.I.registerSingleton<SampleCubit>(SampleCubit());
  }

  _getBodyWidget(BuildContext contexts) {
   // return _buildContent(contexts);
    return BlocBuilder<SampleCubit, SampleState>(
        bloc: _sampleCubit,
        builder: (context, state) {
          switch (state.runtimeType) {
            case SampleTouristLoading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case SampleTouristSuccess:
              SampleModelResponse response = (state as SampleTouristSuccess).response;
              if(response.hasError!){
                return Center(
                  child: Text(
                      response.errorMessage!
                  ),
                );
              }else {
                sampleList = response.sampleModel!.data!;
                return ListWidget(sampleList: sampleList,);
              }
            default:
              return const Center(
                child: Text(
                    "Loading data"
                ),
              );
          }
        }
    );
  }

  Widget _buildContent(BuildContext context) {
    ThemeData theme = Theme.of(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Text(
                T("EnterOTP"),
                style: sHeading3White(context).copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 15,
            ),
          ],
        );

    //);
  }
  // _bodyWidget() {
  //   return
  // }
}

class ListWidget extends StatefulWidget {
   ListWidget({Key? key, required this.sampleList}) : super(key: key);
 final  List<TouristModel> sampleList;
  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.sampleList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: 70,
              alignment: Alignment.center,
              child: Text(widget.sampleList[index].touristName ?? ""),
            ),
          );
        });
  }
}
