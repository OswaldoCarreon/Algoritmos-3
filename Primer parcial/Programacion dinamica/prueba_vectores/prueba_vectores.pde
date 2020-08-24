int[][] hola = new int[2][5];

void setup(){
  printM();
  println();
  hola[1] = sumar(hola[1]);
  printM();
  
  
}


int[] sumar(int[] v){
    for(int i=0; i<5; i++){
      v[i] = 1;  
    }
  
  return v;
}

void printM(){
  for(int i=0; i<2; i++){
     for(int j=0; j<5; j++){
        print(hola[i][j], " ");
    }
    println();
  }
  
  
}
