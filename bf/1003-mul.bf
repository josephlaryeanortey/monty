#include <stdio.h>

#define TAPE_SIZE 30000

int main() {
    char tape[TAPE_SIZE] = {0}; // The tape used in Brainfuck
    char *ptr = tape;           // Pointer to the current cell on the tape

    // Brainfuck code: [->+<]
    (*ptr)--;
    ptr++;
    (*ptr)++;
    ptr--;

    // Brainfuck code: ++++++
    (*ptr) += 6;

    // Brainfuck code: >,>,<<
    ptr++;
    ptr++;
    (*ptr)--;
    ptr--;

    // Brainfuck code: [ >-------- >-------- <<-]
    while (*ptr != 0) {
        ptr++;
        (*ptr) -= 8;
        ptr++;
        (*ptr) -= 8;
        ptr--;
        (*ptr)--;
    }

    // Brainfuck code: > [ ->+>+<< ] >>
    ptr++;
    (*ptr)++;
    ptr++;
    (*ptr)++;
    ptr++;
    (*ptr)--;
    ptr--;
    ptr--;
    (*ptr)++;
    ptr++;
    (*ptr)++;
    ptr++;

    // Brainfuck code: [ -<<+>> ]
    ptr--;
    (*ptr)--;
    ptr++;
    (*ptr)++;
    ptr--;
    ptr++;

    // Brainfuck code: <<<-
    ptr--;
    ptr--;
    (*ptr)--;

    // Brainfuck code: ]
    ptr++;

    // Brainfuck code: >
    ptr++;

    // Brainfuck code: [ > [ ->+>+<< ] >> [ -<<+>> ] <<< -]
    while (*ptr != 0) {
        ptr++;
        (*ptr)++;
        ptr++;
        (*ptr)++;
        ptr++;
        (*ptr)--;
        ptr--;
        ptr--;
        (*ptr)++;
        ptr++;
        (*ptr)++;
        ptr++;
        (*ptr)--;
        ptr--;
        ptr--;
        (*ptr)--;
    }

    // Brainfuck code: >>
    ptr++;
    ptr++;

    // Brainfuck code: >>++++++++++<<
    (*ptr) += 10;
    ptr++;
    ptr++;
    (*ptr) -= 10;

    // Brainfuck code: [->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]
    while (*ptr != 0) {
        ptr++;
        (*ptr)--;
        ptr++;
        (*ptr)++;
        ptr++;
        ptr++;
        while (*ptr != 0) {
            ptr++;
            (*ptr)++;
            ptr++;
            ptr++;
            (*ptr)--;
            ptr--;
            ptr--;
            (*ptr)++;
            ptr++;
            (*ptr)++;
            ptr--;
        }
        ptr++;
        ptr--;
        ptr--;
        ptr--;
        ptr--;
        ptr--;
    }

    // Brainfuck code: ++++++
    (*ptr) += 6;

    // Brainfuck code: [ >>>++++++++ >++++++++ <<<<-]
    while (*ptr != 0) {
        ptr++;
        (*ptr) += 9;
        ptr++;
        (*ptr) += 8;
        ptr--;
        ptr--;
        (*ptr)--;
    }

    // Brainfuck code: >>>>.
    ptr++;
    ptr++;
    ptr++;
    printf("%c", *ptr);

    // Brainfuck code: <.
    ptr--;
    printf("%c", *ptr);

    // Brainfuck code: >[-]
    ptr++;
    (*ptr) = 0;

    // Brainfuck code: ++++++++++.
    ptr++;
    (*ptr) += 10;
    printf("%c", *ptr);

    return 0;
}
