; CSc 600: PROGRAMMING LANGUAGE DESIGN
; Scheme
;
; Keawa Rozet
; Homework 4: Question #1

;;;(a) The first class object may be expressed as an anonymous literal value (constant). Show
;;;an example of the anonymous function and its use.
1 ]=> 600

;Value: 600

;;;(b) The first class object may be stored in variables (i.e. it may have a symbolic name).
;;;Show examples of defining and using named functions.
1 ]=> (define class 600)

;Value: class

1 ]=> class

;Value: 600

;;;(c) The first class object may be stored in data structures. Show an example of a data
;;;structure(e.g. a list) that contains functions
1 ]=> (length (list 1 2 3 4 5))

;Value: 5

;;;(d) The first class object may be comparable to other objects for equality. Show an
;;;example of comparing functions and lists for equality.
1 ]=> (eqv? (+ 1 4) (length (list 1 2 3 4 5)))

;Value: #t

;;;(e) The first class object may be passed as parameter to procedures/functions. Show an
;;;example of passing function as an argument to another function.
1 ]=> ((lambda (x y) (* x y)) 10 60)

;Value: 600

;;;(f) The first class object may be returned as result from procedures/functions. Show an
;;;example of returning a function as a result of another function.
1 ]=> (define cubed (lambda (x) (* x (sqrd x))))

;Value: cubed

1 ]=> (define sqrd (lambda (x) (* x x)))

;Value: sqrd

1 ]=> (cubed 2)

;Value: 8

;;;(g) The first class object may be readable and printable. Show examples of reading
;;;function(s) from the keyboard, reading function(s) from a file, and displaying a
;;;function.
1 ]=> (define name (read-line))
Keawa Rozet

;Value: name

1 ]=> (display name)
Keawa Rozet

1 ]=> (define fn (open-input-file "matrix1.dat"))

;Value: fn

1 ]=> (read fn)

;Value: 2

1 ]=> (read fn)

;Value: 3
