import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/feature/admin/manage_progress/model/progress_mode.dart';

class UserProgressCard extends StatelessWidget {
  final UserProgress user;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const UserProgressCard({
    Key? key,
    required this.user,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardPadding = screenWidth * 0.04;
    final fontSize = screenWidth * 0.045;

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: cardPadding,
          vertical: cardPadding * 0.3,
        ),
        padding: EdgeInsets.all(cardPadding),
        decoration: BoxDecoration(
          color: const Color(0xFF3C3C3C),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Profile Image
            CircleAvatar(
              radius: screenWidth * 0.065,
              backgroundImage: NetworkImage(user.profileImage),
            ),
            
            SizedBox(width: cardPadding),
            
            // User Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: cardPadding * 0.2),
                  Row(
                    children: [
                      Text(
                        user.progressStatus,
                        style: TextStyle(
                          color: user.isProgressUp ? Colors.green : Colors.red,
                          fontSize: fontSize * 0.8,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: cardPadding * 0.5),
                      Icon(
                        user.isProgressUp ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                        color: user.isProgressUp ? Colors.green : Colors.red,
                        size: fontSize,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // More Options
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white70,
              ),
              color: const Color(0xFF2C2C2C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  value: 'view',
                  child: Row(
                    children: [
                      const Icon(Icons.visibility, color: Colors.white70, size: 20),
                      SizedBox(width: screenWidth * 0.03),
                      const Text(
                        'View Details',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'remove',
                  child: Row(
                    children: [
                      const Icon(Icons.delete, color: Colors.red, size: 20),
                      SizedBox(width: screenWidth * 0.03),
                      const Text(
                        'Remove',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
              onSelected: (value) {
                if (value == 'view') {
                  onTap();
                } else if (value == 'remove') {
                  onDelete();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressSearchBar extends StatelessWidget {
  final Function(String) onChanged;
  final String hintText;

  const ProgressSearchBar({
    Key? key,
    required this.onChanged,
    this.hintText = 'Search......',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenWidth * 0.02,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF3C3C3C),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white54),
          prefixIcon: const Icon(Icons.search, color: Colors.white54),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenWidth * 0.035,
          ),
        ),
      ),
    );
  }
}

class UserProgressDialog extends StatelessWidget {
  final UserProgress user;

  const UserProgressDialog({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: const Color(0xFF2C2C2C),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          CircleAvatar(
            radius: screenWidth * 0.05,
            backgroundImage: NetworkImage(user.profileImage),
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Text(
              user.name,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: screenWidth * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Progress Status:',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenWidth * 0.02),
            Row(
              children: [
                Text(
                  user.progressStatus,
                  style: TextStyle(
                    color: user.isProgressUp ? Colors.green : Colors.red,
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Icon(
                  user.isProgressUp ? Icons.trending_up : Icons.trending_down,
                  color: user.isProgressUp ? Colors.green : Colors.red,
                  size: screenWidth * 0.05,
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.04),
            const Text(
              'Progress Percentage:',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenWidth * 0.02),
            LinearProgressIndicator(
              value: user.progressPercentage / 100,
              backgroundColor: Colors.white24,
              valueColor: AlwaysStoppedAnimation<Color>(
                user.isProgressUp ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: screenWidth * 0.02),
            Text(
              '${user.progressPercentage.toInt()}%',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text(
            'Close',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}