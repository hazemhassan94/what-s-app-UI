import 'package:flutter/cupertino.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

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
                
                Align(
                  alignment: Alignment.centerLeft,
                  child: CupertinoButton(
                    onPressed: () {
                    
                    },
                    child: const Text(
                      'Edit',
                      style: TextStyle(color: Color(0xFF075E54), fontSize: 17), 
                    ),
                  ),
                ),
                
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'RECENT',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ),
               
                _buildCallTile(
                  context,
                  name: 'Alice',
                  time: 'Today, 10:00 AM',
                  type: 'Incoming',
                  avatarLetter: 'A',
                  isMissed: false,
                ),
                _buildCallTile(
                  context,
                  name: 'Bob',
                  time: 'Yesterday, 3:00 PM',
                  type: 'Outgoing',
                  avatarLetter: 'B',
                  isMissed: false,
                ),
                _buildCallTile(
                  context,
                  name: 'Charlie',
                  time: 'Yesterday, 1:00 PM',
                  type: 'Missed',
                  avatarLetter: 'C',
                  isMissed: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCallTile(
    BuildContext context, {
    required String name,
    required String time,
    required String type,
    required String avatarLetter,
    bool isMissed = false,
  }) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        // Handle call detail view
      },
      child: Container(
        color: CupertinoColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          children: [
            CupertinoCircleAvatar(
              backgroundColor: CupertinoColors.systemGreen, // Example color
              child: Text(
                avatarLetter,
                style: const TextStyle(color: CupertinoColors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: isMissed ? CupertinoColors.systemRed : CupertinoColors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        type == 'Incoming'
                            ? CupertinoIcons.arrow_down_left
                            : type == 'Outgoing'
                                ? CupertinoIcons.arrow_up_right
                                : CupertinoIcons.phone_down_fill,
                        size: 16,
                        color: isMissed ? CupertinoColors.systemRed : CupertinoColors.systemGrey,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 13,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(CupertinoIcons.info_circle, color: Color(0xFF075E54), size: 24), // WhatsApp green info icon
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
