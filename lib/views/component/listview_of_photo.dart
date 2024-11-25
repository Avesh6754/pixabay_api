import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../provider/homeProvider.dart';

Expanded listbox(double Mheight) {
  return Expanded(
    child: Consumer<HomeProvider>(
      builder: (context, provider, child) {
        if (provider.pixabay != null && provider.searchpixabay == null) {
          return ListView.builder(
              itemCount: provider.pixabay!.hits.length,
              itemBuilder: (context, index) => Container(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black38, width: 1))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(provider
                                      .pixabay!.hits[index].userImageURL!),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  provider.pixabay!.hits[index].user.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      letterSpacing: 1),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: Mheight * 0.40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(provider
                                      .pixabay!.hits[index].largeImageURL!),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.black38, width: 1))),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 20),
                                    Icon(
                                      Icons.comment_outlined,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.download),
                                    Spacer(),
                                    Icon(Icons.bookmark_border),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${provider.pixabay!.hits[index].likes!} Likes',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${provider.pixabay!.hits[index].downloads!} Downloads',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Tags: ${provider.pixabay!.hits[index].tags!}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'View all ${provider.pixabay!.hits[index].comments!} comments',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade700),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                    Colors.green)),
                                        onPressed: () async {
                                          Uri uri = Uri.parse(
                                              '${provider.pixabay!.hits[index].pageUrl}');
                                          await launchUrl(uri,
                                              mode: LaunchMode.inAppWebView);
                                        },
                                        child: const Row(
                                          children: [
                                            Text(
                                              'Download Link',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),

                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.download_rounded,
                                              color: Colors.white,
                                              size: 20,
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
        } else if (provider.searchpixabay != null) {
          return ListView.builder(
              itemCount: provider.searchpixabay!.hits.length,
              itemBuilder: (context, index) => Container(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black38, width: 1))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(provider
                                      .searchpixabay!
                                      .hits[index]
                                      .userImageURL!),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  provider.searchpixabay!.hits[index].user
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      letterSpacing: 1),
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: Mheight * 0.40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(provider.searchpixabay!
                                      .hits[index].largeImageURL!),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.black38, width: 1))),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 20),
                                    Icon(
                                      Icons.comment_outlined,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.download),
                                    Spacer(),
                                    Icon(Icons.bookmark_border),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${provider.searchpixabay!.hits[index].likes!} Likes',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${provider.searchpixabay!.hits[index].downloads!} Downloads',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Tags: ${provider.searchpixabay!.hits[index].tags!}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'View all ${provider.searchpixabay!.hits[index].comments!} comments',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade700),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                            WidgetStatePropertyAll(
                                                Colors.green)),
                                        onPressed: () async {
                                          Uri uri = Uri.parse(
                                              '${provider.searchpixabay!.hits[index].pageUrl}');
                                          await launchUrl(uri,
                                              mode: LaunchMode.inAppWebView);
                                        },
                                        child: const Row(
                                          children: [
                                            Text(
                                              'Download Link',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.download_rounded,
                                              color: Colors.white,
                                              size: 20,
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ),
  );
}
