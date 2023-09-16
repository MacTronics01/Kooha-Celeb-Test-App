import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../locator.dart';
import '../../utils/app_images.dart';
import '../../utils/pallet.dart';
import '../../utils/widget_extensions.dart';
import 'base.vm.dart';
import 'package:lottie/src/lottie.dart';



// the base view controls all the states of all the UIs
class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child)? builder;
  final Function(T)? onModelReady;
  final Function(T)? onModelDispose;
  final Color color;
  const BaseView({Key? key, this.builder, this.onModelReady, this.color = AppColor.white, this.onModelDispose}) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T model = getIt<T>();

  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onModelDispose != null) {
      widget.onModelDispose!(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: (_) => model,
        child: Consumer<T>(
          builder: (_,model, __) => Stack(
            children: [
              widget.builder!.call(_, model, __),
              if (model.isLoading)
                 Container(
                   color: AppColor.background,
                   width: width(context),height: height(context),
                   child:  Center(
                     child:
                         // in this case we choose to use a lottie as out general loader for our loading state
                     Lottie.asset(AppImages.loader, width: 100.0.w, height: 100.0.h, repeat: true),
                   ),
                )
                // ShimmerUser()
            ],
          ),
        ));
  }
}
