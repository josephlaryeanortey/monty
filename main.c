#include "monty.h"
#define _GNU_SOURCE

/* Global structure to manage Monty interpreter state */
bus_t bus = {NULL, NULL, NULL, 0};

/**
 * main - Monty code interpreter entry point
 * @argc: Argument count
 * @argv: Argument vector
 *
 * Return: Always 0
 */
int main(int argc, char *argv[])
{
    char *line_content;
    FILE *monty_file;
    size_t buffer_size = 0;
    ssize_t read_line = 1;
    stack_t *stack = NULL;
    unsigned int line_number = 0;

    /* Check for correct number of command line arguments */
    if (argc != 2)
    {
        fprintf(stderr, "USAGE: monty file\n");
        exit(EXIT_FAILURE);
    }

    /* Open the Monty file for reading */
    monty_file = fopen(argv[1], "r");
    bus.file = monty_file;

    /* Check if the file was successfully opened */
    if (!monty_file)
    {
        fprintf(stderr, "Error: Can't open file %s\n", argv[1]);
        exit(EXIT_FAILURE);
    }

    /* Read and execute Monty code line by line */
    while (read_line > 0)
    {
        line_content = NULL;
        read_line = getline(&line_content, &buffer_size, monty_file);
        bus.content = line_content;
        line_number++;

        if (read_line > 0)
            execute(line_content, &stack, line_number, monty_file);

        free(line_content);
    }

    /* Clean up resources and close the Monty file */
    free_stack(stack);
    fclose(monty_file);

    return (0);
}
