;sample list for manipulation

(define b '(3 (23 8 (44 5 3) 4 5) 32 3 (2 3)))


;atom? function

(define (atom? x)
(and (not (pair? x)) (not (null? x))))


;rev-list

(define (rev-list lst)
   (if (null? lst)
      '()
      (append (rev-list (cdr lst)) (list (car lst)))
   )
)


;rev-all-list

(define (rev-all-lst lst)
   (if (null? lst)
      '()
      (begin
         (if atom? (car lst)
            (append (rev-all-list (cdr lst)) (list (car lst)))
            (append (rev-all-list (cdr lst)) (list (rev-all-list (car lst))))
         )
      )
   )
)


;del-from-list

(define (del-from-list itm lst)
   (if (null? lst)
      '()
      (begin
         (if (atom? (car lst))
            (if (equal? (car lst) itm)
               (del-from-list itm (cdr lst))
               (append (list (car lst)) (del-from-list itm (cdr lst)))
            )
            (append (list (del-from-list itm (car lst)))
                    (del-from-list itm (cdr lst)))
         )
      )
   )
)
