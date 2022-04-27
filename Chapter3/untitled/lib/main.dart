import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // 프로젝트 앱에서 하나만 존재. 실행되는 앱 전체를 말하게 된다.
      // ios 에서는 쿠퍼티노 App 을 사용
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'YouTube'),
    );
  }
}

class MyHomePage extends StatelessWidget { // Stateless로 바꿔줬음
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  Widget build(BuildContext context) {
    return Scaffold( // 화면 자체에 보이는 전체 스크린이 Scaffold. 화면이 바뀌면 다른 Scaffold로 넘어간 것.
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              color: Colors.black87,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 60,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container( // 유튜브 로고
                          width: 200,
                          child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  height: 30,
                                  child: Image.network("https://cdn-icons-png.flaticon.com/512/1384/1384060.png"),
                                ),
                                const Text(
                                    "YouTube",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              ]
                          )
                        ),
                        Container( // 유튜브 알림, 프로필
                          width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.screen_share_outlined, color: Colors.white),
                                Icon(Icons.notifications_none_outlined, color: Colors.white),
                                Icon(Icons.search_outlined, color: Colors.white),
                                Icon(Icons.account_circle, color: Colors.white),
                              ],
                            )
                        ),
                      ]

                    )
                  ),
                  Container( // 탐색 | 전체 ...
                    height: 60,
                    padding: EdgeInsets.all(5),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[

                        Container(
                          color: Colors.white24,
                          width: 80,
                          margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                          child: Row(
                              children: <Widget>[
                                Icon(Icons.location_searching, color: Colors.white),
                                const Text("  탐색", style: TextStyle(color: Colors.white)),
                              ]
                          )
                          
                        ),
                        const Text(" | ", style: TextStyle(color: Colors.white, fontSize: 36)),
                        // 여기에 CategoryButton들 추가
                        CategoryButton(categoryName: "전체", backColor: Colors.white, textColor: Colors.black),
                        CategoryButton(categoryName: "수학", backColor: Colors.white24, textColor: Colors.white),
                        CategoryButton(categoryName: "음악", backColor: Colors.white24, textColor: Colors.white),
                        CategoryButton(categoryName: "ASMR", backColor: Colors.white24, textColor: Colors.white),
                        CategoryButton(categoryName: "공예", backColor: Colors.white24, textColor: Colors.white),
                        CategoryButton(categoryName: "만화 영화", backColor: Colors.white24, textColor: Colors.white),
                        CategoryButton(categoryName: "시각 예술", backColor: Colors.white24, textColor: Colors.white),

                      ]
                    )
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black87,
                height: 563,
                child: ListView(
                  children: <Widget>[
                    VideoThumbnail(videoName: "[입덕직캠] 아이브 이서 직캠 4K", channelName: "M2", viewCount: "8.5만", thumbnailImage: "https://i.ytimg.com/vi/aHGZGBY-Koc/maxresdefault.jpg", channelImage: "https://yt3.ggpht.com/ytc/AKedOLRVrxUPt50GV1-Xs-XH_gSnUgNo3uqY2NoJIvxeNw=s900-c-k-c0x00ffffff-no-rj", videoLen: "4:37"),
                    VideoThumbnail(videoName: "[입덕직캠] 아이브 이서 직캠 4K", channelName: "M2", viewCount: "8.5만", thumbnailImage: "https://i.ytimg.com/vi/aHGZGBY-Koc/maxresdefault.jpg", channelImage: "https://yt3.ggpht.com/ytc/AKedOLRVrxUPt50GV1-Xs-XH_gSnUgNo3uqY2NoJIvxeNw=s900-c-k-c0x00ffffff-no-rj", videoLen: "4:37"),
                    VideoThumbnail(videoName: "[입덕직캠] 아이브 이서 직캠 4K", channelName: "M2", viewCount: "8.5만", thumbnailImage: "https://i.ytimg.com/vi/aHGZGBY-Koc/maxresdefault.jpg", channelImage: "https://yt3.ggpht.com/ytc/AKedOLRVrxUPt50GV1-Xs-XH_gSnUgNo3uqY2NoJIvxeNw=s900-c-k-c0x00ffffff-no-rj", videoLen: "4:37"),
                    Container(
                        height: 350,
                        color: Colors.black87,
                        child:Column(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 30,
                                        margin: EdgeInsets.symmetric(horizontal: 10),
                                        child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Youtube_shorts_icon.svg/1200px-Youtube_shorts_icon.svg.png")
                                    ),
                                    Text("Shorts", style: TextStyle(color: Colors.white, fontSize: 20)),
                                  ],
                                )
                            ),
                            Container(
                              height: 300,
                              child: ListView(

                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  ShortsThumbnail(videoName: "52초 동안 표정만 오만 번 바뀌는 빌리 츠키", viewCount: "135만", thumbnailImage: "https://i.ytimg.com/vi/h3mKNzCyAPk/maxresdefault.jpg"),
                                  ShortsThumbnail(videoName: "52초 동안 표정만 오만 번 바뀌는 빌리 츠키", viewCount: "135만", thumbnailImage: "https://i.ytimg.com/vi/h3mKNzCyAPk/maxresdefault.jpg"),
                                  ShortsThumbnail(videoName: "52초 동안 표정만 오만 번 바뀌는 빌리 츠키", viewCount: "135만", thumbnailImage: "https://i.ytimg.com/vi/h3mKNzCyAPk/maxresdefault.jpg"),
                                  ShortsThumbnail(videoName: "52초 동안 표정만 오만 번 바뀌는 빌리 츠키", viewCount: "135만", thumbnailImage: "https://i.ytimg.com/vi/h3mKNzCyAPk/maxresdefault.jpg"),
                                  ShortsThumbnail(videoName: "52초 동안 표정만 오만 번 바뀌는 빌리 츠키", viewCount: "135만", thumbnailImage: "https://i.ytimg.com/vi/h3mKNzCyAPk/maxresdefault.jpg"),
                                  ShortsThumbnail(videoName: "52초 동안 표정만 오만 번 바뀌는 빌리 츠키", viewCount: "135만", thumbnailImage: "https://i.ytimg.com/vi/h3mKNzCyAPk/maxresdefault.jpg")
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                    VideoThumbnail(videoName: "[입덕직캠] 아이브 이서 직캠 4K", channelName: "M2", viewCount: "8.5만", thumbnailImage: "https://i.ytimg.com/vi/aHGZGBY-Koc/maxresdefault.jpg", channelImage: "https://yt3.ggpht.com/ytc/AKedOLRVrxUPt50GV1-Xs-XH_gSnUgNo3uqY2NoJIvxeNw=s900-c-k-c0x00ffffff-no-rj", videoLen: "4:37"),
                    VideoThumbnail(videoName: "[입덕직캠] 아이브 이서 직캠 4K", channelName: "M2", viewCount: "8.5만", thumbnailImage: "https://i.ytimg.com/vi/aHGZGBY-Koc/maxresdefault.jpg", channelImage: "https://yt3.ggpht.com/ytc/AKedOLRVrxUPt50GV1-Xs-XH_gSnUgNo3uqY2NoJIvxeNw=s900-c-k-c0x00ffffff-no-rj", videoLen: "4:37"),

                  ],
                )
            ),
          ]
        )
      )
    );
  }
}



