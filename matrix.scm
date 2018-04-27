; CSc 600: PROGRAMMING LANGUAGE DESIGN
; Scheme
;
; Keawa Rozet
; Homework 4: Question #6

; create add1 function
(define (add1 x) (+ x 1))

; reads in matrix from user input
(define (read-matrix filename)
  (let* ((input-file (open-input-file filename))
         (max-row (read input-file))
         (max-col (read input-file))
         (mat (make-vector max-row)))
    (do ((i 0 (add1 i)))
      ((>= i max-row) (close-input-port input-file) mat)
      (let ((display-row (make-vector max-col)))
        (do ((j 0 (add1 j)))
          ((>= j max-col) (vector-set! mat i display-row))
          (vector-set! display-row j (read input-file)))))))

(define (display-vector v)
  (do ((i 0 (add1 i)))
    ((>= i (vector-length v)) (display ""))
    (display (vector-ref v i)) (display " ")))

(define (dot-product v1 v2)
  (do
    ((i 0 (add1 i)) (sum 0 (+ sum (* (vector-ref v1 i) (vector-ref v2 i)))))
    ((>= i (vector-length v1)) sum)))

; get the row
(define (row filename i)
  (define mat (read-matrix filename))
  (vector-ref mat i))
; display the row
(define (display-row filename i)
  (display-vector (row filename (- i 1))))
; get the column
(define (col filename j)
  (define mat (read-matrix filename))
  (define max-row (vector-length mat))
  (define column (make-vector max-row))
  (do ((i 0 (add1 i)))
    ((>= i max-row) column)
    (vector-set! column i (vector-ref (vector-ref mat i) j))))

; matrix multiplication
(define (mmul matrix-data1 matrix-data2 matrix-output-file)
  (define matrix1 (read-matrix matrix-data1))
  (define matrix2 (read-matrix matrix-data2))
  (define max-row (vector-length matrix1))
  (define max-col (vector-length matrix2))
  (define output-file (open-output-file matrix-output-file))
  ; add the num of rows and cols to the first line
  (display max-row output-file) (display " " output-file)
  (display max-col output-file) (newline output-file)
  ; displays the columns row by row
  (do ((i 0 (add1 i)))
    ((>= i max-row) (close-output-port output-file) (display ""))
    (let ((display-row (make-vector max-col)))
      (do ((j 0 (add1 j)))
        ((>= j max-col) (display-vector display-row) (newline) (newline output-file))
        (vector-set! display-row j (dot-product (row matrix-data1 i) (col matrix-data2 j)))
        (display (vector-ref display-row j) output-file) (display " " output-file)))))
