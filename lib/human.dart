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

  double getBMI() {
    if (this._weight != null && this._height != null) {
      double height = this._height / 100;
      return this._weight / (height * height);
    }
    return null;
  }

  BodyType getBodyType() {
    double bmi = getBMI();
    if (bmi <= 25) {
      return BodyType.normal;
    }
    return BodyType.overweight;
  }
}

enum Gender { male, female }
enum BodyType { normal, overweight }
