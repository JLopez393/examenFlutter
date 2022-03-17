import 'package:flutter/material.dart';
import 'package:pruebaflutter/class/photos_class.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PhotosClass cPhotos =
        ModalRoute.of(context)!.settings.arguments as PhotosClass;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(
          cPhotos: cPhotos,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          _EncabezadoFoto(
            sUrlFoto: cPhotos.user!.profileImage!.medium!.split('?')[0],
            sTitulo: cPhotos.user!.name!,
            iLikes: cPhotos.likes!,
          ),
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final PhotosClass cPhotos;
  const _CustomAppBar({Key? key, required this.cPhotos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            color: Colors.black12,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: Text(
              cPhotos.user!.name!,
              style: const TextStyle(fontSize: 24),
            )),
        background: FadeInImage(
          fit: BoxFit.cover,
          width: double.infinity,
          placeholder: const AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(cPhotos.urls!.full!.split('?')[0]),
        ),
      ),
    );
  }
}

class _EncabezadoFoto extends StatelessWidget {
  final String sUrlFoto;
  final String sTitulo;
  final int iLikes;
  const _EncabezadoFoto(
      {Key? key,
      required this.sUrlFoto,
      required this.sTitulo,
      required this.iLikes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dAlto = MediaQuery.of(context).size.height;
    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
              height: dAlto * 0.2,
              placeholder: const AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(sUrlFoto),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              sTitulo,
              style: Theme.of(context).textTheme.headline5,
              overflow: TextOverflow.clip,
            ),
            Text(sTitulo),
            Row(children: [
              Row(
                children: [
                  const Icon(Icons.thumb_up_alt_outlined),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(iLikes.toString())
                ],
              )
            ])
          ]),
        ]));
  }
}
