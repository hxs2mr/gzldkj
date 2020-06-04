import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';
import 'package:gzldtechnology/utils/sps.dart';
//create by :xs
//day by2020/6/4.
//describe:个人中心的头像
class PersonWidget extends StatefulWidget {
  final String header;
  final int tag;
  const PersonWidget({Key key, this.header,this.tag}) : super(key: key);
  @override
  _PersonWidgetState createState() => _PersonWidgetState();
}

class _PersonWidgetState extends State<PersonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildAvure(),
           
          Expanded(child:
              Container(
                margin: EdgeInsets.fromLTRB(ScreenAdapter.width(45), 0, 0, ScreenAdapter.height(50)),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child:  Text("三生三世",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: ScreenAdapter.setSize(36),color: Colors.white),),
                        ),
                        Offstage(
                          offstage:widget.tag==1? false:true,
                          child: buildRen(),
                        ),
                        Sps.buildWGaps(20.0),
                        Offstage(
                          offstage:widget.tag==1? false:true,
                          child: Image.asset("assets/images/icon_my_shen.png",width:ScreenAdapter.width(130),height: ScreenAdapter.height(45) ,),
                        ),
                        Sps.buildWGaps(40.0),
                      ],
                    ),
                    Sps.buildHGaps(15.0),
                    Text("点击登录或注册",maxLines: 1,overflow: TextOverflow.clip,style: TextStyle(fontSize:ScreenAdapter.setSize(24),color:Colors.white54 ),)
                  ],
                )
              )
        
          )
        ],
      ),
      
    );
  }
  Widget buildRen(){
    return Container(
      alignment: Alignment.center,
      width: ScreenAdapter.width(92),
      height: ScreenAdapter.height(28),
      decoration: BoxDecoration(
        color: Color(0xffFFEAB7),
        borderRadius: BorderRadius.all(Radius.circular(14))
      ),
      child: Text("已认证",style: TextStyle(fontSize: ScreenAdapter.setSize(20),color: Color(0xff143B84)),),
    );

  }
  Widget buildAvure(){
    return Container(
      margin: EdgeInsets.only(left: ScreenAdapter.width(50)),
      child: ClipOval(
          child:Container(
            color: Colors.white,
            alignment: Alignment.center,
            height: ScreenAdapter.height(200),
            width: ScreenAdapter.width(200),
            child:ClipOval(
              child:CachedNetworkImage(imageUrl: widget.header,fit: BoxFit.fill,width: ScreenAdapter.width(193),height: ScreenAdapter.height(193),
                errorWidget: (context, url, error) => Image.asset("assets/images/icon_no_login.png"),
              )
            )

          )
      )
    );
  }
}
