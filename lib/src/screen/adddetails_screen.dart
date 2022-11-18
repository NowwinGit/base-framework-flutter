import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_base_framework/src/Constants/style.dart';
import 'package:sample_base_framework/src/bloc/sample_cubit.dart';
import 'package:sample_base_framework/src/bloc/sample_state.dart';
import 'package:sample_base_framework/src/widget/CustomAppBar/custom_app_bar.dart';
class AddDetails extends StatefulWidget {
  const AddDetails({Key? key}) : super(key: key);

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  late SampleCubit _sampleCubit;

  @override
  void initState() {
    _sampleCubit = SampleCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(backbutton: 'show', title:  Text('Locations',style: sHeading6White(context),), menu: 'hide',
          centerAlign: true,backGroundColor: Colors.blue,),
      body: BlocListener<SampleCubit, SampleState>(
        bloc: _sampleCubit,
        listener: (context, state){
          switch(state.runtimeType) {
            case SampleTouristLoading:
              break;
            case CreateTouristSuccess:
              _showErrorDialog(context, "Created Successfully");
              break;
            case CreateTouristError:
              _showErrorDialog(context, (state as CreateTouristError).error);
              break;
          }
        },
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Add New Data",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "  Personal Details",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Enter Name",
                    border: OutlineInputBorder()
                ),

              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter Email",
                    border: OutlineInputBorder()
                ),

              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              " Location",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: locationController,
                decoration: InputDecoration(
                    labelText: "Location",
                    hintText: "Enter Location",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.arrow_drop_down),
                    )
                ),


              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: (){
                  //Navigator.pop(context);
                  if(nameController.text.isEmpty){
                    _showErrorDialog(context, "Name is not empty");
                  }else if(emailController.text.isEmpty){
                    _showErrorDialog(context, "Email is not empty");
                  }else if(locationController.text.isEmpty){
                    _showErrorDialog(context, "Location is not empty");
                  }else {
                    Map map = {
                      "tourist_name": nameController.text,
                      "tourist_email": emailController.text,
                      "tourist_location": locationController.text
                    };
                    _sampleCubit.postTourist(map);
                  }
                },
                color: Colors.brown,
                child: Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),


              ),
            )


          ],
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text("Sample App"),
          content: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(message),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
                child: Text(
                  "OK",
                ),
                onPressed: () {
                  if(message == "Created Successfully"){
                    Navigator.of(context).pop();
                    Navigator.of(context).pop(true);
                  }else {
                    Navigator.of(context).pop();
                  }
                }
            ),
          ],
        ));
  }
}
