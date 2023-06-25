import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:portfolio/commons/custom_button.dart';
import 'package:portfolio/commons/is_mobileCall.dart';
import 'package:portfolio/models/about.dart';
import 'package:portfolio/screens/contact_me/contact_viewmodel.dart';
import 'package:portfolio/screens/stateful_wrapper.dart';

class ContactBody extends StatelessWidget {
  final ContactMeViewmodel viewmodel;
  const ContactBody({Key? key, required this.viewmodel}) : super(key: key);

  Future<About?> getAboutStuff() {
    return viewmodel.getAboutStuff();
  }

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    var _theme = Theme.of(context);
    return StatefulWrapper(
      onInit: () {
        getAboutStuff().then((value) => viewmodel.about = value);
      },
      child: SingleChildScrollView(
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
                  ? _columnLayout(_theme, context, parser)
                  : _rowLayout(_theme, context, parser),
            ],
          ),
        ),
      ),
    );
  }

  Widget _columnLayout(ThemeData _theme, context, parser) {
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                parser.emojify("Contact Me :mailbox_with_mail:"),
                style: _theme.textTheme.displayMedium,
              ),
              Text(
                "Send a Message",
                style: _theme.textTheme.displayLarge,
              ),
              SizedBox(height: 10),
              Text(
                "Interested in working together? " +
                    "Feel free to contact me.\n\n" +
                    "House 19, Block B, Road 3,\n" +
                    "Keraniganj Model Town,\n" +
                    "Dhaka 1310, Bangladesh\n" +
                    "karimulhasan1998@gmail.com",
                style: _theme.textTheme.bodyLarge!
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
              viewmodel.isLoading == false
                  ? CustomButtom(
                      onPressed: () async {
                        if (viewmodel.name.isEmpty ||
                            viewmodel.email.isEmpty ||
                            viewmodel.subject.isEmpty ||
                            viewmodel.message.isEmpty) {
                          viewmodel.isLoading = false;
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Error!"),
                              content: Text("Please fill all the fields!"),
                              actions: [
                                CustomButtom(
                                  onPressed: () => Navigator.pop(context),
                                  text: "Ok",
                                  color: _theme.colorScheme.primary,
                                  tColor: _theme.colorScheme.primary,
                                ),
                              ],
                            ),
                          );
                        } else {
                          viewmodel.isLoading = true;
                          var res = await viewmodel.sendMessage();
                          if (res.success) {
                            viewmodel.isLoading = false;
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Success!"),
                                content: Text("Message sent successfully!"),
                                actions: [
                                  CustomButtom(
                                    onPressed: () => Navigator.pop(context),
                                    text: "Ok",
                                    color: _theme.colorScheme.primary,
                                    tColor: _theme.colorScheme.primary,
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      },
                      text: "Send Message!",
                      color: _theme.colorScheme.secondary,
                      tColor: _theme.colorScheme.secondary,
                    )
                  : Center(
                      child: CircularProgressIndicator(),
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
            child: viewmodel.about != null
                ? Image(
                    height: 800,
                    image: CachedNetworkImageProvider(
                        viewmodel.about!.location.url!),
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please wait...",
                          style: _theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              "Note: This whole website was created with only Flutter!",
              style: _theme.textTheme.bodyLarge!.copyWith(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowLayout(ThemeData _theme, BuildContext context, parser) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    parser.emojify("Contact Me :mailbox_with_mail:"),
                    style: _theme.textTheme.displayMedium,
                  ),
                  Text(
                    "Send a Message",
                    style: _theme.textTheme.displayLarge,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Interested in working together? " +
                        "Feel free to contact me.\n\n" +
                        "House 19, Block B, Road 3,\n" +
                        "Keraniganj Model Town,\n" +
                        "Dhaka 1310, Bangladesh\n" +
                        "karimulhasan1998@gmail.com",
                    style: _theme.textTheme.bodyLarge!
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
                  viewmodel.isLoading == false
                      ? CustomButtom(
                          onPressed: () async {
                            if (viewmodel.name.isEmpty ||
                                viewmodel.email.isEmpty ||
                                viewmodel.subject.isEmpty ||
                                viewmodel.message.isEmpty) {
                              viewmodel.isLoading = false;
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Error!"),
                                  content: Text("Please fill all the fields!"),
                                  actions: [
                                    CustomButtom(
                                      onPressed: () => Navigator.pop(context),
                                      text: "Ok",
                                      color: _theme.colorScheme.primary,
                                      tColor: _theme.colorScheme.primary,
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              viewmodel.isLoading = true;
                              var res = await viewmodel.sendMessage();
                              if (res.success) {
                                viewmodel.isLoading = false;
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("Success!"),
                                    content: Text("Message sent successfully!"),
                                    actions: [
                                      CustomButtom(
                                        onPressed: () => Navigator.pop(context),
                                        text: "Ok",
                                        color: _theme.colorScheme.primary,
                                        tColor: _theme.colorScheme.primary,
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                          text: "Send Message!",
                          color: _theme.colorScheme.secondary,
                          tColor: _theme.colorScheme.secondary,
                        )
                      : Center(
                          child: CircularProgressIndicator(),
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
                child: viewmodel.about != null
                    ? Image(
                        height: 800,
                        image: CachedNetworkImageProvider(
                            viewmodel.about!.location.url!),
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Please wait...",
                              style: _theme.textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Text(
            "Note: This whole website was created with only Flutter!",
            style: _theme.textTheme.bodyLarge!.copyWith(fontSize: 15),
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
      style: _theme.textTheme.bodyLarge!.copyWith(
        fontSize: 20,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: _theme.textTheme.bodyLarge!.copyWith(
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
