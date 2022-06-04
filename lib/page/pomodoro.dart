import 'dart:async';

//import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/pomodoro_status.dart';

import 'package:todo/widget/custom_button.dart';
import 'package:todo/widget/progress_icons.dart';
import 'package:todo/utils/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class pomodoro extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();

}



const _btnTextStart = 'START POMODORO';
const _btnTextResumePomodoro = 'RESUME POMODORO';
const _btnTextResumeBreak = 'RESUME BREAK';
const _btnTextStartShortBreak = 'TAKE SHORT BREAK';
const _btnTextStartLongBreak = 'TAKE LONG BREAK';
const _btnTextStartNewSet = 'START NEW SET';
const _btnTextPause = 'PAUSE';
const _btnTextReset = 'RESET';

class _HomeState extends State<pomodoro>{
  //static AudioCache player  = AudioCache();
  int remainingTime = pomodoroTotalTime;
  String mainBtnText = _btnTextStart;
  PomodoroStatus pomodoroStatus = PomodoroStatus.pausedPomodoro;
  Timer _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) => {
      }
    );
  int pomodoroNum = 50;
  int setNum = 0;

  @override
  void dispose(){
    _cancelTimer();
    super.dispose();
  }


  @override
  void initState(){
    super.initState();
    //player.load('bell.mp3');
  }

  Widget build(BuildContext context){
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
      ),
      backgroundColor: Color.fromARGB(255, 35, 3, 35),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Pomodoro Number: $pomodoroNum',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Set: $setNum',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: 220.0,
                      lineWidth: 15.0,
                      percent: _getPomodoroPercentage(),
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        _secondsToFormatedString(remainingTime),
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      progressColor: Colors.red,
                    ),
                    SizedBox(height: 10,),
                    ProgressIcons(
                      total: pomodoriPerSet, 
                      done: pomodoroNum-(setNum * pomodoriPerSet)
                    ),
                    SizedBox(height: 10,),
                    Text(
                      statusDescription[pomodoroStatus].toString(),
                      
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 10,), 
                    CustomButton(
                      onTap: () =>  _startPomodoroCountdown(),
                      text: 'Start',
                    ),
                    
                    
                    CustomButton(
                      onTap: () => _resetButtonPressed(),
                      text: 'Pause',
                      
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  _secondsToFormatedString(int seconds){
    int roundedMinutes = seconds ~/60;
    int remainingSeconds = seconds - (roundedMinutes * 60);
    String remainingSecondsFormated;

    if(remainingSeconds<10){
      remainingSecondsFormated = '0$remainingSeconds';
    }else{
      remainingSecondsFormated = remainingSeconds.toString();
    }
    return '$roundedMinutes:$remainingSecondsFormated';
  }

  _getPomodoroPercentage(){
    int totalTime;
    switch (pomodoroStatus){
      case PomodoroStatus.runingPomodoro:
        totalTime = pomodoroTotalTime;
        break;
      case PomodoroStatus.pausedPomodoro:
        totalTime = pomodoroTotalTime;
        break;
      case PomodoroStatus.runningShortBreak:
        totalTime = shortBreakTime;
        break;
      case PomodoroStatus.pausedShortBreak:
        totalTime = shortBreakTime;
        break;
      case PomodoroStatus.runningLongBreak:
        totalTime = longBreakTime;
        break;
      case PomodoroStatus.pausedLongBreak:
        totalTime = longBreakTime;
        break;
      case PomodoroStatus.setFinished:
        totalTime = pomodoroTotalTime;
        break;
    }
    double percentage = (totalTime - remainingTime)/totalTime;
    return percentage;
  }
  _mainButtonPressed(){
    switch (pomodoroStatus){
  
      case PomodoroStatus.runingPomodoro:
        _startPomodoroCountdown();
        break;
      case PomodoroStatus.pausedPomodoro:
         _pausedPomodoroCountdown();
        break;
      case PomodoroStatus.runningShortBreak:
        _pauseShortBreakCountdown();
        break;
      case PomodoroStatus.pausedShortBreak:
        _startShortBreak();
        break;
      case PomodoroStatus.runningLongBreak:
        _pauseLongBreakCountdown();
        break;
      case PomodoroStatus.pausedLongBreak:
         _startLongBreak();
        break;
      case PomodoroStatus.setFinished:
        setNum++;
        _startPomodoroCountdown();
        break;
      default:
        print("defaultta");
        break;
    }
  }

  _startPomodoroCountdown(){
    pomodoroStatus = PomodoroStatus.runingPomodoro;
    _cancelTimer();
    print("starttayız");
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) => { 
        if(remainingTime>0){
          setState((){
            remainingTime--;
            mainBtnText=_btnTextPause;
          })
        }else{
          //todo playsound()
          pomodoroNum++,
          _cancelTimer(),
          if(pomodoroNum%pomodoriPerSet == 0){
            pomodoroStatus = PomodoroStatus.pausedLongBreak,
            setState((){
              remainingTime == longBreakTime;
              mainBtnText = _btnTextStartLongBreak;
            }),
          }else{
            pomodoroStatus = PomodoroStatus.pausedShortBreak,
            setState((){
              remainingTime == shortBreakTime;
              mainBtnText = _btnTextStartShortBreak;
            }),
          }
        }
      }
    );
  }

  _pausedPomodoroCountdown(){
    pomodoroStatus = PomodoroStatus.pausedPomodoro;
    _cancelTimer();
    setState(() {
      mainBtnText = _btnTextResumePomodoro;
    });
  }
  _resetButtonPressed(){
    pomodoroNum = 0;
    setNum = 0;
    _cancelTimer();
    _stopCountdown();
  }
  _stopCountdown(){
    pomodoroStatus = PomodoroStatus.pausedPomodoro;
     setState(() {
      mainBtnText = _btnTextStart;
      remainingTime = pomodoroTotalTime;
    });
  }

  _startShortBreak(){
    pomodoroStatus = PomodoroStatus.runningShortBreak;
    setState(() {
      mainBtnText = _btnTextPause;
    });
    _cancelTimer();
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer)=>{
        if(remainingTime>0){
          setState(() {
            remainingTime--;
          })
        }
        else{
          //_playSound(),
          remainingTime=pomodoroTotalTime,
          _cancelTimer(),
          pomodoroStatus = PomodoroStatus.pausedPomodoro,
          setState((){
            mainBtnText = _btnTextStart;
          }),
        }
      });
  }

 _startLongBreak(){
    pomodoroStatus = PomodoroStatus.runningLongBreak;
    setState(() {
      mainBtnText = _btnTextPause;
    });
    _cancelTimer();
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer)=>{
        if(remainingTime>0){
          setState(() {
            remainingTime--;
          })
        } 
        else{
         // _playSound(),
          remainingTime=pomodoroTotalTime,
          _cancelTimer(),
          pomodoroStatus = PomodoroStatus.setFinished,
          setState((){
            mainBtnText = _btnTextStartNewSet;
          }),
        }
      });
  }

  _pauseShortBreakCountdown(){
    pomodoroStatus = PomodoroStatus.pausedShortBreak;
    _pauseBreakCountdown();
  }
   _pauseLongBreakCountdown(){
    pomodoroStatus = PomodoroStatus.pausedLongBreak;
    _pauseBreakCountdown();
  }

  _pauseBreakCountdown(){
    _cancelTimer();
    setState(() {
      mainBtnText = _btnTextResumeBreak;
    });
  }

  _cancelTimer(){
    if(_timer!=null){
      _timer.cancel();
    }else{}
  }
  
  /*_playSound(){
    player.play('bell.mp3');
  }*/
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Timer>('_timer', _timer));
  }
  
}




