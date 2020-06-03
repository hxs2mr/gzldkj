import 'package:oktoast/oktoast.dart';
//create by :xs
//day by2020/6/2.
//describe:封装一下toast

class Toast{
    static show(String msg,{duration=2}){
      if(msg==null){
        return;
      }
      showToast(msg,duration: Duration(seconds: duration),dismissOtherToast: true);
    }

    static cancelToast(){
      dismissAllToast();
    }
}
