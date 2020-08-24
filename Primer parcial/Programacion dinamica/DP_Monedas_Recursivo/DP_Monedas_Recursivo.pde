int cantidad = 12;
int[] monedas = {1,2,5};

int [][] nmonedas = new int[monedas.length][cantidad];
int [][][] dmonedas = new int[monedas.length][cantidad][monedas.length];

void setup(){
  
  dp_monedas(cantidad,monedas.length-1)
  print_solucion();
  
}



void dp_monedas(int cant, int m){
  if( nmonedas[m][cantidad-1] == 0) return;
  
  if(m == 0){
    
  }
  
}


void print_solucion() {
  print('\t');
  for (int c=1; c<=cantidad; c++) {
    print(c);
    print('\t');
  }
  println();
  for (int m=0; m<monedas.length; m++) {
    print("$");
    print(monedas[m]);
    print('\t');
    for (int c=1; c<=cantidad; c++) {
      print(nmonedas[m][c-1]);
      print('\t');
    }
    println();
    print('\t');
    for (int c=1; c<=cantidad; c++) {
      print("(");
      for (int mm=0; mm<monedas.length; mm++) {
        print(dmonedas[m][c-1][mm]);
      }
      print(")");
      print('\t');
    }
    println();
  }
}
