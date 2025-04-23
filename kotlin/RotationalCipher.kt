class RotationalCipher(val key: Int) {

    fun encode(text: String): String {
        var ans = ""
        for (i in text){
            if (Regex("[a-z]").matches(i.toString())){
                var idx = ((i.toInt()+key-97)%26)+97
                ans += idx.toChar()
            }else if(Regex("[A-Z]").matches(i.toString())){
                var idx = ((i.toInt()+key-65)%26)+65
                ans += idx.toChar()
            }else {
                ans+=i
            }
        }
        return ans
            
    }
}
