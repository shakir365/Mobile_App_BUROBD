import 'package:buro_employee/repository/bloc/create_account/create_account_cubit.dart';
import 'package:buro_employee/repository/network/buro_repository.dart';
import 'package:buro_employee/utilities/common_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../localization/Language/languages.dart';
import '../../theme/colors.dart';
import '../../theme/styles.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/alert_dialog_widget.dart';
import 'login_screen.dart';

class CreateAccount extends StatefulWidget {
  static const routeName = '/createAccount';

  static route() =>
      MaterialPageRoute(builder: (_) => CreateAccount());
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

    final _formKey = GlobalKey<FormState>();
    String name = '';
    String pin = '';
    String email = '';
    String password = '';
    String confirmPassword = '';

    bool _obscurePassword = true;
    bool _obscureConfirmPassword = true;

    late CreateAccountCubit createAccountCubit;
    late BuroRepository buroRepository;

    late TextEditingController _nameController;
    late TextEditingController _emailController;
    late TextEditingController _pinController;
    late TextEditingController _password;
    late TextEditingController _confirmPassword;
    late TextEditingController _mobileOTP;
    late TextEditingController _mobileOTPSuggassionText;




    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: ColorResources.WHITE),
            backgroundColor: ColorResources.APP_THEME_COLOR,
            title: Text('Create Account',
              style: TextStyle(color: ColorResources.WHITE),
            ),),
        body: BlocConsumer<CreateAccountCubit, CreateAccountState>(
          listener: (context, state) {
            if (state is CreateAccountLoadingState) {
              CommonMethods.showLoaderDialog(context);
            }

            if (state is CreateAccountLoadedState) {
              CommonMethods.hideLoaderDialog(context);
              if (state.data.success == false) {
                showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialogWidget(
                        title: "Invalid Input",
                        description: "Please enter valid Identification Number",
                      ),
                );
              }
            }
            /*if (state is CreateAccountLoadedState || state is CreateAccountErrorState) {
              // hide loader when loading ends
              CommonMethods.hideLoaderDialog(context);
            }*/
            if (state is CreateAccountErrorState) {
              final snackBar = SnackBar(
                content: Text(Languages.of(context)!.internetErrorText),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is CreateAccountInitialState){
              return createAccountForm();
            }
              else  if(state is CreateAccountLoadingState)    {
              return createAccountForm();
              } else if (state is CreateAccountLoadedState){

                if(state.data.success != false){
                  _nameController.text = state.data.data![0].employeeName.toString();
                  _emailController.text = state.data.data![0].email.toString();
                  _pinController.text = _pinController.text;
                  _mobileOTPSuggassionText.text  = '${Languages.of(context)!.otpTextMobile} \n ${state.data.data![0].selFMOBILE}';
                }

                return createAccountForm();


              } else {

                return Center(child: Text('Network Error'),);
              }

          },
        ),
      );

  }



  Widget createAccountForm(){

      return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.only(top: 10,bottom: 10),
          children: [
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorResources.TEXT_FIELD_COLOR,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: ColorResources.APP_THEME_COLOR,
                        style: BorderStyle.solid,
                        width: 2)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                      width: 0.0),
                ),
                hintText: 'Identification Number',
                labelText: 'Identification Number',

                contentPadding: EdgeInsets.all(20),
                hintStyle:
                TextStyle(color: ColorResources.GREY_SEVENTY),


              ),
              onChanged: (value){

                //print('OnChanged Called');
                if(value.trim().length == 5){
                  createAccountCubit.getEmpInfoRegistration(_pinController.text);
                }

                password = value!;
                //print('password $password');
              },
              onSaved: (value) => pin = value!,
              controller: _pinController,
              keyboardType: TextInputType.number,
              maxLength: 5,
              validator: (value) =>
              value!.isEmpty ? 'Please enter Identification Number' : null,
            ),
            /// Name
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorResources.TEXT_FIELD_COLOR,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: ColorResources.APP_THEME_COLOR,
                        style: BorderStyle.solid,
                        width: 2)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                      width: 0.0),
                ),
                hintText: 'Name',
                labelText: 'Name',
                contentPadding: EdgeInsets.all(20),
                hintStyle:
                TextStyle(color: ColorResources.GREY_SEVENTY),
              ),
              onSaved: (value) => name = value!,
              controller: _nameController,
              validator: (value) =>
              value!.isEmpty ? 'Please enter your name' : null,
            ),
            SizedBox(height: 20,),
            /// Email
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorResources.TEXT_FIELD_COLOR,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: ColorResources.APP_THEME_COLOR,
                        style: BorderStyle.solid,
                        width: 2)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                      width: 0.0),
                ),
                hintText: 'Email',
                labelText: 'Email',
                contentPadding: EdgeInsets.all(20),

                hintStyle:
                TextStyle(color: ColorResources.GREY_SEVENTY),
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) => email = value!,
              controller: _emailController,
              validator: (value) {
                if (value!.isEmpty) return 'Please enter your email';
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value)) return 'Enter valid email';
                return null;
              },
            ),
            SizedBox(height: 5,),

            SizedBox(height: 5,),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorResources.TEXT_FIELD_COLOR,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: ColorResources.APP_THEME_COLOR,
                        style: BorderStyle.solid,
                        width: 2)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                      width: 0.0),
                ),
                hintText: 'Mobile Number',
                labelText: 'Mobile Number',

                contentPadding: EdgeInsets.all(20),
                hintStyle:
                TextStyle(color: ColorResources.GREY_SEVENTY),


              ),
              onChanged: (value){


              },

              controller: _mobileOTP,
              keyboardType: TextInputType.number,
              maxLength: 5,
              //maxLengthEnforcement: MaxLengthEnforcement.enforced,
              validator: (value) =>
              value!.isEmpty ? 'Please enter your Mobile Number' : null,
            ),

            TextFormField(
              enabled: false,
              controller: _mobileOTPSuggassionText,
              decoration: InputDecoration(

                border: InputBorder.none, // 👈 removes border
              ),

              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  color: ColorResources.GREY_DARK_SIXTY),

            ),

            SizedBox(height: 10,),
            /// Password
            TextFormField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: ColorResources.TEXT_FIELD_COLOR,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: ColorResources.APP_THEME_COLOR,
                        style: BorderStyle.solid,
                        width: 2)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                      width: 0.0),
                ),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
              onChanged: (value){
                password = value!;
                print('password $password');
              },
              onSaved: (value) {
                password = value!;

                print('password $password');
              },
              controller: _password,
              validator: (value) =>
              value!.length < 6 ? 'Password must be at least 6 chars' : null,
            ),
            SizedBox(height: 20,),
            /// Confirm Password
            TextFormField(
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorResources.TEXT_FIELD_COLOR,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: ColorResources.APP_THEME_COLOR,
                          style: BorderStyle.solid,
                          width: 2)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: ColorResources.TEXT_FIELD_BORDER_COLOR,
                        width: 0.0),
                  ),
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () => setState(() =>
                    _obscureConfirmPassword = !_obscureConfirmPassword),
                  ),
                ),
                controller: _confirmPassword,

                validator: (value) {

                  print('old pass $password new pass $value');


                  return value!.trim() != password.trim() ? 'Passwords do not match' : null;
                }

            ),
            const SizedBox(height: 20),
            /// Submit Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0, backgroundColor: ColorResources.APP_THEME_COLOR,
                minimumSize: const Size.fromHeight(50), // NEW
              ),
              child: Container(
                height: 56,
                child: Center(
                  child: Text(
                    'Create Account',
                    style: Styles.buttonTextStyle,
                  ),
                ),
              ),
              onPressed: () {
                final form = _formKey.currentState;
                if (form!.validate()) {
                  form.save();
                  // Perform registration logic
                  /*ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Account Created!')));*/

                  createAccountCubit.submitChangePass(_pinController.text.trim(),_mobileOTP.text,    _password.text , _confirmPassword.text).then(
                          (value) => {
                        if (value?.success == true) {
                          CommonMethods.showMessage(context, 'Account Created Successfully', ColorResources.APP_THEME_COLOR),
                          Navigator.pop(context),
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              LoginScreen.routeName,
                                  (route) => false),
                        }

                      });

                }
              },
            )
          ],
        ),
      ),
    );


  }

    @override
  void initState() {

      _nameController = TextEditingController();
      _emailController = TextEditingController();
      _pinController = TextEditingController();
      _password = TextEditingController();
      _confirmPassword = TextEditingController();
      _mobileOTP = TextEditingController();
      _mobileOTPSuggassionText = TextEditingController();
      buroRepository = BuroRepository();

      createAccountCubit = context.read<CreateAccountCubit>();
    //createAccountCubit = CreateAccountCubit(buroRepository);
    super.initState();
  }


 @override
  void dispose() {
    //createAccountCubit.close();
    _nameController.clear();
    _pinController.clear();
    _emailController.clear();
    _password.clear();
    _confirmPassword.clear();
    _mobileOTP.clear();
    _mobileOTPSuggassionText.clear();
    super.dispose();
  }



}
