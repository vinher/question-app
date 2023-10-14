import 'package:flutter/material.dart';


class HerMessage extends StatelessWidget {
  const HerMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration:  BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
            ),
            child: const Padding(
          padding:  EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
          child: Text("Hola Mundo"),
        ),
        ),
        
        const SizedBox(height: 5,),
        _ImageBubble(),
        const SizedBox(height: 10,)
      ],
    );
  }
}

    class _ImageBubble extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        //Informa acerca del tamañoi de la pantalla del dispositivo
        final size = MediaQuery.of(context).size;
        return ClipRRect( 
          borderRadius: BorderRadius.circular(20),
          //Cambiar imagen por gif de la api de gif
          child:Image.network('https://media0.giphy.com/media/Uj1eNUI2qqujwBzQEA/giphy.gif?cid=ecf05e47sqq7ofzkm65ci9espoo4yf1c71k3u3pc4dsibuc5&ep=v1_gifs_gifId&rid=giphy.gif&ct=g',
          width: size.width * 0.7,
          height: 150,
          fit:BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if(loadingProgress ==null)return child;
                return Container(
                  width: size.width * 0.7,
                  height: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: const Text('Escribiendo Mensaje'),
                );
            
          },),
          
        );
      }
} 