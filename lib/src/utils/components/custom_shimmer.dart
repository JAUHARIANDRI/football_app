import 'package:flutter/material.dart';
import 'package:football_app/src/utils/values/colors.dart';
import 'package:football_app/src/utils/values/dimens.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer {
  static Widget loadingListHorizontal() {
    return Container(
      color: backgroundColor,
      height: 140,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 8.0, right: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: <Widget>[
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey[300],
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    height: 80,
                    width: 112,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                // Shimmer.fromColors(
                //   highlightColor: Colors.white,
                //   baseColor: Colors.grey[300],
                //   child: Container(
                //     margin: EdgeInsets.all(8.0),
                //     height: 20,
                //     width: 112,
                //     decoration: BoxDecoration(
                //       color: Colors.grey,
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }

  static Widget loadingAllLeagues() {
    return Container(
      height: 140,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            child: Container(
              width: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              margin: EdgeInsets.only(right: 8.0),
              child: Container(
                padding: EdgeInsets.all(4.0),
                child: Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey[300],
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: 2,
      ),
    );
  }

  static Widget loadingListVertical(double size) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: Colors.grey[300],
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(4.0),
              height: size,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }

  static Widget loadingListGrid() {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: double.infinity,
      child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: <Widget>[
                        Shimmer.fromColors(
                          highlightColor: Colors.white,
                          baseColor: Colors.grey[300],
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Shimmer.fromColors(
                          highlightColor: Colors.white,
                          baseColor: Colors.grey[300],
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: <Widget>[
                        Shimmer.fromColors(
                          highlightColor: Colors.white,
                          baseColor: Colors.grey[300],
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Shimmer.fromColors(
                          highlightColor: Colors.white,
                          baseColor: Colors.grey[300],
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  static Widget loadingCard() {
    return Container(
      width: double.infinity,
      height: 80,
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: Colors.grey[300],
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  static Widget loadingProfile() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: ListView(
        children: <Widget>[
          SizedBox(height: marginActivity),
          Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.grey[300],
              child: CircleAvatar(
                radius: 34,
              )),
          Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey[300],
            child: Container(
              margin: EdgeInsets.all(8.0),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget loadingDetailItem() {
    return Container(
      //color: Colors.white,
      width: double.infinity,
      child: ListView(
        children: <Widget>[
          SizedBox(height: marginActivity),
          Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey[300],
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey[300],
            child: Container(
              margin: EdgeInsets.all(8.0),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey[300],
            child: Container(
              margin: EdgeInsets.all(8.0),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
