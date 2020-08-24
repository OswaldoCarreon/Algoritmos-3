int cantidad = 7;
int[] kilos = {2,3,2,4};
int[] ganancia = {5,30,20,30};
int inf = -999999;

int[][] cganancia = new int[kilos.length][cantidad]; //cganancia = cantidad de ganancia que llevo
int[][] ckilos = new int[kilos.length][cantidad];  //ckilos = cantidad de kilos que llevo
int[][][] objetos = new int[kilos.length][cantidad][kilos.length];  //objetos = la lista de objetos que llevo

void setup(){
   dp_Mochila(kilos.length-1, cantidad-1);
   print_solucion(cganancia,objetos);
}


void dp_Mochila(int fila, int columna){
  if(cganancia[fila][columna] != 0)  return;
  
  if(fila == 0){
         if( (columna+1)/kilos[fila] >= 1){
             cganancia[fila][columna] = ganancia[fila];
             ckilos[fila][columna] = kilos[fila];
             objetos[fila][columna][fila] = 1;
         } else {
             cganancia[fila][columna] = inf;
             ckilos[fila][columna] = inf;
         }
         return;
    }
    
    if(  (columna+1)/kilos[fila] >= 1  ){
          dp_Mochila(fila-1,columna);
          
          int restante = (columna+1)-kilos[fila];
          
          if(  restante > 0  ) dp_Mochila(fila-1,restante-1);
            
          cganancia[fila][columna] = ganancia[fila];
          ckilos[fila][columna] = kilos[fila];
          objetos[fila][columna][fila] = 1;
          
          if(  restante > 0  ){
             cganancia[fila][columna] += cganancia[fila-1][restante-1]; 
             objetos[fila][columna] = sumar( objetos[fila][columna],objetos[fila-1][restante-1]  );
          }
          
          if( cganancia[fila][columna] < cganancia[fila-1][columna] ){
              cganancia[fila][columna] = cganancia[fila-1][columna];
              ckilos[fila][columna] = ckilos[fila-1][columna];
              objetos[fila][columna] = objetos[fila-1][columna];
          }

    } else {
         cganancia[fila][columna] = cganancia[fila-1][columna];
         ckilos[fila][columna] = ckilos[fila-1][columna];
         objetos[fila][columna] = objetos[fila-1][columna];
    }
    
}


int[] sumar(int[] vector1, int[] vector2){
  int[] suma = new int[vector1.length];
  for(int i=0; i<vector1.length; i++){
       suma[i] = vector1[i] + vector2[i];
  }
  return suma;
}


void print_solucion(int[][] nmonedas,int[][][] dmonedas){
  print('\t');
  for(int c=1;c<=cantidad;c++){
    print(c);print('\t');
  }
  println();
  for(int m=0;m<kilos.length;m++){
    print("$");print(kilos[m]);print('\t');
    for(int c=1;c<=cantidad;c++){
      print(nmonedas[m][c-1]);print('\t');
    }
    println();print('\t');
    for(int c=1;c<=cantidad;c++){
      print("(");
      for(int mm=0;mm<kilos.length;mm++){
        print(dmonedas[m][c-1][mm]);
      }
      print(")");print('\t');
    }
    println();
  }
}
