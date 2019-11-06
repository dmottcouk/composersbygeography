import 'category.dart';

class Categories {
  static List<Category> _categories = [
    Category(1, "Medieval", 'assets/images/medieval.jpg'),
    Category(2, 'Renaissance','assets/images/renaissance.jpg'),
    Category(3, 'Baroque', 'assets/images/baroque.jpg'),
    Category(4, 'Classical','assets/images/classical.jpg'),
    Category(5, 'Romantic','assets/images/romantic.jpg'),
    Category(6, 'Contemporary','assets/images/contemporary.jpg')
  ];

  static List<Category> getCategories() {
    return [..._categories];
  }
}
