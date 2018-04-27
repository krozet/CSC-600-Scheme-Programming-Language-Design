; CSc 600: PROGRAMMING LANGUAGE DESIGN
; Scheme
;
; Keawa Rozet
; Homework 4: Question #3

(define (line n)
  (cond ((< n 1) (newline))
        (else (display "*") (line (- n 1)))))
; recursive call to print the histogram
(define (histogram list)
  (if (null? list) (newline)
      (begin (line (car list))
             (histogram (cdr list)))))
