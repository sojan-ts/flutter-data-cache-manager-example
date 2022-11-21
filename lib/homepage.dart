import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:data_cache_manager/data_cache_manager.dart';

final DataCacheManager manager = DefaultDataCacheManager.instance;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String key = 'physics';
  final String value = 'relativity';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          children: [
            Container(
              child: TextButton(
                  onPressed: () async {
                    await manager.add(key, value);
                  },
                  child: Text("Save")),
            ),
            Container(
              child: TextButton(
                  onPressed: () async {
                    final cachedData = await manager.get(key);
                    Object? datavalue = cachedData?.value;
                    print(datavalue.toString());
                    // print("Read : ${cachedData?.value}");
                  },
                  child: Text("Read")),
            )
          ],
        ),
      ),
    );
  }
}
