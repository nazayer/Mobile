import 'dart:async';

class Cake {}

class Order {
  String type;
  Order(this.type);
}

void main() {
  final controller = new StreamController();

  var arr = new List();

  arr[0] = new Order("Banana");
  arr[1] = new Order("Apple");
  arr[2] = new Order("brocoly");
  arr[3] = new Order("chocolate");
  arr[4] = new Order("cjees");
  arr[5] = new Order("chocolate");

  final order = new Order('chocolate');

  final baker =
      new StreamTransformer.fromHandlers(handleData: (cakeType, sink) {
    if (cakeType == 'chocolate') {
      sink.add(new Cake());
    } else {
      sink.addError('Fuck off error');
    }
  });

  //arr.forEach((order) => controller.sink.add(order));
  controller.sink.add(order);

  controller.stream.map((order) => order.type).transform(baker).listen(
      (cake) => print('Here is your cake $cake'),
      onError: (err) => print(err));
}
