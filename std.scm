; CSc 600: PROGRAMMING LANGUAGE DESIGN
; Scheme
;
; Keawa Rozet
; Homework 4: Question #2

(define (square x) (* x x))
(define (sum-list list)
  (if (null? list)
    0
    (+ (car list) (sum-list (cdr list)))))
(define (square-sum-list list)
  (if (null? list)
    0
    (+ (square (car list)) (square-sum-list (cdr list)))))
(define sigma (lambda x (sqrt (- (/ (square-sum-list x) (length x))
                                 (square (/ (sum-list x) (length x)))))))
