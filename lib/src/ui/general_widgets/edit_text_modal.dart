import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upbaseexercise/src/bloc/formvalidator_bloc.dart';
import 'package:upbaseexercise/src/ui/general_widgets/custom_material_button.dart';
import 'package:upbaseexercise/src/ui/general_widgets/edit_text_general.dart';
import 'package:upbaseexercise/src/utils/app_utilities.dart';
import 'package:upbaseexercise/src/values/colors.dart';

class EditTextModal extends StatefulWidget {
  String hint;
  String label;
  EditTextModal(this.hint, this.label);

  @override
  _EditTextModalState createState() => _EditTextModalState();
}

class _EditTextModalState extends State<EditTextModal> {
  TextEditingController _controller = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                decoration: BoxDecoration(
                    color: AppColors.primaryBackground,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                          close(context);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    EditTextGeneral(
                        controller: null,
                        validatorCallback:
                            formValidatorBloc.singleInputValidator,
                        labelText: 'Address',
                        labelColor: AppColors.primaryText.withOpacity(0.69968),
                        hintText: '2, Foreshore Avenue, Lekki, Lagos',
                        hintColor: AppColors.primaryText.withOpacity(0.24468),
                        textInputType: TextInputType.number),
                    SizedBox(
                      height: 18,
                    ),
                    Center(
                      child: CustomMaterialButton(
                        title: 'Continue',
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            Navigator.pop(context, _controller.text);
                          }
                        },
                        color: AppColors.primaryElement,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  close(context) {
    Navigator.pop(context);
  }
}
