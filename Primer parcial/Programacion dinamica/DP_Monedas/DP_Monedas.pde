int inf = 99999;
int cantidad=12;
int[] monedas={1,2,5};

void setup(){
    int[][]nmonedas= new int[monedas.length][cantidad];
    int[][][] dmonedas=new int [monedas.length][cantidad][monedas.length];
    dp_monedas(nmonedas,dmonedas);
}


void dp_monedas(int[][]nmonedas, int[][][]dmonedas){ 
  //Primer paso: calcular la primer fila 
  for(int i=1; i<=cantidad; i++){
       if(i%monedas[0] == 0){
         nmonedas[0][i-1] = i/monedas[0];
         dmonedas[0][i-1][0] = i/monedas[0];
       } else {
         nmonedas[0][i-1] = inf;
         dmonedas[0][i-1][0] = inf;
     }
     
  }
  printTabla(nmonedas);
  println();
  
  // Segundo paso: 
  
  int restante = 0;
  
  for(int i=1; i<monedas.length; i++){
   for(int j=0; j<cantidad; j++){
     
     if( (j+1)/monedas[i] >= 1){
       dmonedas[i][j][i] = 1; // pongo una moneda y después hago la resta para ver cuánto me falta.
       restante = (j+1)-monedas[i];
       
       if(restante == 0){  // Si la resta es exacta, entonces sólo se uso una moneda y esa es la mejor solución.
         nmonedas[i][j] = 1;
       }
       
       else if (restante>0){ // Si no, entonces suma la una moneda que puse + las monedas de la solución anterior en la tabla
         dmonedas[i][j] = sumar(dmonedas[i][j],dmonedas[i][restante-1]);
         nmonedas[i][j] = contarMonedas(dmonedas[i][j]);
         
         if( nmonedas[i][j] > nmonedas[i-1][j] ){  //Pregunto si la cantidad de monedas que tengo es mejor que la de arriba, si es así, actualizo y me quedo con la de arirba, si no, así lo dejo.
             nmonedas[i][j] = nmonedas[i-1][j];
             dmonedas[i][j] = dmonedas[i-1][j];
         } 
         
       }
       
     } else {  // No alcanzo a cubrir la cantidad con la moneda, entonces copia la solución de arirba.
         nmonedas[i][j] = nmonedas[i-1][j];
         dmonedas[i][j] = dmonedas[i-1][j];
         
     }
   }
  }
  
  
  printTabla(nmonedas);
  //print_solucion(nmonedas,dmonedas);
}










int contarMonedas(int[] vector){
  int msuma = 0;
  for(int i=0; i<vector.length; i++){
     msuma+=vector[i];
  }
  
  return msuma;
}

int[] sumar(int[] vector1, int[] vector2){
  int[] suma = new int[vector1.length];
  
  for(int i=0; i<vector1.length; i++){
     suma[i] = vector1[i] + vector2[i];
  }
  
  return suma;
}


void printTabla(int[][] tabla){
   for(int i=0; i<monedas.length; i++){
     for(int j=0; j<cantidad; j++){
        print(tabla[i][j],", ");
     }
     println();
   }
}


void print_solucion(int[][] nmonedas,int[][][] dmonedas){
  print('\t');
  for(int c=1;c<=cantidad;c++){
    print(c);print('\t');
  }
  println();
  for(int m=0;m<monedas.length;m++){
    print("$");print(monedas[m]);print('\t');
    for(int c=1;c<=cantidad;c++){
      print(nmonedas[m][c-1]);print('\t');
    }
    println();print('\t');
    for(int c=1;c<=cantidad;c++){
      print("(");
      for(int mm=0;mm<monedas.length;mm++){
        print(dmonedas[m][c-1][mm]);
      }
      print(")");print('\t');
    }
    println();
  }
}
