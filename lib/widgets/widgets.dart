import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mid_level/utils/screen_size.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

InputDecoration myDecoration(icon, label) {
  return InputDecoration(
    prefixIcon: icon,
    labelText: label,
    labelStyle: const TextStyle(color: Colors.white),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
  );
}

showLoading() {
  return Padding(
    padding: const EdgeInsets.only(top: 400),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitWave(
          size: 40,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.red : Colors.red,
              ),
            );
          },
        ),
        const Text(
          "Loading..",
          style: TextStyle(fontSize: 30, color: Colors.red),
        )
      ],
    ),
  );
}

Widget internetError(){
  return  Container(
    height: 200,
    alignment: Alignment.center,
              child: Column(
                children: [
                Icon(Icons.network_wifi_1_bar_outlined,color: Colors.red[900],size: 50),
                const SizedBox(height: 10),
                const Text("No Internet")
              ],),
            );
}

showToast(String msg,context){
  Fluttertoast.showToast(
            backgroundColor: Colors.red,
              msg: msg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              fontSize: ScreenSize(context:context).fontSize(20));
}

Network_Image(url){
  return CachedNetworkImage(
                                imageUrl:
                                    url,
                                placeholder: (context, url) => SpinKitCircle(
                                  size: 40,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const DecoratedBox(
                                      decoration: BoxDecoration(
                                        color:
                                             Colors.red
                                      ),
                                    );
                                  },
                                ),
                                errorWidget: (context, url, error) =>
                                    const Center(child: Text("Not internet")),
                                    fit: BoxFit.cover,
                              );
}