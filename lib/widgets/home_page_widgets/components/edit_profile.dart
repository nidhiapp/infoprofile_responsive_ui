import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_profile_ui/widgets/home_page_widgets/components/blue_circular_image.dart';
import 'package:info_profile_ui/models/user_profile.dart';
import 'package:info_profile_ui/repository/feed/feed_apis.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/custom_validation.dart';
import 'package:info_profile_ui/utils/routes/app_routes_constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/circular_network_img.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_drop_down_textfield.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textfield.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/edit_profile.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController userNameCont = TextEditingController();
  final TextEditingController mobileNoCont = TextEditingController();
  final TextEditingController desCont = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String dob;
    String gender;
    return Consumer<EditProfileProvider>(
      builder: (context, editProfileAndProfile, child) {
        return StreamBuilder<UserProfileModel?>(
          stream: editProfileAndProfile.getUserDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final userData = snapshot.data!;
              nameCont.text = userData.name ?? "";
              emailCont.text = userData.email ?? "";
              userNameCont.text = userData.username ?? "";
              mobileNoCont.text = userData.mobile ?? "";
              desCont.text = userData.about ?? "";
              dob = userData.dob ?? "";
              gender = userData.gender ?? "";
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    height: 410,
                    decoration: BoxDecoration(
                      color: AppColors.logincardColor,
                      border: Border.all(color: AppColors.borderCol),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Text(
                                AppTexts.profile,
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                height: 3,
                                width: 80,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 21, 110, 182),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 2,
                            decoration: const BoxDecoration(
                              color: AppColors.lightGreyCol,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Consumer<EditProfileProvider>(
                          builder: (context, value, child) {
                            return Stack(children: [
                              Container(
                                  height: 126,
                                  width: 126,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 2,
                                          color: AppColors.borderCol)),
                                  child: value.isPicked
                                      ? Image.memory(
                                          value.webImage!,
                                          fit: BoxFit.cover,
                                        )
                                      : CircularNetworkImage(
                                          imageUrl: AppLink.defaultFemaleImg,
                                          height: 126,
                                          width: 126,
                                          //fit: BoxFit.cover,
                                        )),
                              Positioned(
                                  top: 80,
                                  left: 85,
                                  child: InkWell(
                                      onTap: value.pickImageFromDevice,
                                      child: const BlueCircularImage()))
                            ]);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Row(
                            children: [
                              Expanded(
                                  child: CustomTextField(
                                borderCol: AppColors.greyCol,
                                enBorderCol: AppColors.borderCol,
                                customController: nameCont,
                                hintext: AppTexts.enterName,
                                prefixicon: Icons.person,
                                iconCol: AppColors.primaryColor,
                                customValidator: Utils.isValidName,
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: CustomTextField(
                                borderCol: AppColors.greyCol,
                                enBorderCol: AppColors.borderCol,
                                customController: userNameCont,
                                hintext: "user name",
                                prefixicon: Icons.person_4_outlined,
                                iconCol: AppColors.primaryColor,
                                customValidator: Utils.isValidName,
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomDropdownFormField<String>(
                                // prefIcon: ,
                                label: AppTexts.selectGender,
                                items: const [
                                  AppTexts.genderOption1,
                                  AppTexts.genderOption2,
                                  AppTexts.genderOption3
                                ],
                                onChanged: (String? value) async {
                                  //   print('Selected Gender: $value');
                                  await FirebaseFeedRepo()
                                      .updateGenderInProfile(value!);
                                },

                                hintText: AppTexts.selectGender,
                                borderColor: AppColors.borderCol,
                                dropdownIconColor: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: CustomDropdownFormField<DateTime>(
                                label: AppTexts.selectDate,
                                items: const [], // You can leave this empty for date picker
                                onChanged: (DateTime? value) async {
                                  await FirebaseFeedRepo()
                                      .updateDobInProfile(value.toString());
                                  //  print('Selected Date: $value');
                                },
                                hintText: AppTexts.selectDate,
                                borderColor: AppColors
                                    .borderCol, // Customize border color
                                dropdownIconColor: AppColors
                                    .primaryColor, // Customize dropdown icon color
                                useDatePicker:
                                    true, // Use date picker instead of dropdown
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderCol, width: 2),
                      color: AppColors.logincardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppTexts.tagLine,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Color.fromRGBO(158, 159, 160, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 2,
                          decoration: const BoxDecoration(
                            color: AppColors.lightGreyCol,
                          ),
                        ),
                        //    SizedBox(
                        //   height: 20,
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          customController: desCont,
                          borderCol: AppColors.greyCol,
                          enBorderCol: AppColors.borderCol,
                          hintext: AppTexts.writeDes,
                          prefixicon: Icons.edit_note,
                          iconCol: AppColors.primaryColor,
                          //customValidator: Utils.isValidName,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderCol, width: 2),
                      color: AppColors.logincardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppTexts.contactInfo,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Color.fromRGBO(158, 159, 160, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 2,
                          decoration: const BoxDecoration(
                            color: AppColors.lightGreyCol,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: CustomTextField(
                              borderCol: AppColors.greyCol,
                              enBorderCol: AppColors.borderCol,
                              customController: mobileNoCont,
                              hintext: AppTexts.enterMobNum,
                              prefixicon: Icons.phone,
                              iconCol: AppColors.primaryColor,
                              customValidator: Utils.isValidph,
                            )),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: CustomTextField(
                              borderCol: AppColors.greyCol,
                              enBorderCol: AppColors.borderCol,
                              customController: emailCont,
                              hintext: AppTexts.enterMobNum,
                              prefixicon: Icons.email,
                              iconCol: AppColors.primaryColor,
                              customValidator: Utils.isValidEmailNull,
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      bool isUpdated = false;
                      debugPrint(" profile Edited ---- --- --- -- - -- - -- - - - - - -");
                      if (_formKey.currentState!.validate()) {
                        debugPrint(" profile Edited");
                        await editProfileAndProfile .updateProfile(
                                name: nameCont.text.toString().trim(),
                                username: userNameCont.text.toString().trim(),
                                gender: gender.toString().trim(),
                                dob: dob.toString().trim(),
                                about: desCont.text.toString().trim(),
                                mobile: mobileNoCont.text.toString().trim(),
                                email: emailCont.text.toString().trim())
                            .then((value) {
                          isUpdated = true;
                          debugPrint("Edited profile");
                        }).onError((error, stackTrace) {});
                        if (isUpdated && context.mounted) {
                          context.goNamed(MyAppRouteConstants.profilePageRoute,
                              pathParameters: {
                                'uid': FirebaseAuth.instance.currentUser!.uid,
                              });
                        }
                      }
                    },
                    child: Container(
                      constraints:
                          const BoxConstraints(maxHeight: 56, maxWidth: 278),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(7, 99, 198, 1),
                      ),
                      child: Center(
                          child: editProfileAndProfile.loading
                              ? const CircularProgressIndicator(
                                  color: AppColors.logincardColor,
                                )
                              : Text(
                                  AppTexts.save,
                                  style: AppStyle.sixOneSixwhite,
                                )),
                    ),
                  )
                ],
              );
            } else {
              return const SizedBox(
                child: Text("hsddjfhdjhsjhjs"),
              );
            }
          },
        );
      },
    );
  }
}
