int k = 20;
int[] vfactorial = new int[k];
int[] vfibonaci = new int[k];


void setup(){
 init();

 int a = fibo(5);

 println(a); 
 //println(vfibonaci);
 
 int b = fibo(8);

 println(b); 
 println(vfibonaci);

  
}


void init(){
  for(int i=0;i<k;i++){
    vfactorial[i] = -1;
    vfibonaci[i] = -1;
  }
  
}
  

int factorial(int n){
  //factorial de 1 = 1
  
  if( vfactorial[n] != -1) {
     return vfactorial[n]; 
  }
  println("factorial: ",n);
  if (n<=1) {
    if (vfactorial[n] == -1){
      vfactorial[n] = n;
    }
    return n;
    
  }
    
   int fact = n*factorial(n-1);
   
   if( vfactorial[n]==-1 ){
     vfactorial[n] = fact;
    }
    return fact;
 
}

int fibo(int n){
  
  println("fibonacci: ",n);
  
  if( vfibonaci[n] != -1){
    return vfibonaci[n];
  }
  
  if(n<=1){
    if(vfibonaci[n] == -1){
       vfibonaci[n] = n;
    }
    return n;
  }
  
 int fib = fibo(n-1)+fibo(n-2);
   if( vfibonaci[n] == -1){
     vfibonaci[n] = fib;
   }
 

 return fib;
  
}
