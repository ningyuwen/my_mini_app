import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_mini_app/been/my_user_friend_been.dart';
import 'package:my_mini_app/home/consume_page.dart';
import 'package:my_mini_app/provider/my_user_friend_provider.dart';
import 'package:my_mini_app/util/fast_click.dart';

class MyUserFriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _MyUserFriendPage());
  }

  Widget _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text("我关注的人"),
    );
  }
}

class _MyUserFriendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyUserFriendState();
  }
}

class _MyUserFriendState extends State<_MyUserFriendPage> {
  MyUserFriendProvider _provider = MyUserFriendProvider.newInstance();

  @override
  void initState() {
    _provider.getMyUserFriendsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _provider.streamBuilder<List<MyUserFriendsBeen>>(
        success: (List<MyUserFriendsBeen> data) {
      return Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  height: 0.0,
                ),
            itemCount: data.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: _itemOfList(data[index], index),
                      height: 60.0,
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              new ConsumePage(data[index].userId)));
                },
              );
            }),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    }, error: (error) {
      return Center(
        child: Text(error),
      );
    });
  }

  Widget _itemOfList(MyUserFriendsBeen data, index) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 20.0,
        ),
        ClipOval(
          child: CachedNetworkImage(
            width: 40,
            height: 40,
            fit: BoxFit.cover,
            imageUrl: data.headUrl,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(data.userName),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                color: const Color.fromARGB(255, 247, 247, 247),
                child: _userFriendWidget(true, data),
                onPressed: () {
                  //关注
                  if (FastClick.isFastClick()) {
                    return;
                  }
                  _provider.postUserFriend(index, data.isFriend);
                },
                highlightColor: const Color.fromARGB(255, 250, 250, 250),
                shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20.0,
        )
      ],
    );
  }

  Widget _userFriendWidget(bool isFriend, MyUserFriendsBeen data) {
    return StreamBuilder<bool>(
      initialData: isFriend,
      stream: data.publishSubject.stream,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (!snapshot.data) {
            return Row(
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: const Color.fromARGB(255, 51, 132, 245),
                ),
                Text(
                  "关注",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 51, 132, 245),
                      fontWeight: FontWeight.bold),
                )
              ],
            );
          } else {
            return Text(
              "已关注",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 154, 154, 154)),
            );
          }
        } else {
          return Container(
            width: 24.0,
            height: 24.0,
            child: CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
          );
        }
      },
    );
  }
}