; CSc 600: PROGRAMMING LANGUAGE DESIGN
; Scheme
;
; Keawa Rozet
; Homework 4: Question #5

; iterative scalar product function
(define (scalar-iter vector1 vector2)
    (cond ((zero? (vector-length vector1)) (display "vector1 is empty."))
          ((zero? (vector-length vector2)) (display "vector2 is empty."))
          ((= (vector-length vector1) (vector-length vector2))
           (let ((s 0))
                  ; here the do loop is implemented
                  (do ((i 0 (add1 i)))
                    ((>= i (vector-length vector1)) (display s))
                    (set! s (+ s (* (vector-ref vector1 i) (vector-ref vector2 i)))))))
          (else (display "vector1 and vector2 are different sizes."))))
(define (add1 x) (+ x 1))

; recursive scalar product function
(define (scalar-recur vector1 vector2)
  (cond ((not (equal? (vector-length vector1) (vector-length vector2)))
         (display "vector1 and vector2 are different sizes."))
        ((zero? (vector-length vector1)) (display "vector is empty."))
        (else (dot-list (vector->list vector1) (vector->list vector2)))))
(define (dot-list list1 list2)
  (cond((null? (cdr list1)) (* (car list1) (car list2)))
       (else (+ (* (car list1) (car list2)) (dot-list (cdr list1) (cdr list2))))))
