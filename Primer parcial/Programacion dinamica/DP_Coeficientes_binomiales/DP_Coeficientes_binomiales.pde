int n = 10;
int k = n+1;
int[][] matrix = new int[n][k];

void setup(){
  init();

  //printMatrix();
  for(int i=k; i>0; i--){
    matrix[n-1][i-1] = Pascal(n,i);
  }
  printMatrix();
}


int Pascal(int n,int k){
  if(matrix[n-1][k-1] != -1){
    println("Truncado ", matrix[n-1][k-1]);
    return matrix[n-1][k-1];
  }
      
  if(k==1 || k==n+1){
    if(matrix[n-1][k-1] == -1){
      matrix[n-1][k-1] = 1;
    }
     return matrix[n-1][k-1];
  }
  
  else {    
    int p =  Pascal(n-1,k-1) + Pascal(n-1,k);
    matrix[n-1][k-1] = p;
    return p;
  }
  
}


void printMatrix(){
  for(int i=0; i<n; i++){
   for(int j=0; j<k; j++){
     print(matrix[i][j]);
     if (j!= k-1)
       print(", ");
   }
   println();
 }
}

void init(){
 for(int i=0; i<n; i++){
   for(int j=0; j<k; j++){
     matrix[i][j] = -1;
   }
 }
 
}
