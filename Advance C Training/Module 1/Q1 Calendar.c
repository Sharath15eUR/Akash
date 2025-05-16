#include <stdio.h>
#include <string.h>

#define MAX_TASKS 3
#define TASK_LEN 50
#define DAYS 7

struct Day 
{
    char name[10];
    char tasks[MAX_TASKS][TASK_LEN];
};

struct Week 
{
    struct Day days[DAYS];
};

void init_week(struct Week *w) 
{
    char *names[] = {"Monday", "Tuesday", "Wednesday", "Thursday", 
                     "Friday", "Saturday", "Sunday"};
    for (int i = 0; i < DAYS; i++) 
    {
        strcpy(w->days[i].name, names[i]);
        for (int j = 0; j < MAX_TASKS; j++) 
	{
            w->days[i].tasks[j][0] = '\0';
        }
    }
}

void add_tasks(struct Week *w, int day) 
{
    day--;
    if (day < 0 || day >= DAYS) 
    {
        printf("Invalid day\n");
        return;
    }
    printf("Enter up to %d tasks for %s: \n", 
           MAX_TASKS, w->days[day].name);
    for (int i = 0; i < MAX_TASKS; i++)
    {
        char task[TASK_LEN];
        fgets(task, TASK_LEN, stdin);
        task[strcspn(task, "\n")] = '\0';
        if (task[0] == '\0') break;
        strcpy(w->days[day].tasks[i], task);
    }
}

void show_tasks(struct Week *w) 
{
    for (int i = 0; i < DAYS; i++) 
    {
        printf("%s:\n", w->days[i].name);
        int has_tasks = 0;
        for (int j = 0; j < MAX_TASKS; j++) 
	{
            if (w->days[i].tasks[j][0] != '\0') 
	    {
                printf("  - %s\n", w->days[i].tasks[j]);
                has_tasks = 1;
            }
        }
        if (!has_tasks) printf("  No tasks.\n");
    }
}

int main() 
{
    struct Week w;
    init_week(&w);
   
    int day;
    printf("Enter day (1-Monday :: 7-Sunday):  ");
    scanf("%d", &day);
    getchar();
    add_tasks(&w, day);
    show_tasks(&w);
    
    return 0;
}
