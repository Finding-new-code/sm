import 'package:flutter/material.dart';
import '../../../components/failure.dart';
import '../../../components/postsection.dart';
import '../../../constants/tools.dart';
import '../bloc/home_bloc.dart';

class PostList extends StatefulWidget {
  final bool isdark;
  const PostList({
    super.key,
    required this.isdark,
  });

  @override
  State<PostList> createState() => _HomePageState();
}

// final List theme = ['light', 'system', 'dark'];

class _HomePageState extends State<PostList> {
  // final List<String> themeoption = theme[0];
  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(GetNewPosts());
    return BlocConsumer<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is HomeError) {
          errorbottomsheet(context, state.message);
        }
        if (state is HomeLoading) {
          const CircularProgressIndicator.adaptive();
        }
      },
      builder: (context, state) {
        return Scaffold(

          /// here the body of the homepage
          body: Stack(
            children: [
              if (state is HomeLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else if (state is HomeLoaded)
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                         final lastpost = context.watch<GetLastestPosts>();
                        
                          final post = state.posts[index];
                          // here the post are fetched from databases then shown to the homepage =>
                          return PostContainer(
                           post: post,
                          );

                          /// here the post are fetched from databases then shown to the homepage =>
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox.shrink(),
                        shrinkWrap: true,
                        itemCount: state.posts.length)),
              
            ],
          ),
        );
      },
    );
  }
}

//  username: "satya Prakash nayak",
//                             userImage: "https://picsum.photos/200/300",
//                             caption: post.posttext,
//                             postimage: const [],