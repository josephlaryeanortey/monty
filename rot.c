#include "monty.h"

/**
 * f_rotl - Rotate stack element to the top
 * @head: Pointer to the first node of the stack
 * @counter: Line counter
 *
 * Description: Rotates the stack by moving the top element to the bottom.
 * Return: None
 */
void f_rotl(stack_t **head, __attribute__((unused)) unsigned int counter)
{
    if (*head == NULL || (*head)->next == NULL)
    {
        /* Stack has less than two elements, no rotation needed */
        return;
    }

    stack_t *tmp = *head;
    stack_t *aux = (*head)->next;

    aux->prev = NULL;

    while (tmp->next != NULL)
    {
        tmp = tmp->next;
    }

    tmp->next = *head;
    (*head)->next = NULL;
    (*head)->prev = tmp;
    (*head) = aux;
}

/**
 * f_rotr - Rotate stack element to the bottom
 * @head: Pointer to the first node of the stack
 * @counter: Line counter
 *
 * Description: Rotates the stack by moving the bottom element to the top.
 * Return: None
 */
void f_rotr(stack_t **head, __attribute__((unused)) unsigned int counter)
{
    if (*head == NULL || (*head)->next == NULL)
    {
        /* Stack has less than two elements, no rotation needed */
        return;
    }

    stack_t *copy = *head;

    while (copy->next)
    {
        copy = copy->next;
    }

    copy->next = *head;
    copy->prev->next = NULL;
    copy->prev = NULL;
    (*head)->prev = copy;
    (*head) = copy;
}
