
import 'package:flutter/cupertino.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1)); 
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
         
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CupertinoCircleAvatar(
                        backgroundColor: CupertinoColors.systemGrey3,
                        radius: 25,
                        child: const Icon(CupertinoIcons.person_fill, color: CupertinoColors.white), // Adjust size
                      ),
                      const SizedBox(width: 15),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Status',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: CupertinoColors.black,
                              ),
                            ),
                            Text(
                              'Tap to add status update',
                              style: TextStyle(
                                fontSize: 13,
                                color: CupertinoColors.systemGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const Icon(CupertinoIcons.camera_fill, color: Color(0xFF075E54)),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const Icon(CupertinoIcons.pencil, color: Color(0xFF075E54)), 
                      ),
                    ],
                  ),
                ),
                
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'RECENT UPDATES',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ),
                
                _buildStatusTile('Alice', '10 minutes ago', 'A', isViewed: false),
                _buildStatusTile('Bob', '30 minutes ago', 'B', isViewed: false),
                _buildStatusTile('Charlie', '1 hour ago', 'C', isViewed: true),
                _buildStatusTile('David', '2 hours ago', 'D', isViewed: false),
                _buildStatusTile('Eve', 'Yesterday, 5:00 PM', 'E', isViewed: true),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'VIEWED UPDATES',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ),
                _buildStatusTile('Frank', 'Today, 9:00 AM', 'F', isViewed: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusTile(String name, String time, String avatarLetter, {required bool isViewed}) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        // Handle tap on status
      },
      child: Container(
        color: CupertinoColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isViewed ? CupertinoColors.systemGrey4 : const Color(0xFF25D366), 
                  width: 2.0,
                ),
              ),
              child: CupertinoCircleAvatar(
                backgroundColor: CupertinoColors.activeBlue,
                radius: 25, 
                child: Text(
                  avatarLetter,
                  style: const TextStyle(color: CupertinoColors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: CupertinoColors.black,
                    ),
                  ),
                  Row( 
                    children: [
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 13,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                      
                      if (isViewed) 
                        const Padding(
                          padding: EdgeInsets.only(left: 4.0), 
                          child: Text(
                            '0', 
                            style: TextStyle(
                              fontSize: 10,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CupertinoCircleAvatar extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final double radius;

  const CupertinoCircleAvatar({
    super.key,
    this.child,
    this.backgroundColor,
    this.radius = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: backgroundColor ?? CupertinoColors.activeBlue,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
