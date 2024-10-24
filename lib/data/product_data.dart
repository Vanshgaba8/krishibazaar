import '../models/customer_product_model.dart';

class ProductService {
  static Future<List<ProductDataModel>> getProducts() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));
    return [
      ProductDataModel(
          id: '1',
          name: 'Fresh Oranges',
          description: 'Juicy and sweet oranges perfect for the winter season.',
          price: '₹60/kg',
          imageUrl:
              'https://www.allrecipes.com/thmb/y_uvjwXWAuD6T0RxaS19jFvZyFU=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1205638014-2000-d0fbf9170f2d43eeb046f56eec65319c.jpg',
          category: 'Fruits'),
      ProductDataModel(
        id: '2',
        name: 'Wheat Grain',
        description: 'High-quality wheat grains harvested for winter sowing.',
        price: '₹45/kg',
        category: 'Grains',
        imageUrl:
            'https://5.imimg.com/data5/XH/BI/MY-39384412/wheat-grains.jpg',
      ),
      ProductDataModel(
        id: '3',
        name: 'Mustard Seeds',
        description: 'Fresh mustard seeds for oil extraction or seasoning.',
        price: '₹70/kg',
        category: 'Grains',
        imageUrl:
            'https://idukkigoldspices.in/wp-content/uploads/2020/08/Mustard.webp',
      ),
      ProductDataModel(
        id: '4',
        name: 'Guavas',
        description:
            'Ripe, sweet, and nutritious guavas available in the winter season.',
        price: '₹50/kg',
        category: 'Fruits',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6qrti1b4N_HG73y0vrLF75ODHZiLqzeKBwQ&s',
      ),
      ProductDataModel(
        id: '5',
        name: 'Jaggery (Gur)',
        description:
            'Natural jaggery made from sugarcane, ideal for winter delicacies.',
        price: '₹90/kg',
        category: 'Sweeteners',
        imageUrl:
            'https://vrmshoppe.com/wp-content/uploads/2021/05/sugarcane-jaggery-500x500-1.jpg',
      ),
      ProductDataModel(
        id: '6',
        name: 'Pearl Millet (Bajra)',
        description:
            'Nutritious and energy-rich pearl millet, a winter staple grain.',
        price: '₹35/kg',
        category: 'Grains',
        imageUrl:
            'https://www.harvestplus.org/wp-content/uploads/2021/10/Iron-Pearl-Millet.png',
      ),
      ProductDataModel(
        id: '7',
        name: 'Sugarcane',
        description: 'Fresh sugarcane sticks, perfect for winter munching.',
        price: '₹25/stick',
        category: 'Sweeteners',
        imageUrl:
            'https://www.saveur.com/uploads/2022/03/05/sugarcane-linda-xiao.jpg?auto=webp&width=2000&height=1333',
      ),
      ProductDataModel(
        id: '8',
        name: 'Carrots (Red)',
        description: 'Fresh winter carrots, perfect for salads or cooking.',
        price: '₹40/kg',
        category: 'Fruits',
        imageUrl:
            'https://individualfitnessllc.com/wp-content/uploads/2022/04/health-benefits-of-carrots.jpg',
      ),
    ];
  }
}
