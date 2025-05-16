#include <stdio.h>
#define MAX 10

int find(int *mat, int n, int key)
{
    int r=0;
    int c=n-1;
    while(r<n&&c>=0)
    {
        int val=*(mat+r*n+c);
        if(val==key)
        {
            return 1;
        }
        else if(val>key)
        {
            c--;
        }
        else
        {
            r++;
        }
    }
    return 0;
}
int main()
{
    int n;
    printf("Enter matrix size n: ");
    scanf("%d",&n);
    if(n>MAX||n<=0)
    {
        printf("Invalid size!\n");
        return 1;
    }
    int mat[MAX][MAX];
    printf("Enter %d elements:\n",n*n);
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<n;j++)
        {
            scanf("%d",&mat[i][j]);
        }
    }
    int key;
    printf("Enter key to search: ");
    scanf("%d",&key);
    if(find((int*)mat,n,key))
    {
        printf("Key %d found\n",key);
    }
    else
    {
        printf("Key %d not found\n",key);
    }
    return 0;
}
