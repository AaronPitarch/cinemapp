import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapp/presentation/providers/providers.dart';
import 'package:cinemapp/domain/entities/entities.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final FutureProviderFamily<List<Video>, int> videosFromMovieProvider = FutureProvider.family((ref, int movieId) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return movieRepository.getYoutubeVideosById(movieId);
});

class VideosFromMovie extends ConsumerWidget {
  final int movieId;

  const VideosFromMovie({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    final moviesFromVideo = ref.watch(videosFromMovieProvider(movieId));

    return moviesFromVideo.when(
      data: ( videos ) => _VideosList( videos: videos ),
      error: (_ , __) => const Center(child: Text('No se pudo cargar películas similares') ), 
      loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }
}

class _VideosList extends StatelessWidget {

  final List<Video> videos;

  const _VideosList({required this.videos });

  @override
  Widget build(BuildContext context) {

    if ( videos.isEmpty ) {
      return const SizedBox(); 
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Videos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        ),
        
        _YouTubeVideoPlayer(youtubeId: videos.first.youtubeKey, name: videos.first.name )
        
      ],
    );
  }
}

class _YouTubeVideoPlayer extends StatefulWidget {

  final String youtubeId;
  final String name;

  const _YouTubeVideoPlayer({ required this.youtubeId, required this.name });

  @override
  State<_YouTubeVideoPlayer> createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<_YouTubeVideoPlayer> {

  late YoutubePlayerController _controller;  

  @override
  void initState() {
    super.initState();
    
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeId,
      flags: const YoutubePlayerFlags(
        hideThumbnail: true,
        showLiveFullscreenButton: false,
        mute: false,
        autoPlay: false,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name),
          YoutubePlayer(controller: _controller)
        ],
      )
    );
  }
}

/*
Este código define un widget VideosFromMovie que muestra una lista de videos de 
YouTube relacionados con una película específica. La clase VideosFromMovie 
extiende ConsumerWidget y recibe un identificador de película como parámetro.

En el método build, se crea un widget watch que observa el proveedor 
videosFromMovieProvider con el identificador de película como argumento. El 
proveedor videosFromMovieProvider es un proveedor de tipo FutureProvider que 
devuelve una lista de videos de YouTube relacionados con la película específica.

El widget watch muestra un indicador de carga mientras se cargan los datos y 
muestra un mensaje de error si ocurre alguno. Si los datos se cargan 
correctamente, se crea un widget _VideosList que muestra la lista de videos.

El widget _VideosList muestra un título y un widget _YouTubeVideoPlayer que 
muestra el primer video de la lista.

El widget _YouTubeVideoPlayer extiende StatefulWidget y crea un objeto 
YoutubePlayerController que controla el reproductor de videos de YouTube. El 
objeto YoutubePlayerController se inicializa con un identificador de video y 
una lista de banderas que controlan el comportamiento del reproductor.

En resumen, el widget VideosFromMovie muestra una lista de videos de YouTube 
relacionados con una película específica. El widget watch observa el proveedor 
videosFromMovieProvider y muestra un indicador de carga o un mensaje de error. 
El widget _VideosList muestra el título y el primer video de la lista. 
El widget _YouTubeVideoPlayer crea un objeto YoutubePlayerController que 
controla el reproductor de videos de YouTube.
 */