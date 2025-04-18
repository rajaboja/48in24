public static class CollatzConjecture
{
    public static int Steps(int number) =>
        number switch {
                <=0 => throw new ArgumentOutOfRangeException(),
                1 => 0,
                _ when number%2==0 => 1+Steps(number/2),
                _ => 1+Steps((3*number)+1) 
        };        
    }