#include <stdio.h>

int main() {
    char tape[30000] = {0};  // Assume a tape of size 30,000 cells
    char *ptr = tape;

    // [->+<]
    *ptr += 1;
    ++ptr;
    --ptr;

    // ++++++
    *ptr += 6;

    // >,>,<<
    ++ptr;
    ++ptr;
    --ptr;
    --ptr;

    // Loop 1
    while (*ptr) {
        // >--------
        // >--------
        // <<-
        *ptr -= 2;
        ++ptr;
        *ptr -= 2;
        ++ptr;
        --ptr;
    }

    // >
    ++ptr;

    // Loop 2
    while (*ptr) {
        // ->+>+<<
        *ptr += 1;
        ++ptr;
        *ptr += 1;
        ++ptr;
        --ptr;
        --ptr;
    }

    // >>
    ++ptr;
    ++ptr;

    // Loop 3
    while (*ptr) {
        // -<<+>>
        *ptr -= 1;
        --ptr;
        *ptr += 1;
        ++ptr;
        --ptr;
    }

    // <<<
    --ptr;
    --ptr;
    --ptr;

    // -
    *ptr -= 1;

    // >>
    ++ptr;
    ++ptr;

    // >>++++++++++<<
    *ptr += 10;
    ++ptr;
    ++ptr;
    ++ptr;
    ++ptr;
    ++ptr;
    ++ptr;
    ++ptr;
    ++ptr;
    ++ptr;
    ++ptr;
    ++ptr;
    --ptr;
    --ptr;

    // [->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]
    while (*ptr) {
        // >>>++++++++
        // >++++++++
        // <<<<-
        *ptr += 3;
        ++ptr;
        *ptr += 8;
        ++ptr;
        --ptr;
    }

    // >>>>.
    for (int i = 0; i < 4; ++i) {
        putchar(*ptr);
        ++ptr;
    }

    // <.
    putchar(*ptr);
    --ptr;

    // >[-]
    *ptr = 0;

    // ++++++++++.
    for (int i = 0; i < 10; ++i) {
        putchar(*ptr);
        ++ptr;
    }

    return 0;
}
