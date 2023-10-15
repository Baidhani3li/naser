
import 'package:flutter/material.dart';
import 'package:naser/models/asset_model.dart';

class AssetItem extends StatelessWidget {
  final AssetModel asset;
  const AssetItem(this.asset, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(asset.label),
        subtitle: Text('ID: ${asset.id}'),
      ),
    );
  }
}
