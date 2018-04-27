; CSc 600: PROGRAMMING LANGUAGE DESIGN
; Scheme
;
; Keawa Rozet
; Homework 4: Question #4

(define (find-max x y fn)
  ; implementation of the trisection
  (let* ((trisection (/ (- y x) 3.))
         (x-trisection (+ x trisection))
         (y-trisection (- y trisection)))
    (cond ((> x y) (display "first value cannot be larger than the second value."))
          ; sets the precision to 6 significant digits
          ((< (abs (- (fn x) (fn y))) .0000001) (/ (+ y x) 2.))
          ((> (fn x-trisection) (fn y-trisection)) (find-max x y-trisection fn))
          (else (find-max x-trisection y fn)))))

; x*x - 2*x + 1
(define (test-fn x) (+ 1 (- (* x x) (* 2 x))))
