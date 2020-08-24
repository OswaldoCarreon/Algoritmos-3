int cantidad = 4;
int[] kilos = {1,2,2,4};
int[] ganancia = {5,30,20,30};
int inf = -999999;


void setup(){
  int[][] cganancia = new int[kilos.length][cantidad]; //cganancia = cantidad de ganancia que llevo
  int[][] ckilos = new int[kilos.length][cantidad];  //ckilos = cantidad de kilos que llevo
  int[][][] objetos = new int[kilos.length][cantidad][kilos.length];  //objetos = la lista de objetos que llevo
    
  dp_mochila(cganancia, ckilos, objetos);
  print_solucion(cganancia,objetos);

}


void dp_mochila(int[][] cganancia,int[][]ckilos,int[][][] objetos){
  //----------------- LLENANDO LA PRIEMRA FILA
  for(int i=0; i<cantidad; i++){
    if((i+1) / kilos[0] >= 1){
      objetos[0][i][0] = 1;
      cganancia[0][i] = ganancia[0];
      ckilos[0][i] = kilos[0];
      
    } else {
      cganancia[0][i] = inf;
    }
  }
  //----------------- PRIMERA FILA LLENADA
  
  
  int restante;
  for(int i=1; i<kilos.length; i++){
   for(int j=0; j<cantidad; j++){
     if((j+1) / kilos[i] >= 1){ // Si el objeto puede solvetar la capacidad.
      objetos[i][j][i] = 1;
      cganancia[i][j] = ganancia[i];
      ckilos[i][j] = kilos[i];
      restante = (j+1)-kilos[i];
      
      if(restante > 0 ){ // Si me sobra peso,
      
        if(cganancia[i-1][restante-1] != inf ){ //le sumo el objeto que complemente ese peso, en caso de que se pueda.
          objetos[i][j] = sumar(objetos[i][j],objetos[i-1][restante-1]);
          cganancia[i][j] += cganancia[i-1][restante-1];
          ckilos[i][j] += ckilos[i-1][restante-1];
        }
      } 
        
      if(cganancia[i-1][j] > cganancia[i][j]){ //Comparo cuál solucion es mejor, si la que acabo de calcular o la de arriba.
          objetos[i][j] = objetos[i-1][j];
          cganancia[i][j] = cganancia[i-1][j];
          ckilos[i][j] = ckilos[i-1][j];
          
        } else if(cganancia[i-1][j] == cganancia[i][j]){// Si las ganancias son iguales, tomo lo que me consume menos peso.
          if(ckilos[i-1][j] <= ckilos[i][j]){
            objetos[i][j] = objetos[i-1][j];
            cganancia[i][j] = cganancia[i-1][j];
            ckilos[i][j] = ckilos[i-1][j];
          }
        }
        
  
     } else { // Si el objeto no puede solverntar la capacidad, entonces copio la solución de arriba.
      objetos[i][j] = objetos[i-1][j];
      cganancia[i][j] = cganancia[i-1][j];
      ckilos[i][j] = ckilos[i-1][j];
     }
     
   }
  }
  
  
  
}


int[] sumar(int[] vector1, int[] vector2){
  int[] suma = new int[vector1.length];
  
  for(int i=0; i<vector1.length; i++){
    if(vector1[i] != vector2[i]){ 
       suma[i] = vector1[i] + vector2[i];
    }
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
