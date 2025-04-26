function main(str){
    if(!str){
        return "true"
    }
    c = substr(str, 1, 1)
    if (c ~ /[a-z]/) {
        if ( c in seen){
            return "false"
        }
        seen[c] = 1
    }
    return main(substr(str, 2))
}

{
    print main(tolower($0))
}
