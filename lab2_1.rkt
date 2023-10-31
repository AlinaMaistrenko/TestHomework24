(define (calculate-y x)
  (cond
    ((and (> x 0) (< x 2))
     (/ (calculate-ln-x x 1e-6) (calculate-ln-x (- x 2) 1e-6)))
    ((and (>= x 2) (<= x 4))
     (calculate-ln-x (/ x 2) 1e-6))
    (else
     "Undefined for x outside the specified range")))

(define (main)
  (let ((min-x -2)
        (max-x 4)
        (step 0.5))
    (display "x\t\t y\t\t Error\n")
    (let loop ((x min-x))
      (if (<= x max-x)
          (begin
            (let* ((true-value (calculate-y x))
                   (approx-value (if (string? true-value) true-value (calculate-y x)))
                   (error (if (string? true-value) "N/A" (calculate-error true-value approx-value))))
              (display x)
              (display "\t\t")
              (display true-value)
              (display "\t\t")
              (display error)
              (newline))
            (loop (+ x step)))))))

(main)