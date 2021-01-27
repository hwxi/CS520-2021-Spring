#include <stdio.h>

int // return type
fibo2(int x)
{
  int i;
  int tmp;
  int res0 = 0;
  int res1 = 1;

  for(i = 0; i < x; i += 1) {
    tmp = res0;
    res0 = res1;
    res1 = tmp + res0;
  }
  
  return res0;

}

int
main() {
  int N = 10;
  printf("fibo2(%i) = %i\n", N, fibo2(N));
}
