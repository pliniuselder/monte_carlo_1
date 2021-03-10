#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <gsl/gsl_rng.h>

int main(int argc, char *argv[]) {
  if (argc == 1) {
    printf("no arguments (input format 'y a b'). exit\n");
    return 0;
  } else if (argc > 4) {
    printf("programm accept no more then three arguments (input format 'y a b'). exit\n");
    return 0;
  }
  double y = atof(*++argv);
  double a = atof(*++argv);
  double b = atof(*++argv);
  //printf("y = %f, a = %f, b = %f\ny = a*x + b*x^3\nx = ?\n", y, a, b);
  const gsl_rng_type * T;
  gsl_rng * r;

  gsl_rng_env_setup();
  T = gsl_rng_default;
  r = gsl_rng_alloc(T);

  int i = 0;
  float error = 0.00001;
  double y_ = 0;
  double x = gsl_rng_uniform(r) * y;
  while (fabs(y_ - y) > error) {
    i++;
    y_ = a * x + b * pow(x, 3);
    if (fabs(y_ - y) < error)
      break;
    if (y_ > y) {
      x = x - gsl_rng_uniform(r) * (x - x * (y/y_));
    } else {
      x = x + gsl_rng_uniform(r) * (x - x * (y_/y));
    }
  }
  printf("%d: y_ = %f\tx = %f\n", i, y_, x);
  return 0;
}
