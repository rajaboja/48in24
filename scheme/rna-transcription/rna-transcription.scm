(define (mapping ch) 
  (case ch
        ((#\C) #\G)
        ((#\G) #\C)
        ((#\T) #\A)
        ((#\A) #\U)
        (else "")))

(define (dna->rna dna)
  (apply string (map mapping (string->list dna))))

