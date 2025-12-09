#include "roman.h"
#include <string.h>

// Mapping-Tabellen (absteigend sortiert)
static const int values[] = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
static const char *symbols[] = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};

void intToRoman(int num, char *result) {
    result[0] = '\0'; 
    
    int i = 0;

    while (num > 0 && i < 13) {
        while (num >= values[i]) {
            strcat(result, symbols[i]);
            num -= values[i];
        }
        i++;
    }
}

int getRomanValue(char c) {
    switch(c) {
        case 'I': return 1;
        case 'V': return 5;
        case 'X': return 10;
        case 'L': return 50;
        case 'C': return 100;
        case 'D': return 500;
        case 'M': return 1000;
        default: return 0; // Ungültiges Zeichen
    }
}

int romanToInt(const char *s) {
    int total = 0;
    int i = 0;
    
    // Wir gehen durch den String, solange wir nicht am Ende sind
    while (s[i] != '\0') {
        int currentVal = getRomanValue(s[i]);
        int nextVal = getRomanValue(s[i + 1]);
        
        // Logik: Wenn der aktuelle Wert kleiner ist als der nächste (z.B. IV),
        // subtrahieren wir ihn (4 = 5 - 1).
        if (currentVal < nextVal) {
            total -= currentVal;
        } else {
            total += currentVal;
        }
        i++;
    }
    
    return total;
}