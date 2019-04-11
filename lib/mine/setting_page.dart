import 'package:flutter/material.dart';
import 'package:my_mini_app/provider/auth_provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _bodyWidget(context));
  }

  Widget _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text("设置"),
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 50.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 200.0,
            height: 50.0,
            child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  "退出登录",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            content: new Text("您确定退出登录吗？"),
                            actions: <Widget>[
                              new FlatButton(
                                child: new Text("取消"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              new FlatButton(
                                child: new Text("确定"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _logout();
                                  Navigator.of(context).pop();
                                },
                              )
                            ]);
                      });
                }),
          )
        ],
      ),
    );
  }

  void _logout() async {
//    await AuthUtil.logout();
//    AuthUtil.userInfo.isLogin = false;
    AuthProvider().logout();
//    AuthProvider().addLoginBeen(AuthUtil.userInfo);
  }
}
