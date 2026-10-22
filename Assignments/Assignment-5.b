/*A transportation network contains cities connected by roads with different costs. Write a C  program implementing Dijkstra’s Shortest Path Algorithm that accepts the number of vertices,  weighted adjacency matrix and source vertex, computes the minimum distance from the source to  every other vertex, and displays each destination with its shortest distance. Test it using at least  five vertices.

*/

#include <stdio.h>
#define MAX 20
#define INF 99999
int main()
{
    int n, i, j, source;
    int graph[MAX][MAX];
    int dist[MAX], visited[MAX];
    int min, u;
    printf("Enter number of vertices: ");
    scanf("%d", &n);
    printf("Enter weighted adjacency matrix:\n");
    for (i = 0; i < n; i++)
    {
        for (j = 0; j < n; j++)
        {
            scanf("%d", &graph[i][j]);

            if (graph[i][j] == 0 && i != j)
                graph[i][j] = INF;
        }
    }
    printf("Enter source vertex: ");
    scanf("%d", &source);
    for (i = 0; i < n; i++)
    {
        dist[i] = graph[source][i];
        visited[i] = 0;
    }
    dist[source] = 0;
    for (i = 0; i < n - 1; i++)
    {
        min = INF;
        u = -1;
        for (j = 0; j < n; j++)
        {
            if (!visited[j] && dist[j] < min)
            {
                min = dist[j];
                u = j;
            }
        }

        if (u == -1)
            break;

        visited[u] = 1;

        for (j = 0; j < n; j++)
        {
            if (!visited[j] &&
                graph[u][j] != INF &&
                dist[u] + graph[u][j] < dist[j])
            {
                dist[j] = dist[u] + graph[u][j];
            }
        }
    }
    printf("\nShortest distances from source %d:\n", source);
    for (i = 0; i < n; i++)
    {
        printf("Destination %d = ", i);

        if (dist[i] == INF)
            printf("No path\n");
        else
            printf("%d\n", dist[i]);
    }

    return 0;
}
