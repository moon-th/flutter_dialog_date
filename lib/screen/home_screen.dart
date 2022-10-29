import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 선택한 날짜를 표시하기 위한 변수 선언
  DateTime selectDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width, // 핸드폰의 크기에 맞춰준다.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //가운데 정렬
            children: [
              ElevatedButton(    // DatePicker 를 사용하기 위한 버튼생성
                onPressed: onPressedDatePicker, // 버튼 클릭시 이벤트
                child: Text('클릭'),
              ),
              Text( // 선택한 날자를 표시해주기 위한 텍스트
                '${selectDate.year} : ${selectDate.month} : ${selectDate.day}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onPressedDatePicker() {
    // 현재날짜 가져오기
    final DateTime now = DateTime.now();

    // Dialog 생성
    showCupertinoDialog(
        context: context,
        barrierDismissible: true, // dialog 영역을 제외한 부분를 터치 할 경우 dialog 가 닫히도록 하는 옵션
        builder: (BuildContext context) {
          // dialog 에 들어갈 컨텐츠
          return Align(
            alignment: Alignment.bottomCenter, // 위치를 하단중아으로
            child: Container(
              color: Colors.white,
              height: 300.0, // dialog 의 크기
              child: CupertinoDatePicker( // DatePicker 선언
                  mode: CupertinoDatePickerMode.date, // DatePicker 의 모드설정 (date / dateAndTime / time)
                  initialDateTime: selectDate, // 처음 시작 날짜
                  maximumDate: DateTime(now.year, now.month, now.day), // 선택할 수 있는 최대날짜
                  onDateTimeChanged: (DateTime date) { // DatePicker 에서 날짜를 선택할 경우 반환되는 날짜 값
                    setState(() {
                      selectDate = date;
                    });
                  }),
            ),
          );
        });
  }
}
