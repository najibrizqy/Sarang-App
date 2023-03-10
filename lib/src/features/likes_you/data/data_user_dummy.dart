import 'package:sarang_app/src/features/likes_you/domain/user.dart';
import 'package:sarang_app/src/theme_manager/asset_image_icon_manager.dart';

List<User> dataUserDummy = [
  User(
    fullName: 'Yunita',
    age: 22,
    occupation: 'Teacher',
    description:
        'I love solving problem in terms of finance, business, and any case. With you, we will solve all world problems.',
    imagePath: '${AssetImageIconManager.assetPath}/people_love1_image.png',
  ),
  User(
    fullName: 'Rimadona',
    age: 24,
    occupation: 'Doctor',
    description:
        'Helping people life is really fun for me and I really wanted to cure the world from all of the disease that we currently have.',
    imagePath: '${AssetImageIconManager.assetPath}/people_love2_image.png',
  ),
  User(
    fullName: 'Aninda',
    age: 21,
    occupation: 'Entrepreneur',
    description:
        'I want to have big business and create a great impact for the people, finance, health, and many good things in this world.',
    imagePath: '${AssetImageIconManager.assetPath}/people_love3_image.png',
  ),
];
