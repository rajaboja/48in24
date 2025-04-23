object RunLengthEncoding {

    fun encode(input: String): String {
        if (input==""){
            return input
        }
        var ans = ""        
        var temp = ""
        for (i in input){
            if (temp==""){
                temp +=i
            }else if (i==temp.last()){
                temp+=i
            }else{
                ans+="${if (temp.length==1) "" else temp.length}${temp.last()}"
                temp="${i}"
            }
        }
        ans+="${if (temp.length==1) "" else temp.length}${temp.last()}"
        return ans
    }

    fun decode(input: String): String {
        if (input==""){
            return input
        }
        var ans = ""
        var temp = ""
        var n: Int
        for (i in input){
            if (Regex("[a-zA-Z ]").matches(i.toString())){
                if (temp==""){
                    n = 1
                }else{
                    n = temp.toInt()
                }
                ans += i.toString().repeat(n)
                temp = ""
            }else{
                temp+="${i}"
            }
        }
        return ans
    }
}
