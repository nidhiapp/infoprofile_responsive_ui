import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/custom_validation.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_drop_down_textfield.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textfield.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  TextEditingController nameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController userNameCont = TextEditingController();
  TextEditingController mobileNoCont = TextEditingController();
   TextEditingController bioCont=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          height: 410,
          width: 1000,
          decoration: BoxDecoration(

            color: AppColors.logincardColor,
            
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(alignment: Alignment.topLeft,
                child: Column(
                  children: [Text("Profile",  
                   style: GoogleFonts.poppins(
                        textStyle:TextStyle(
                        color:  Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
              
                       ), ),
                       ),
                    Container(
                      height: 3,width: 80,
                      decoration: BoxDecoration( color: const Color.fromARGB(255, 21, 110, 182),
                        borderRadius: BorderRadius.circular(20),
                               ),
                            
                    ),
                  ],
                ),
              ),
               SizedBox(
                height: 10,
              ),
              Container(height: 2,decoration: BoxDecoration(
                color: Color.fromRGBO(225, 226, 227, 1),),),
                 SizedBox(
                height: 20,
              ),
              Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: AppColors.borderCol)),
                  child: ClipOval(
                      child: CachedNetworkImage(
                    imageUrl: AppLink.defaultFemaleImg,
                    height: 126,
                    width: 126,
                    fit: BoxFit.cover,
                  )),
                ),
                Positioned(
                    top: 80,
                    left: 85,
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 1.1097561120986938),
                                blurRadius: 23.304880142211914,
                                spreadRadius: 0,
                                color: AppColors.logincardColor)
                          ],
                          shape: BoxShape.circle),
                      child: Center(
                          child: Icon(
                        Icons.image_outlined,
                        color: AppColors.logincardColor,
                        size: 30,
                      )),
                    ))
              ]),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                    borderCol: AppColors.greyCol,
                    enBorderCol:AppColors.borderCol ,
                    customController: nameCont,
                    hintext: "Enter your name",
                    prefixicon: Icons.person,
                    iconCol: AppColors.primaryColor,
                    customValidator: Utils.isValidName,
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomTextField(
                    borderCol: AppColors.greyCol,
                    enBorderCol:AppColors.borderCol ,
                    customController:userNameCont,
                    hintext: "Enter your user name",
                    prefixicon: Icons.person_4_outlined,
                    iconCol: AppColors.primaryColor,
                    customValidator: Utils.isValidName,
                  )),
                ],
              ),
             SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomDropdownFormField<String>(
                     prefIcon: Icons.transgender_outlined,
                        label: 'Select Gender',
                        items: ['Male', 'Female', 'Other'],
                        onChanged: (String? value) {
                          print('Selected Gender: $value');
                        },
                        
                        hintText: 'Select Gender',
                        borderColor: AppColors.borderCol, 
                        dropdownIconColor: AppColors.primaryColor, 
                      ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                       Expanded(
                         child: CustomDropdownFormField<DateTime>(
                                 label: 'Select Date',
                                items: [], // You can leave this empty for date picker
                                onChanged: (DateTime? value) {
                                  print('Selected Date: $value');
                                },
                                hintText: 'Select Date',
                                borderColor:AppColors.borderCol, // Customize border color
                                dropdownIconColor: AppColors.primaryColor,   // Customize dropdown icon color
                                useDatePicker: true, // Use date picker instead of dropdown
                                   ),
                       ),
                ],
              ),
            ],
          ),
        ),
         SizedBox(height: 60,),
         Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Bio",
              style: GoogleFonts.poppins(
      textStyle:TextStyle(
      color:  Color.fromRGBO(158, 159, 160, 1),
        fontSize: 18,
        fontWeight: FontWeight.w600,

        ), ),
             ),
              SizedBox(height: 20,),
         Container(
          padding: EdgeInsets.all(20),
            height: 100,
          width: 1000,
          decoration: BoxDecoration(
            color: AppColors.logincardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child:CustomTextField(
                    customController: bioCont,
                    borderCol: AppColors.greyCol,
                    enBorderCol:AppColors.borderCol ,
                    hintext: "Write description",
                    prefixicon: Icons.edit_note,
                    iconCol: AppColors.primaryColor,
                    //customValidator: Utils.isValidName,
          ) ,),
           ],
         ),
       


         SizedBox(height: 60,),
         Column(crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Contact Information",
             style: GoogleFonts.poppins(
      textStyle:TextStyle(
      color:  Color.fromRGBO(158, 159, 160, 1),
        fontSize: 18,
        fontWeight: FontWeight.w600,

        ), ),
        ),
              SizedBox(height: 20,),
              Container(padding: EdgeInsets.all(20),
          height: 150,
          width: 1000,
          decoration: BoxDecoration(
            color: AppColors.logincardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: 
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    borderCol: AppColors.greyCol,
                    enBorderCol:AppColors.borderCol ,
                    customController: mobileNoCont,
                    hintext: "Enter your mobile number",
                    prefixicon: Icons.phone,
                    iconCol: AppColors.primaryColor,
                    customValidator: Utils.isValidph,
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomTextField(
                   borderCol: AppColors.greyCol,
                    enBorderCol:AppColors.borderCol ,
                    customController: emailCont,
                    hintext: "Enter your Email",
                    prefixicon: Icons.email,
                    iconCol: AppColors.primaryColor,
                    customValidator: Utils.isValidEmailNull,
                  )),
                ],
              ),
              )
           ],
         ),

         SizedBox(height: 30,),
         Container(constraints:BoxConstraints(maxHeight: 56,maxWidth: 278),
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),

          color: Color.fromRGBO(7, 99, 198, 1),),
          child: Center(child: Text("Save",
                     style: GoogleFonts.poppins(
                        textStyle:TextStyle(
                        color:  AppColors.logincardColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
              
                       ), ),)),
          )
       
      ],
    );

  
  }
}
