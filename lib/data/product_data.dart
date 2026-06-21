import '../models/product.dart';

final List<Map<String, dynamic>> demoProductJson = [
  {
    'id': 1,
    'title': 'Nova Kulaklık',
    'category': 'Elektronik',
    'price': 849.90,
    'description': 'Günlük kullanım için kablosuz, hafif ve konforlu kulaklık modeli.',
    'imageUrl': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600',
    'rating': 4.6,
  },
  {
    'id': 2,
    'title': 'Minimal Sırt Çantası',
    'category': 'Aksesuar',
    'price': 429.50,
    'description': 'Laptop bölmeli, sade tasarımlı şehir tipi sırt çantası.',
    'imageUrl': 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=600',
    'rating': 4.3,
  },
  {
    'id': 3,
    'title': 'Akıllı Saat',
    'category': 'Elektronik',
    'price': 1299.00,
    'description': 'Adım takibi, bildirim ve temel sağlık ölçümleri sunan akıllı saat.',
    'imageUrl': 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600',
    'rating': 4.8,
  },
  {
    'id': 4,
    'title': 'Matara',
    'category': 'Spor',
    'price': 199.90,
    'description': 'Sızdırmaz kapaklı, okul ve spor kullanımı için uygun matara.',
    'imageUrl': 'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=600',
    'rating': 4.2,
  },
  {
    'id': 5,
    'title': 'Masa Lambası',
    'category': 'Ev',
    'price': 349.00,
    'description': 'Çalışma masası için yumuşak ışık sağlayan modern lamba.',
    'imageUrl': 'https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=600',
    'rating': 4.4,
  },
  {
    'id': 6,
    'title': 'Planlayıcı Defter',
    'category': 'Kırtasiye',
    'price': 119.90,
    'description': 'Haftalık planlama ve not alma için kullanılabilecek pratik defter.',
    'imageUrl': 'https://images.unsplash.com/photo-1517842645767-c639042777db?w=600',
    'rating': 4.7,
  },
];

List<Product> getDemoProducts() {
  return demoProductJson.map((item) => Product.fromJson(item)).toList();
}
