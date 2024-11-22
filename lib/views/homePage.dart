import 'package:flutter/material.dart';
import 'package:pixabay_api/provider/homeProvider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double Mheight = MediaQuery.sizeOf(context).height;
    double Mwidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        elevation: 5,
        shadowColor: Colors.black,
        title: const Text(
          'Home Page',
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          if (provider.pixabay != null) {
            return ListView.builder(
              itemCount: provider.pixabay!.hits.length,
              itemBuilder: (context, index) => Container(
                height: Mheight * 0.4,
                width: Mwidth,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: NetworkImage(
                            provider.pixabay!.hits[index].largeImageURL!),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                          color: Colors.black45),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(

                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(provider
                                      .pixabay!.hits[index].userImageURL!),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${provider.pixabay!.hits[index].user!}\n${provider.pixabay!.hits[index].tags!}',
                                  overflow: TextOverflow.ellipsis ,
                                  style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: Colors.black38,
                            child: Icon(Icons.vertical_align_bottom,color: Colors.white,),
                          ),
                          SizedBox(width: 10,)
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25)),
                            color: Colors.black45),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(

                            children: [
                              SizedBox(width:10 ,),
                              Row(
                                children: [
                                Icon(Icons.favorite_border,color: Colors.white,size: 20,),
                                  SizedBox(width: 5,),
                                  Text(provider.pixabay!.hits[index].likes!.toString(),style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              SizedBox(width:10 ,),
                              Row(
                                children: [
                                Icon(Icons.comment,color: Colors.white,size: 20,),
                                  SizedBox(width: 5,),
                                  Text(provider.pixabay!.hits[index].comments!.toString(),style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              SizedBox(width:10 ,),
                              Row(
                                children: [
                                Icon(Icons.download_rounded,color: Colors.white,size: 20,),
                                  SizedBox(width: 5,),
                                  Text(provider.pixabay!.hits[index].downloads!.toString(),style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
