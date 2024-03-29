import 'package:docpdpartner/custom_ui/imageView/CircleImageView.dart';
import 'package:docpdpartner/custom_ui/imageView/ImageViewSize.dart';
import 'package:docpdpartner/custom_ui/imageView/TextView.dart';
import 'package:docpdpartner/custom_ui/imageView/TextView.dart';
import 'package:docpdpartner/custom_ui/imageView/TextView.dart';
import 'package:docpdpartner/model/appointment_model.dart';
import 'package:docpdpartner/utils/AppUtils.dart';
import 'package:docpdpartner/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';

class HeightDialog extends StatefulWidget{
  AppointmentModel appointmentModel;
  HeightDialog(this.appointmentModel);

     @override
   _HeightDialog createState()=>_HeightDialog();
}
class _HeightDialog extends State<HeightDialog>  {
  TextEditingController feedController;
  TextEditingController inchController;

  bool errorbox1=false;
  bool errorbox2=false;



  FocusNode wightFocus = FocusNode();
  FocusNode heightFocus = FocusNode();

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardAction(
          focusNode: wightFocus,
          onTapAction: () async {
            FocusScope.of(context).requestFocus(FocusNode());
          },
        ),

        KeyboardAction(
          focusNode: heightFocus,
          onTapAction: () async {
            FocusScope.of(context).requestFocus(FocusNode());
          },
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    feedController=new TextEditingController(text: widget.appointmentModel.feed??'');
    inchController=new TextEditingController(text:  widget.appointmentModel.inch??'');
  }

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
         body:  SafeArea(
           top: true,
           child: KeyboardActions(
             config: _buildConfig(context),
             child: Container(
               color: Colors.white,
               child: Column(
                 children: <Widget>[

                   Container(
                     padding: const EdgeInsets.all(10),
                     child: Row(
                       children: <Widget>[
                         IconButton(icon: Icon(Icons.arrow_back,size: 25,), onPressed: ()=>Navigator.of(context).pop()),
                         Expanded(
                           child: TextView(
                             'Height',align: TextAlign.center,weight: FontWeight.w500,colors: Theme.of(context).primaryColor,size: 18,),

                         ),

                         Container(
                           width:40,
                         )


                       ],
                     ),
                   ),

                   Container(
                     margin: const EdgeInsets.only(top: 7,bottom: 3,left: 10,right: 10),
                     child: Card(
                       elevation: 5,
                       child: Container(
                         padding: const EdgeInsets.all(10),
                         child: InkWell(
                           onTap: (){
                             var map=widget.appointmentModel.toMap();
                             Navigator.pushNamed(context, '/PatientDetails',arguments: map);
                           },
                           child: Row(
                             children: <Widget>[
                               CircleImageView(widget.appointmentModel.userPic,60),
                               Expanded(
                                 child: Container(
                                   margin: const EdgeInsets.only(left: 10,top: 7,bottom: 7),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       TextView(widget.appointmentModel.userName,colors: Theme.of(context).primaryColor,size: 16,weight: FontWeight.w500,),
                                       Container(
                                         margin: const EdgeInsets.only(top: 5,bottom: 2),
                                         child: Row(
                                           children: <Widget>[

                                             TextView(AppUtils.covertDate(widget.appointmentModel.appoinmentDate,AppUtils.appointmentDate, AppUtils.appointment)
                                               ,align: TextAlign.start,colors: Theme.of(context).hintColor,size: 13,weight: FontWeight.w400,
                                               mergin: const EdgeInsets.only(left: 0),
                                             )
                                           ],
                                         ),
                                       ),


                                     ],
                                   ),
                                 ),
                               ),

                               Icon(Icons.arrow_forward_ios,size: 22,color: Theme.of(context).hintColor.withOpacity(0.5),)

                             ],
                           ),
                         ),
                       ),
                     ),
                   ),

                   Container(
                     margin: const EdgeInsets.all(10),
                     child: Card(
                       elevation: 5,
                       child: Container(
                         padding: const EdgeInsets.all(20),
                         child: Column(
                           children: <Widget>[

                             Container(
                               margin: const EdgeInsets.only(bottom: 5),
                               child: Row(
                                 children: <Widget>[
                                   Expanded(child: TextView('Height',weight: FontWeight.w700,colors: Theme.of(context).primaryColor,size: 20,)),
                                   Icon(Icons.info_outline,size: 35,color: Theme.of(context).accentColor,)

                                 ],
                               ),
                             ),

                             Align(
                                 alignment: Alignment.topLeft,
                                 child: TextView('Distance & Speed Calculation Need Information',weight: FontWeight.w400,align: TextAlign.left,colors: Theme.of(context).hintColor,size: 17,)),

                             Container(
                               margin: const EdgeInsets.only(right: 15,top: 35,left: 15,bottom: 35),
                               child: Row(
                                 children: <Widget>[
                                   Expanded(child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       TextView('Feet',size: 13,weight: FontWeight.w500,colors: Theme.of(context).hintColor
                                         ,mergin: const EdgeInsets.only(left: 2,bottom: 8),),
                                       TextField(
                                         controller: feedController,
                                         focusNode: wightFocus,
                                         decoration: InputDecoration(
                                           border: OutlineInputBorder(),
                                           labelText: '',
                                             contentPadding: const EdgeInsets.only(left: 10),
                                             errorText: errorbox1?'Is required':null

                                         ),
                                         maxLines: 1,
                                         keyboardType: TextInputType.number,
                                         textInputAction: TextInputAction.done,

                                       ),
                                     ],
                                   )),
                                   Container(width: 10,),
                                   Expanded(child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       TextView('Inch',size: 13,weight: FontWeight.w500,colors: Theme.of(context).hintColor
                                         ,mergin: const EdgeInsets.only(left: 2,bottom: 8),),
                                       TextField(
                                         controller: inchController,
                                         focusNode: heightFocus,
                                         decoration: InputDecoration(
                                           border: OutlineInputBorder(),
                                           labelText: '',
                                             contentPadding: const EdgeInsets.only(left: 10),
                                             errorText: errorbox2?'Is required':null


                                         ),
                                         maxLines: 1,
                                         keyboardType: TextInputType.number,
                                         textInputAction: TextInputAction.done,

                                       ),
                                     ],
                                   )),


                                 ],
                               ),
                             ),


                             RaisedButton(
                               onPressed: validation,
                               color: background,
                               splashColor: Theme.of(context).backgroundColor,
                               child: TextView('Save',size: 18,colors: Theme.of(context).primaryColor,
                                 weight: FontWeight.w600,
                                 padding: const EdgeInsets.only(top: 15,bottom: 15,left: 45,right: 35),),
                             ),


                             TextView('Do you know about sugar?'
                               ,weight: FontWeight.w400,mergin: const EdgeInsets.only(top: 35,left: 20,right: 20),
                               colors: Theme.of(context).primaryColor,size: 20,),

                           ],
                         ),
                       ),
                     ),
                   ),



                 ],
               ),
             ),
           ),
         ),
      );
  }
  validation(){
    setState(() {
      errorbox2=false;
      errorbox1=false;
    });

    if(!AppUtils.isBigZero(feedController.text.toString().trim())){
      setState(() {

        errorbox1=true;
      });
    }else if(!AppUtils.isBigZero(inchController.text.toString().trim())){
      setState(() {
        errorbox2=true;
      });

    }else{
      widget.appointmentModel.feed=feedController.text.toString().trim();
      widget.appointmentModel.inch=inchController.text.toString().trim();
      Navigator.pop(context,widget.appointmentModel);
    }
  }
}