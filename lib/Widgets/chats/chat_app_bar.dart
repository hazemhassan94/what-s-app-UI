import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String avatar;
  final bool isOnline;

  const ChatAppBar({
    required this.name,
    required this.avatar,
    required this.isOnline,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: const Color(0xFF075E54), 
      leading: CupertinoNavigationBarBackButton(
        color: CupertinoColors.white,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      middle: Row(
        children: [
          CupertinoCircleAvatar(
            backgroundColor: const Color(0xFF25D366),
            child: Text(
              avatar,
              style: const TextStyle(color: CupertinoColors.white),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: CupertinoColors.white),
                ),
                Text(
                  isOnline ? 'Online' : 'Last seen recently',
                  // ignore: deprecated_member_use
                  style: TextStyle(fontSize: 12, color: CupertinoColors.white.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(CupertinoIcons.video_camera_solid, color: CupertinoColors.white),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(CupertinoIcons.phone_fill, color: CupertinoColors.white),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
             
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) => CupertinoActionSheet(
                  title: Text(name),
                  actions: <CupertinoActionSheetAction>[
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                        
                      },
                      child: const Text('View contact'),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                        
                      },
                      child: const Text('Media, links, and docs'),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                        
                      },
                      child: const Text('Search'),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                       
                      },
                      child: const Text('Mute notifications'),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                        
                      },
                      child: const Text('Wallpaper'),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                        
                      },
                      child: const Text('More'),
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ),
              );
            },
            child: const Icon(CupertinoIcons.ellipsis_vertical, color: CupertinoColors.white),
          ),
        ],
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
    this.radius = 20, 
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