class CategoryButton extends StatelessWidget {
  final String categoryName;
  final Color backColor;
  final Color textColor;
  const CategoryButton({
    required this.categoryName, required this.backColor, required this.textColor,Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context){
    return Container(
      color: backColor,
      // width: ,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(50),
      //   border: Border.all(color:Colors.white70, width:3)
      // ),
      child: Text(categoryName, style: TextStyle(color: textColor),)
    );
  }
}

class VideoThumbnail extends StatelessWidget {
  final String videoName;
  final String channelName;
  final String viewCount;
  final String thumbnailImage;
  final String channelImage;
  final String videoLen;
  const VideoThumbnail({
    required this.videoName, required this.channelName, required this.viewCount,
    required this.thumbnailImage, required this.channelImage, required this.videoLen, Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context){
    return Container(
      // height: 200,
      //   width: 300,
        color: Colors.black87,
        
        child: Column(
          children: [
            Container( // thumbnail part
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(10),
              height: 230,
                // color: Colors.white,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(thumbnailImage))),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                color: Colors.black,
                child: Text(videoLen, style: TextStyle(color: Colors.white))
              )
            ),
            Container( // 영상 정보 파트
              margin: EdgeInsets.all(10),
              // padding: EdgeInsets.,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container( // channelImage 파트
                    height: 50,
                      width: 50,
                      child: Image.network(channelImage)
                  ),
                  Container( // video name, channel name, 조회수
                    margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Text(videoName, style: TextStyle(color: Colors.white),),
                          Text(channelName+"  *  조회수 "+viewCount+"회  *  "+"1주 전", style: TextStyle(color: Colors.white70)) // 업로드 날짜는 나중에
                        ],
                      )
                  ),
                ],
              )
            )
          ],
        )
    );
  }
}

class ShortsThumbnail extends StatelessWidget {
  final String videoName;
  final String viewCount;
  final String thumbnailImage;
  const ShortsThumbnail({
    required this.videoName, required this.viewCount,
    required this.thumbnailImage, Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(10),
        height: 280,
        width: 160,
        // color: Colors.redAccent,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop
                ),
                image: NetworkImage(thumbnailImage))),
        child: Column(
          children: [
            Container(
              // color: Colors.white,
              alignment: Alignment.topRight,
              margin: EdgeInsets.all(5),
              height: 200,
              child: Icon(Icons.more_vert_outlined, color: Colors.white)

            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Text(videoName, style: TextStyle(color: Colors.white),)
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Text("조회수 "+viewCount+"회", style: TextStyle(color: Colors.white))
            )
          ],
        )
    );
  }
}

