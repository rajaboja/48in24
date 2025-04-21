public static class ProteinTranslation
{
    public static string[] Proteins(string strand)
    {
         Func<string,string> trans = x => x switch {
                "AUG" => "Methionine",
                "UUU" or "UUC" => "Phenylalanine",
                "UUA" or "UUG" => "Leucine",
                "UCU" or "UCC" or "UCA" or "UCG" => "Serine",
                "UAU" or "UAC" =>"Tyrosine",
                "UGU" or "UGC" =>	"Cysteine",
                "UGG" => "Tryptophan",
                "UAA" or "UAG" or "UGA" => "STOP",
                };

        var chunks = new List<string>();

        for (int i = 0; i < strand.Length; i += 3)
        {
            int length = Math.Min(3, strand.Length - i);
            var prot = trans(strand.Substring(i, length));
            if (prot=="STOP"){
                break;
            }else{
                chunks.Add(prot);
            };
        }
        return chunks.ToArray();
    }
}