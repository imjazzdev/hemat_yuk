import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Color(0xFF235789).withOpacity(0.5),
            highlightColor: Color(0xFF235789),
            child: Container(
              height: 50,
              padding: EdgeInsets.only(bottom: 15),
              width: double.maxFinite,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Color(0xFF235789).withOpacity(0.5),
            highlightColor: Color(0xFF235789),
            child: Container(
              height: 50,
              padding: EdgeInsets.only(bottom: 15),
              width: double.maxFinite,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Color(0xFF235789).withOpacity(0.5),
            highlightColor: Color(0xFF235789),
            child: Container(
              height: 50,
              padding: EdgeInsets.only(bottom: 15),
              width: double.maxFinite,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
            ),
          )
        ],
      ),
    );
  }
}
