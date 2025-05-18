#include "scrabble_score.h"
#include <ctype.h>

const int values[26] = {
        1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};

unsigned int score(const char *word){    
    int result = 0;
     for (int i = 0; word[i] != '\0'; i++) {
        result += values[tolower(word[i])-'a'];
    }
    return result;
}