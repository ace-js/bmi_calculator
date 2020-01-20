class Human {
  Gender _gender;
  int _age;
  int _height;
  int _weight;

  Human({Gender gender, int age, int height, int weight}) {
    this._gender = gender;
    this._age = age;
    this._height = height;
    this._weight = weight;
  }

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
    this._age = age;
  }

  int getHeight() {
    return this._height;
  }

  void setHeight(int height) {
    this._height = height;
  }

  int getWeight() {
    return this._weight;
  }

  void setWeight(int weight) {
    this._weight = weight;
  }
}

enum Gender { male, female }
