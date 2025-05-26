import java.util.*;    
import java.util.stream.Collectors;
import java.util.stream.Stream;

class ParallelLetterFrequency {
    String[] texts;

    ParallelLetterFrequency(String[] texts) {
       this.texts = texts;
    }

    static Map<Character, Integer> countText(String input) {
        Map<Character, Integer> counter = new HashMap<>();
        for (char c : input.toLowerCase().toCharArray()) {
            if (Character.isLetter(c)) {
                counter.put(c, counter.getOrDefault(c, 0) + 1);
            };
        }
        return counter;
    }

    Map<Character, Integer> countLetters() {
        Stream<Map<Character, Integer>> results =(
            Arrays.stream(texts)
                  .parallel()
                  .map(ParallelLetterFrequency::countText)); 
        
        Map<Character, Integer> finalCounts = new HashMap<>();
        for (Map<Character, Integer> map : results.toList()) {
            for (Map.Entry<Character, Integer> entry : map.entrySet()) {
                finalCounts.merge(entry.getKey(), entry.getValue(), Integer::sum);
            }
        };
        return finalCounts;
    }    
}
