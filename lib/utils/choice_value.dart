//create by :xs
//day by2020/6/2.
//describe:
class ChoiceValue<T>{
  const ChoiceValue({this.value,this.title,this.label});
  final T value;
  final String title;
  final String label;

  @override
  String toString() =>'$runtimeType("$title")';
}