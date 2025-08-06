import 'package:flutter/material.dart';
import 'package:homerentapp/widgets/custom_icon_button.dart';

import '../util/app_colors.dart';

class service_details_screen extends StatelessWidget {
  const service_details_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.background,
      //appbar
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/service_image.png'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 16.0,
                              left: 16.0,
                              child: CircleAvatar(
                                backgroundColor: appcolors.offwhite,
                                child: IconButton(
                                  icon: Icon(Icons.arrow_back, color: Colors.white),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 16.0,
                              right: 16.0,
                              child: CircleAvatar(
                                backgroundColor: appcolors.offwhite,
                                child: IconButton(
                                  icon: Icon(Icons.bookmark_border, color: Colors.white),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Positioned(
                              left: 16.0,
                              bottom: 16.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      'Luxury Hotel',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      '5-star hotel with all amenities',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.bed, color: Colors.white),
                                      SizedBox(width: 8.0),
                                      Text(
                                        '2 Beds',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(width: 16.0),
                                      Icon(Icons.bathtub, color: Colors.white),
                                      SizedBox(width: 8.0),
                                      Text(
                                        '1 Bath',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'DESCRIPTION',
                        style: TextStyle(
                          color: appcolors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //some description text with see more option in primary color
                    Text.rich(
                      TextSpan(
                        text: 'This luxury hotel offers a unique experience with top-notch amenities and services. Enjoy your trip.... ',
                        style: TextStyle(
                          color: appcolors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'See more',
                            style: TextStyle(
                              color: appcolors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    //create row(circle avatar, owner name, title, conatact button, chat button)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage: NetworkImage('https://avatar.iran.liara.run/public'),
                            ),
                            SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Brother Sajedul Islam',
                                  style: TextStyle(
                                    color: appcolors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Owner',
                                  style: TextStyle(
                                    color: appcolors.offwhite,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomIconButton(icon: Icons.phone),
                            SizedBox(width: 10.0),
                            CustomIconButton(icon: Icons.chat),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 30.0),
                    // Gallery Section
                    Text(
                      'Gallery',
                      style: TextStyle(
                        color: appcolors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      height: 120.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildGalleryItem('assets/images/hotel1.png'),
                          SizedBox(width: 12.0),
                          _buildGalleryItem('assets/images/hotel2.png'),
                          SizedBox(width: 12.0),
                          _buildGalleryItem('assets/images/hotel3.png'),
                          SizedBox(width: 12.0),
                          _buildGalleryItemWithCounter('assets/images/hotel4.png', '+5'),
                        ],
                      ),
                    ),
                    // Add extra padding at bottom for floating section
                    SizedBox(height: 120.0),
                  ],
                ),
              ),
            ),
          ),
          // Bottom floating section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Rp. 2.500.000.000 / Year',
                          style: TextStyle(
                            color: appcolors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appcolors.primary,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: Text(
                        'Rent Now',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryItem(String imagePath) {
    return Container(
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildGalleryItemWithCounter(String imagePath, String counter) {
    return Container(
      width: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Text(
          counter,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}