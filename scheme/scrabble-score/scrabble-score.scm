(define scrabble-scores (vector 1 3 3 2 1 4 2 4 1 8 5 1 3 1 1 3 10 1 1 1 1 4 4 8 4 10))

(define (char->index c)
  (- (char->integer (char-upcase c)) (char->integer #\A)))

(define (score str)
  (let ((len (string-length str)))
    (cond 
      ((> len 0)
       (+
        (vector-ref scrabble-scores (char->index (string-ref str 0)))
        (score (substring str 1 len))))
      (else 0))))