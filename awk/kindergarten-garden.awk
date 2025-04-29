# These variables are initialized on the command line (using '-v'):
# - name

BEGIN{
    RS=""
n=split("Alice,Bob,Charlie,David,Eve,Fred,Ginny,Harriet,Ileana,Joseph,Kincaid,Larry", names, ",")
    for (i = 1; i <= n; i++) nameIndex[names[i]] = i
    seeds["G"] = "grass"
    seeds["C"] = "clover"
    seeds["R"] = "radishes"
    seeds["V"] = "violets"
}
{
    idx = nameIndex[name]
    split($0,planted,"\n")
    for(i=1;i<=length(planted);i++){
        plants =  plants  substr(planted[i],(2*(idx-1))+1,2) 
    }
    r = seeds[substr(plants, 1, 1)] 
    for (i = 2; i <= length(plants); i++) {
        char = substr(plants, i, 1)
        r = r " " seeds[char] 
    }
    print r
}



