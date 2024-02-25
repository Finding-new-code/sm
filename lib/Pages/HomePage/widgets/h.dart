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
                          //  final lastpost = context.watch<GetLastestPosts>();

                          final post = state.posts[index];
                          final user = state.users[index];
                          // here the post are fetched from databases then shown to the homepage =>
                          return Animate(
                            effects:  const [
                              SlideEffect(
                                  delay: Duration(seconds: 1),
                                  duration: Duration(seconds: 1),
                                  curve: Curves.easeInOut)
                            ],
                            child: PostContainer(
                              user: user,
                              post: post,
                            ),
                          );

                          /// here the post are fetched from databases then shown to the homepage =>
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox.shrink(),
                        shrinkWrap: true,
                        itemCount: state.posts.length)),

              ///  here i change the button
              // Positioned(
              //   bottom: 15,
              //   left: 290,
              //   right: 0,
              //   child: GestureDetector(
              //     onTap: () => Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const PostCreationPage())),
              //     child: Container(
              //         height: 70,
              //         decoration: const BoxDecoration(
              //           image: DecorationImage(
              //               image: AssetImage("assets/images/add_button.png"),
              //               scale: 100.0,
              //               isAntiAlias: true,
              //               fit: BoxFit.cover),
              //           shape: BoxShape.circle,
              //         ),
              //         child: const SizedBox(
              //           width: 60,
              //           height: 60,
              //           child: Icon(
              //             Icons.add,
              //             size: 25,
              //             color: Colors.white,
              //           ),
              //         )),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
