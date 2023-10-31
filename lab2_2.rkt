(define (count-valid-numbers m n)
  (define (has-odd-digits-or-distinct? num)
    (define (has-odd-digits? num)
      (if (zero? num)
          #f
          (let ((digit (remainder num 10)))
            (if (odd? digit)
                #t
                (has-odd-digits? (quotient num 10))))))
    (define (distinct-digits? num)
      (define (iter num digits)
        (if (zero? num)
            #t
            (let ((digit (remainder num 10)))
              (if (member digit digits)
                  #f
                  (iter (quotient num 10) (cons digit digits))))))
      (iter num '()))
    
    (or (has-odd-digits? num)
        (distinct-digits? num)))
  
  (define (count-between m n count)
    (if (> m n)
        count
        (if (has-odd-digits-or-distinct? m)
            (count-between (+ m 1) n (+ count 1))
            (count-between (+ m 1) n count))))
  
  (count-between m n 0))

(display "Введіть m: ")
(define m (read))
(display "Введіть n (n > m): ")
(define n (read))

(define result (count-valid-numbers m n))

(display "Кількість чисел між m та n, які складаються з непарних цифр або мають різні цифри: ")
(display result)
(newline)