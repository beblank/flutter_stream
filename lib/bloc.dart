import 'package:playground/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class ReviewBloc implements BlocBase {

  final _reviewState = PublishSubject<String>();
  Observable<String> get reviewState => _reviewState.stream;

  fetchData(int index){
    for (var i=0; i < index; i++){
      getData(i, index);
      
    }
  }


  Future<String> getData(int i, int index) async {
    await Future.delayed(Duration(seconds: 5)); //Mock delay
    print("Fetched Data $i of $index");
    if (i == index - 1){
        _reviewState.sink.add("done");
      } else {
        _reviewState.sink.add("event");
      }
    //return "This a test data";
  }

  @override
  void dispose() {
    _reviewState.close();
  }

}