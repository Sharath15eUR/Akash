#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <signal.h>
#include <sys/time.h>

int n;
void sigint_handler(int sig)
{
    printf("\nSIGINT received but ignored. Use Ctrl+\\ to force quit.\n");
}

int is_prime(int num)
{
    if(num<2) return 0;
    for(int i=2;i*i<=num;i++)
    {
        if(num%i==0) return 0;
    }
    return 1;
}

void* compute_prime_sum(void* arg)
{
    int sum=0,count=0,x=2;
    while(count<n)
    {
        if(is_prime(x))
        {
            sum+=x;
            count++;
        }
        x++;
    }
    printf("Sum=%d\n",sum);
    return NULL;
}

void* thread_one_runner(void* arg)
{
    int time_elapsed=0;
    while(time_elapsed<=100)
    {
        printf("Thread 1 running\n");
        sleep(2);
        time_elapsed+=2;
    }
    return NULL;
}

void* thread_two_runner(void* arg)
{
    int time_elapsed=0;
    while(time_elapsed<=100)
    {
        printf("Thread 2 running\n");
        sleep(3);
        time_elapsed+=3;
    }
    return NULL;
}

int main()
{
    struct timeval start,end;
    gettimeofday(&start,NULL);
    signal(SIGINT,sigint_handler);
    printf("Enter N: ");
    scanf("%d",&n);
    pthread_t t1,t2,t3;
    pthread_create(&t1,NULL,compute_prime_sum,NULL);
    pthread_create(&t2,NULL,thread_one_runner,NULL);
    pthread_create(&t3,NULL,thread_two_runner,NULL);
    pthread_join(t1,NULL);
    pthread_join(t2,NULL);
    pthread_join(t3,NULL);
    gettimeofday(&end,NULL);
    long sec=end.tv_sec-start.tv_sec;
    long usec=end.tv_usec-start.tv_usec;
    double total=sec+(usec/1000000.0);
    printf("Execution Time: %.2f seconds\n",total);
    return 0;
}
