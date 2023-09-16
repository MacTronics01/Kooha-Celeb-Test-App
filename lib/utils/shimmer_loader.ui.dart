import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:kooha_movie_app/utils/style_manager.dart';

import '../utils/pallet.dart';
import '../utils/widget_extensions.dart';



class ShimmerPage extends StatefulWidget {
  final Color? color;
  const ShimmerPage({Key? key, this.color,
  }) : super(key: key);

  @override
  State<ShimmerPage> createState() => _ShimmerPageState();
}
int _index = 0;

class _ShimmerPageState extends State<ShimmerPage>with SingleTickerProviderStateMixin  {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -3, end: 3).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(animation: _animation,
        builder: (BuildContext context, Widget? child){
          return Scaffold(
            body: Container(
              height: height(context),
              width: width(context),
              color: widget.color ?? Theme.of(context).primaryColorLight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height*0.3,
                    child:  Skeleton(),
                  ),
                  10.0.sbH,
                   Expanded(child: Skeleton()),
                  20.0.sbH
                ],
              ),
            ),
          );
        }
    );
  }

}

class ShimmerUser extends StatefulWidget {
  const ShimmerUser({Key? key,
  }) : super(key: key);

  @override
  State<ShimmerUser> createState() => _ShimmerUserState();
}

class _ShimmerUserState extends State<ShimmerUser>with SingleTickerProviderStateMixin  {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(animation: _animation,
        builder: (BuildContext context, Widget? child){
          return  Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    child: Skeleton(),
                  ),
                  10.0.sbW,
                  Container(
                    width: 20,
                    height: 20,
                    child: Skeleton(),
                  ),
                  10.0.sbW,
                  Container(
                    width: 20,
                    height: 20,
                    child: Skeleton(),
                  )
                ],

              ),
          );
        }
    );
  }

}


class Skeleton extends StatefulWidget {
  const Skeleton({Key? key, this.height, this.width, this.color=Colors.grey}) : super(key: key);

  final double? height, width;
  final Color? color;

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton>with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // *****************************dispose*********************  ***

  @override
  Widget build(BuildContext context) {
    double defaultPadding = 16.0;

    return Container(
        height: widget.height,
        width: widget.width,
        padding: EdgeInsets.all(defaultPadding / 2),
        decoration: radiusBoxDecoration(
          colors: [AppColor.red, AppColor.green, Colors.purple, Colors.white],
          animation: _animation,
        )
    );
  }
}

class CircleSkeleton extends StatefulWidget {
  const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);

  final double? size;

  @override
  State<CircleSkeleton> createState() => _CircleSkeletonState();
}

class _CircleSkeletonState extends State<CircleSkeleton> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // *****************************dispose*********************  ***

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      decoration: radiusBoxDecoration(
        radius: widget.size!,
        colors: [AppColor.red, AppColor.green, Colors.purple, Colors.white],
        animation: _animation,
      ),
    );
  }
}

class ShimmerCard extends StatefulWidget {
  const ShimmerCard({Key? key,
  }) : super(key: key);

  @override
  State<ShimmerCard> createState() => _ShimmerCardState();
}

class _ShimmerCardState extends State<ShimmerCard>with SingleTickerProviderStateMixin  {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(animation: _animation,
        builder: (BuildContext context, Widget? child){
          return
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              itemCount: 7,
              gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10.w,
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                childAspectRatio: (2 / 3.3.h),
              ),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 100,
                  height: 240,
                  child: Column(
                    children: [
                      SizedBox(
                        width: width(context),
                        height: 197,
                        child: Skeleton(),
                      ),
                      5.0.sbH,
                      Container(
                          margin: EdgeInsets.only(right: 30.w),
                          height: 10,
                        alignment:Alignment.centerLeft,
                        child: Skeleton()
                      ),
                      2.0.sbH,
                      Container(
                          margin: EdgeInsets.only(right: 45.w),
                          height: 10,
                        alignment:Alignment.centerLeft,
                        child: Skeleton()
                      ),
                      2.0.sbH,
                      Container(
                        margin: EdgeInsets.only(right: 55.w),
                        height: 10,
                        alignment:Alignment.centerLeft,
                        child: Skeleton()
                      ),

                    ],
                  ),
                );
              },
            );
        }
    );
  }

}



class ShimmerCart extends StatefulWidget {
  const ShimmerCart({Key? key,
  }) : super(key: key);

  @override
  State<ShimmerCart> createState() => _ShimmerCartState();
}

class _ShimmerCartState extends State<ShimmerCart>with SingleTickerProviderStateMixin  {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(animation: _animation,
        builder: (BuildContext context, Widget? child){
          return  SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (_, index) {
                return
                  Container(
                    margin: EdgeInsets.only(bottom: 15.5.w,),
                    width: 220,
                    height: 60,
                    child: const Skeleton(),
                  );
              },
            ),
          );
        }
    );
  }

}


class ShimmerWallet extends StatefulWidget {
  const ShimmerWallet({Key? key,
  }) : super(key: key);

  @override
  State<ShimmerWallet> createState() => _ShimmerWalletState();
}

class _ShimmerWalletState extends State<ShimmerWallet>with SingleTickerProviderStateMixin  {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(animation: _animation,
        builder: (BuildContext context, Widget? child){
          return  Container(
            height: size.height,
            margin: EdgeInsets.only(left: 16,right: 16),
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 10,
              itemBuilder: (_, index) {
                return
                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10),
                    height: 50,
                    width: size.width,
                    child: Skeleton(),
                  );
              },
            ),
          );
        }
    );
  }

}
class ShimmerPharm extends StatefulWidget {
  const ShimmerPharm({Key? key,
  }) : super(key: key);

  @override
  State<ShimmerPharm> createState() => _ShimmerPharmState();
}

class _ShimmerPharmState extends State<ShimmerPharm>with SingleTickerProviderStateMixin  {
  late AnimationController _animationController;
  late Animation<double> _animation;

  // ****************************init*************************
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 1), vsync: this)..repeat();
    _animation =
        Tween<double>(begin: -2, end: 2).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _animationController));
  }
  // ****************************init*************************

  // *****************************dispose************************
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    print(darkModeOn);
    return AnimatedBuilder(animation: _animation,
        builder: (BuildContext context, Widget? child){
          return  Container(
            height: size.height,
            width: size.width,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: 10,
              itemBuilder: (_, index) {
                return
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                           margin: EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10),
                          height: 200,
                          width: 160,
                          child: Skeleton(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                           margin: EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10),
                          height: 200,
                          width: 160,
                          child: Skeleton(),
                        ),
                      ),
                    ],
                  );
              },
            ),
          );
        }
    );
  }

}