#include <stdio.h>

/*
0, 1, 1, 2, 3, 5, 8, 13, ...
*/

/*
int // return type
fibo(int x)
{
  // assert(x >= 0);  
  if (x == 0) {
    return 0;
  } else if (x == 1) {
    return 1;
  } else {
    return fibo(x-2) + fibo(x-1);
  }
}
*/

int // return type
fibo(int x)
{
  return
  (x == 0 ? 0 : (x == 1) ? 1 : (fibo(x-2) + fibo(x-1)));
}

int
main() {
  int N = 10;
  printf("fibo(%i) = %i\n", N, fibo(N));
}
