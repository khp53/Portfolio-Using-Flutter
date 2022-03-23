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
        margin: isMobile(context)
            ? EdgeInsets.all(15)
            : EdgeInsets.only(
                left: 40,
                top: 40,
                bottom: 40,
              ),
        padding: isMobile(context)
            ? EdgeInsets.all(15)
            : EdgeInsets.only(
                left: 40,
                top: 40,
                bottom: 40,
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              Text(
                "Contact Me 📬",
                style: _theme.textTheme.headline2,
              ),
              Text(
                "Send a Message",
                style: _theme.textTheme.headline1,
              ),
              SizedBox(height: 10),
              Text(
                "Interested in working together? " +
                    "Feel free to contact me.\n\n" +
                    "House 15, Block B, Road 1,\n" +
                    "Keraniganj Model Town,\n" +
                    "Dhaka 1310, Bangladesh\n" +
                    "karimulhasan1998@gmail.com",
                style: _theme.textTheme.bodyText1!
                    .copyWith(fontSize: 20, height: 1.5),
              ),
              SizedBox(
                height: 35,
              ),
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

          //-----
          SizedBox(
            height: 40,
          ),
          Container(
            //height: 1000,
            width: double.infinity,
            child: Image(
              height: 800,
              image: AssetImage('assets/images/location.jpg'),
              fit: BoxFit.cover,
            ),
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
              Text(
                "Contact Me 📬",
                style: _theme.textTheme.headline2,
              ),
              Text(
                "Send a Message",
                style: _theme.textTheme.headline1,
              ),
              SizedBox(height: 10),
              Text(
                "Interested in working together? " +
                    "Feel free to contact me.\n\n" +
                    "House 15, Block B, Road 1,\n" +
                    "Keraniganj Model Town,\n" +
                    "Dhaka 1310, Bangladesh\n" +
                    "karimulhasan1998@gmail.com",
                style: _theme.textTheme.bodyText1!
                    .copyWith(fontSize: 20, height: 1.5),
              ),
              SizedBox(
                height: 35,
              ),
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
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: Container(
            //height: 1000,
            width: double.infinity,
            child: Image(
              height: 800,
              image: AssetImage('assets/images/location.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
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
