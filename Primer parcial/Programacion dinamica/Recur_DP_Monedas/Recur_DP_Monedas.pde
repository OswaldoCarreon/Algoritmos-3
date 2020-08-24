int inf = 99999;
int cantidad=12;
int[] monedas={1,2,5};

int[][] cmonedas = new int[monedas.length][cantidad];
int[][][] cualmonedas =new int [monedas.length][cantidad][monedas.length];
int restante = 0;

void setup(){
    
    //print(monedas.length-1," ");
    //print(cantidad-1);
    dp_monedas(monedas.length-1,cantidad-1);
    print_solucion(cmonedas,cualmonedas);
}


void dp_monedas(int fila, int columna){ 
  if ( cmonedas[fila][columna] != 0)  return;
  
  if(fila == 0){
        if ( (columna+1)%monedas[0] == 0 ) {

            cmonedas[fila][columna] = (columna+1)/monedas[fila];
            cualmonedas[fila][columna][fila] = (columna+1)/monedas[fila];
        
        } else {
            cmonedas[fila][columna] = inf;
        }
        return;
    }
    
    
  if ( (columna+1)/monedas[fila] >= 1) {
        dp_monedas(fila-1,columna);
        int restante = (columna+1)-monedas[fila];
        
        if (restante > 0) dp_monedas(fila,restante-1);
        
        cmonedas[fila][columna] = 1;
        cualmonedas[fila][columna][fila] = 1;
        
        if (restante > 0 ){
            cmonedas[fila][columna] += cmonedas[fila][restante-1];
            cualmonedas[fila][columna] = sumar( cualmonedas[fila][columna], cualmonedas[fila][restante-1] );
        }
        
        if(cmonedas[fila][columna] > cmonedas[fila-1][columna] ){
            cmonedas[fila][columna] = cmonedas[fila-1][columna];
            cualmonedas[fila][columna] = cualmonedas[fila-1][columna];
        }
        
    } else {
        dp_monedas(fila-1,columna);
        cmonedas[fila][columna] = cmonedas[fila-1][columna];
        cualmonedas[fila][columna] = cualmonedas[fila-1][columna];
   
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
