part of '../post_view_and_show_posts.dart';

class _AddPost extends StatelessWidget {
  const _AddPost();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: AppTextField(
              textController: TextEditingController(),
              isReadOnly: true,
              onTap:
                  () => context.read<PostsCubit>().navigatePost(
                    NavigatePost.addNewPost,
                  ),
              colorBorder: context.theme.buttonColor,
              hintText: context.lang.addPost,
            ),
          ),
          CircleAvatar(
            radius: 3.h,
            backgroundColor: context.theme.buttonColor,
            child: Icon(Icons.post_add, color: Colors.white, size: 4.h),
          ),
        ],
      ),
    );
  }
}
