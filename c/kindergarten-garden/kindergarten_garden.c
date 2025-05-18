#include "kindergarten_garden.h"
#include <string.h>


plants_t plants(const char *diagram,const char *student){
    const char *names = "ABCDEFGHIJKL";
    const char *pos = strchr(names, student[0]); 
    const int index = pos - names;
    
    const char *pos_sep = strchr(diagram, '\n');    
    int n = (pos_sep-diagram);

    plants_t x = {{ (plant_t)(diagram[index*2]), 
                   (plant_t)(diagram[(index*2)+1]),
                   (plant_t)(diagram[(n+1)+(index*2)]),
                   (plant_t)(diagram[(n+1)+(index*2+1)])
                    }};
    return x;
    
}
