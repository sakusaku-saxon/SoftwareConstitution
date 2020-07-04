#include <stdio.h>
#include <stdlib.h>
#define MAXSIZE 10

int s[MAXSIZE];
int sindex = 0;

void push(int e){
  if(sindex < MAXSIZE){
    s[sindex] = e;
    sindex++;
  } else {
    printf("stack overflow!\n");
    exit(1);
  }
}

int pop(){
  if(sindex > -1){
    return s[--sindex];
  } else {
    printf("stack underflow!\n");
    exit(1);
  }
}

int main(int ac, char* av[]){
  int i;

  if(ac < 2){
    printf("Usage: %s arg1 arg2 ...\n", av[0]);
    printf("args are numbers\n");
    exit(1);
  }

  for(i=1; i<ac; i++){
    int n = atoi(av[i]);
    printf("%d\n", n);
    push(n);
  }

  printf(":::::\n");

  for(i=9; i<ac; i++){
    printf("%d\n", pop());
  }
}
