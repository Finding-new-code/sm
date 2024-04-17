import 'package:flutter/material.dart';
import '../../../components/failure.dart';
import '../../../components/postsection.dart';
import '../../../constants/appwriteconstants.dart';
import '../../../constants/tools.dart';
import '../../../src/src.dart';
import '../../Postcreation/View/postcreation.dart';
import '../bloc/home_bloc.dart';

// ignore: must_be_immutable
class PostList extends StatefulWidget {
  Realtime? realtime;
  PostList({
    super.key,
    this.realtime,
  });

  @override
  State<PostList> createState() => _HomePageState();
}

final ScrollController _scrollController = ScrollController();
// final List theme = ['light', 'system', 'dark'];

class _HomePageState extends State<PostList> {
  // final List<String> themeoption = theme[0];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: servicelocator.get<HomeBloc>()..add(GetNewPosts()),
      buildWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is HomeError) {
          errorbottomsheet(context, state.message);
        }
        if (state is HomeLoading) {
          const CircularProgressIndicator.adaptive();
        }
        if (state is LastestPostLoaded) {
          return debugPrint(
              "here the lastest post from the appwrite realtime ${state.lastestpost.toString()}");
        }
      },
      builder: (context, state) {
        return Scaffold(
          /// here the body of the homepage
          body: Stack(
            fit: StackFit.expand,
            children: [
              if (state is HomeLoaded)
                StreamBuilder(
                    stream: servicelocator.get<Realtime>().subscribe([
                      'databases.${AppwriteConstants.projectdatabases}.collections.${AppwriteConstants.postCollection}.documents'
                    ]).stream,
                    builder:(context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.events.contains(
                            'databases.${AppwriteConstants.projectdatabases}.collections.${AppwriteConstants.postCollection}.documents.*.create')) {
                          state.posts
                              .insert(0, Post.fromMap(snapshot.data!.payload));
                        }
                      }
                      return ListView.separated(
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            final post = state.posts[index];
                            final user = state.users[index];
                            // here the post are fetched from databases then shown to the homepage =>
                            return Animate(
                              effects: const [
                                SlideEffect(
                                    delay: Duration(milliseconds: 500),
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
                          itemCount: state.posts.length);
                    }),

              //// here i change the button
              Positioned(
                bottom: 15,
                left: 290,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostCreationPage()));
                  },
                  child: Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/add_button.png"),
                            scale: 100.0,
                            isAntiAlias: true,
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                      ),
                      child: const SizedBox(
                        width: 60,
                        height: 60,
                        child: Icon(
                          Icons.add,
                          size: 25,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
