import 'package:flutter/material.dart';

import '../model/response_body_model.dart';

Widget buildGithubList(List<Item> items) {
  return Column(
      children: [
         ListView.builder(
            itemCount: items.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                  },
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text(items[index].name!),
                      ],
                    ),
                  ),
                
              );
            }),
      ],
    
  );
}
