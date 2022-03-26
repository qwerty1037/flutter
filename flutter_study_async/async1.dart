Future<String> createOrderMessage() async {
  print('synchronous');
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() {
  return Future.delayed(
    Duration(seconds: 2),
    (() => 'Large Latte'),
  );
}

void main() async {
  print('Fetching user order...');
  print(await createOrderMessage());
}

/*
String Data가 전달되기 전에 future변수가 즉시 할당
*/