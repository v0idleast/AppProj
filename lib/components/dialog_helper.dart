import 'package:flutter/material.dart';

class DialogHelper {

  // 8. AlertDialog з рейтингом (Реальний кейс: Оцініть наш застосунок)
  static void showAppRatingDialog(BuildContext context) {
    int rating = 5; // За замовчуванням ставимо 5 зірок (ми ж любимо свій додаток)

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder( // StatefulBuilder дозволяє зірочкам оновлюватися без перемальовування всього екрана
        builder: (context, setState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Трохи заокруглюємо краї для краси
          title: const Text(
            "Оцініть «Риболов» 🎣",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Щоб вікно не розтягувалось на весь екран
            children: [
              const Text(
                "Чи подобається вам наш застосунок? Ваша оцінка допоможе нам стати кращими!",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Генеруємо ряд із 5 інтерактивних зірочок
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < rating ? Icons.star_rounded : Icons.star_border_rounded,
                      color: Colors.amber, // Колір золотої зірки
                      size: 40,
                    ),
                    onPressed: () => setState(() => rating = index + 1), // Оновлюємо кількість зірок при натисканні
                  );
                }),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Пізніше", style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF39ADD2), // Фірмовий колір Риболова
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                Navigator.pop(context); // Закриваємо вікно
                // Показуємо подяку користувачу
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      rating >= 4
                          ? "Дякуємо за високу оцінку! ($rating зірок)"
                          : "Дякуємо за відгук! Ми будемо працювати краще.",
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: const Text("Оцінити", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}