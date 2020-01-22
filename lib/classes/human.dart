import 'package:bmi_calculator/enums.dart';

class Human {
  Human({Gender gender, int age, int height, int weight}) {
    this._gender = gender;
    this._age = age;
    this._height = height;
    this._weight = weight;
  }

  Gender _gender;
  int _age;
  int _height;
  int _weight;

  Gender getGender() {
    return this._gender;
  }

  void setGender(Gender gender) {
    this._gender = gender;
  }

  int getAge() {
    return this._age;
  }

  void setAge(int age) {
    if (age >= 0 && age <= 110) {
      this._age = age;
    }
  }

  int getHeight() {
    return this._height;
  }

  void setHeight(int height) {
    if (height >= 40 && height <= 220) {
      this._height = height;
    }
  }

  int getWeight() {
    return this._weight;
  }

  void setWeight(int weight) {
    if (weight >= 2 && weight <= 250) {
      this._weight = weight;
    }
  }
}
