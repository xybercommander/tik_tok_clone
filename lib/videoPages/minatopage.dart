import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:intern_demo/helper/widgets.dart';

class MinatoPage extends StatefulWidget {
  @override
  _MinatoPageState createState() => _MinatoPageState();
}

class _MinatoPageState extends State<MinatoPage> {
  VideoPlayerController _controller;
  Future<void> _intializeVideoPlayerFuture;
  bool like = false;

  @override
  void initState() {
    // _controller = VideoPlayerController.network(
    //     "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    _controller = VideoPlayerController.asset("videos/Minato.mp4");
    _intializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: FutureBuilder(
                future: _intializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height,
                width: 100,
                color: Colors.black.withOpacity(0.0),
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/profilepic.jpg"),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    IconButton(
                        icon: Icon(
                          like == false
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            like = !like;
                          });
                        }),
                    Text(
                      "336.4k",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.add_comment,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return SingleChildScrollView(
                                child: Container(
                                  height: MediaQuery.of(context).size.height / 2,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("5 comments"),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height / 2 - 30,
                                        child: ListView(
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            commentBox(context, "@xyber", "Haha", "20"),
                                            SizedBox(height: 5,),
                                            commentBox(context, "@samrat", "Really cool", "30"),
                                            SizedBox(height: 5,),
                                            commentBox(context, "@cws", "Nice", "40"),
                                            SizedBox(height: 5,),
                                            commentBox(context, "@abc", "Lmao", "50"),
                                            SizedBox(height: 5,),
                                            commentBox(context, "@def", "Lol", "60"),
                                            SizedBox(height: 5,),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                        },
                      ),
                    Text(
                      "5",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return Container(
                                height: MediaQuery.of(context).size.height / 3 - 30,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Share to",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    listInShare(context),                                    
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();                                        
                                      },
                                      child: Text("Cancel"),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                    Text(
                      "Share",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "@xybercommander",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(
                  height: 17,
                ),
                Text(
                  "This is the title here, This is Minato's video",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Quicksand"),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "This is the song",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "Quicksand"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "@artistName",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: "Quicksand"),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 10),
                          borderRadius: BorderRadius.circular(40)),
                      height: 66,
                      width: 66,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/beatles.jpg"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
