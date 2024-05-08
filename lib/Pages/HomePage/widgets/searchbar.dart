import 'package:flutter/material.dart';
import '../../../constants/tools.dart';
import '../../ProfilePage/View/profilepage.dart';
import '../bloc/home_bloc.dart';

class SearchBarNew extends StatelessWidget {
  const SearchBarNew({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                  height: 45,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 20, 20, 32),
                  ),
                  child: TextField(
                    style: GoogleFonts.inter(color: Colors.white),
                    controller: searchController,
                    onSubmitted: (value) =>
                        context.read<HomeBloc>().add(UserSearched(value)),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                if (state is UserSearchedSuccessfully)
                Offstage(
                  offstage: state.users.isEmpty ? true : false,
                  child: Animate(
                    effects: const [SlideEffect()],
                    child: SingleChildScrollView(
                      child: Container(
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 47, 47, 59),
                          ),
                          child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: state.users.length,
                              itemBuilder: (BuildContext context, int index) {
                                  final usersearched = state.users[index];
                                return GestureDetector(
                                  onTap: () {
                                   // context.read<ProfileBloc>().add();
                                    Navigator.push(context, 
                                  MaterialPageRoute(builder: (context) => ProfilePage(user: usersearched,),));} , 
                                  child: ListTile(
                                      leading: CircleAvatar(
                                          backgroundColor: Colors.black,
                                          backgroundImage: NetworkImage(usersearched.profilePicture)),
                                      title: Text(
                                        usersearched.name,
                                        style: GoogleFonts.inter(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Text(
                                        usersearched.bio
                                      )),
                                );
                              })),
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
