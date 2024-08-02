mixin FormValidator{

  String? quantityValidator(String? value) {
    try {
      if (value == null || value.isEmpty) return "Enter quantity";
      if (int.parse(value.trim()) <= 0) return "Quantity should be more than 0";
    } catch (e) {
      return "Enter valid quantity";
    }

    return null;
  }

}