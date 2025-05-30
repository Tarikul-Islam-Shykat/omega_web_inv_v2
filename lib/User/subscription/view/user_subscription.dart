import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omega_web_inv/core/generated/assets.dart';

import '../../../core/const/app_colors.dart';
import '../../../core/style/global_text_style.dart';

class UserSubscriptionScreen extends StatelessWidget {
  const UserSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBaseColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBarSection(),
            contactItem(
              asset: "https://i.pravatar.cc/150?img=10",
              contactName: "Wade Warren",
              subtitle: "allisonmat@gmail.com",
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Text(
                    "Subscription Package",
                    style: globalTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4A4F5E),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: appDeepBlueColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [
                        SvgPicture.asset(Assets.iconsCrownIcon),
                        SizedBox(height: 12.0),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "£25 (3-Year)",
                            style: globalTextStyle(color: Color(0xFFFBDB6B)),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          "The best value for long-term memory preservation and digital legacy.",
                          textAlign: TextAlign.center,
                          style: globalTextStyle(color: Color(0xFFF4E6B3)),
                        ),
                        SizedBox(height: 18.0),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            gradient: LinearGradient(
                              colors: [Color(0xFFFBB040), Color(0xFFF9ED32)],
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Active due : 29/04/2025",
                              style: globalTextStyle(color: Color(0xFF162868)),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 36.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      backgroundColor: appDeepBlueColor,
                    ),
                    child: Text(
                      "Choose New Package",
                      style: globalTextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBarSection() {
    return Container(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 40.0,
        bottom: 28.0,
      ),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(color: appBlueColor),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SvgPicture.asset(Assets.iconsAppbarHeadingName),
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 22.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appDeepBlueColor,
                ),
                child: Icon(Icons.arrow_back, color: appIconBlueColor),
              ),
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  'Subscription',
                  style: globalTextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),

              Opacity(
                opacity: 0.0,
                child: Container(
                  margin: const EdgeInsets.only(left: 22.0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                    color: appDeepBlueColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Save',
                    style: globalTextStyle(color: Color(0xFF6E7FB9)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget contactItem({
    String asset = '',
    String contactName = '',
    String subtitle = "",
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundImage: CachedNetworkImageProvider(asset),
      ),
      title: Text(
        contactName,
        style: globalTextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: globalTextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget infoLineIndividual({String title = "", String value = ""}) {
    return Text(
      "$title : $value",
      style: GoogleFonts.plusJakartaSans(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
