import 'package:flutter/material.dart';
import 'package:moviemot/utils/constant.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.5),
          color: isSelected ? Constant.primaryColor : Colors.transparent,
        ),
        child: isSelected
            ? Row(
                children: [
                  const Icon(Icons.home, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              )
            : Icon(
                icon,
                color: const Color(0xffB8B8B9),
              ),
      ),
    );
  }
}
