import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/Video.dart';
const CHAVE_YOUTUBE_API = "aqui vai a chave de api do Youtube!";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  Future<List<Video>>pesquisar(String pesquisa) async{

    http.Response response = await http.get(
      URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          "&channelId=$ID_CANAL" //retirar esse para pesquisar no youtube inteiro e não só nesse canal específicado.
          "&q=$pesquisa"

    );

    if(response.statusCode == 200){

      //print("resultado: " + response.body);

      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>(

          (map){

            return Video.fromJson(map);

          }

      ).toList();

      return videos;


      //print("resultado: " + dadosJson[""]);

    }else{

    }

  }

}

