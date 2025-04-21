using System;
using System.Collections.Generic;


public static class PigLatin
{
    private static HashSet<char> vowels = new() { 'a', 'e', 'i', 'o', 'u' };
    public static string Translate(string word)
    {    
        var ws = word.Split(' ');
        if (ws.Length>1){
            List<string> wordList = new() {};
            foreach (string w in ws)
            {
                wordList.Add(Translate(w)); 
            }
                return string.Join(" ", wordList);
        }
        
        var ch  = char.ToLower(word[0]);
        if (word.StartsWith("xr") || word.StartsWith("yt") || vowels.Contains(ch) ){
            return $"{word}ay";
        };

        for (int i = 0; i < word.Length; i++){
            var c  = char.ToLower(word[i]);
            if (word[i..].StartsWith("qu")){
                return $"{word.Substring(i+2)}{word.Substring(0,i+2)}ay";
            } ;
            if (vowels.Contains(c) || (c=='y' && i!=0) ){
                return $"{word.Substring(i)}{word.Substring(0,i)}ay";
            }
        }
        return word;
    }
}