#include <stdio.h>

void swap(int *a, int *b) 
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

void arrange(int *arr, int size) 
{
    int *start=arr;
    int *end=arr+size-1;
    
    while(start<end) 
    {
        while(start<end && *start%2 == 0) 
        {
            start++;
        }
        while(start<end && *end%2 != 0) 
        {
            end--;
        }
        if(start<end) 
        {
            swap(start,end);
        }
    }
}

void print(int *arr, int size) 
{
    int *p=arr;
    while(p<arr+size) 
    {
        printf("%d ",*p);
        p++;
    }
    printf("\n");
}

int main() 
{
    int n;
    printf("Enter array size: ");
    scanf("%d", &n);
    
    int arr[100];
    int *p = arr;
    printf("Enter %d numbers:\n", n);
    while(p < arr + n) 
    {
        scanf("%d", p);
        p++;
    }
    
    arrange(arr, n);
    printf("Rearranged array: ");
    print(arr, n);
    
    return 0;
}
