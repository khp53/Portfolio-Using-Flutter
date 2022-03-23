import 'package:flutter/material.dart';
import 'package:portfolio/commons/custom_button.dart';
import 'package:portfolio/commons/is_mobileCall.dart';
import 'package:portfolio/screens/contact_me/contact_viewmodel.dart';

class ContactBody extends StatelessWidget {
  final ContactMeViewmodel viewmodel;
  const ContactBody({Key? key, required this.viewmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        margin: isMobile(context) ? EdgeInsets.all(15) : EdgeInsets.all(40),
        padding: isMobile(context) ? EdgeInsets.all(15) : EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contact Me 📬",
              style: _theme.textTheme.headline2,
            ),
            Text(
              "Send a Message",
              style: _theme.textTheme.headline1,
            ),
            SizedBox(
              height: 35,
            ),
            isMobile(context)
                ? _columnLayout(_theme, context)
                : _rowLayout(_theme, context),
          ],
        ),
      ),
    );
  }

  Widget _columnLayout(ThemeData _theme, context) {
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  onChanged: (value) {
                    viewmodel.email = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: _theme.textTheme.bodyText1,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _rowLayout(ThemeData _theme, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: customField(
                  _theme,
                  "Name",
                  (value) {
                    viewmodel.name = value;
                  },
                  1,
                  //TextInputAction.next,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: customField(
                  _theme,
                  "Email",
                  (value) {
                    viewmodel.email = value;
                  },
                  1,
                  //TextInputAction.next,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: customField(
                  _theme,
                  "Subject",
                  (value) {
                    viewmodel.subject = value;
                  },
                  1,
                  //TextInputAction.next,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: customField(
                  _theme,
                  "Message",
                  (value) {
                    viewmodel.message = value;
                  },
                  5,
                  //TextInputAction.done,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              CustomButtom(
                onPressed: () {},
                text: "Send Message!",
                color: _theme.colorScheme.secondary,
                tColor: _theme.colorScheme.secondary,
              ),
            ],
          ),
        ),

        //-----
      ],
    );
  }

  TextFormField customField(ThemeData _theme, String hintText,
      Function(String)? onChanged, int? lineNo) {
    return TextFormField(
      minLines: lineNo,
      maxLines: lineNo,
      //textInputAction: textIA,
      style: _theme.textTheme.bodyText1!.copyWith(
        fontSize: 20,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: _theme.textTheme.bodyText1!.copyWith(
          color: Colors.grey,
          fontSize: 20,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
  }
}
