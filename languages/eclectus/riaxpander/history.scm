;;; -*- Mode: Scheme -*-

;;;; Riaxpander
;;;; Expansion History

;;; Copyright (c) 2008, Taylor R. Campbell
;;; See the LICENCE file for licence terms and warranty disclaimer.

;;; A history is a chain of lists of reductions, interleaved with
;;; subform selectors indicating what subform of one list of reductions
;;; the next list of reductions was.

(define (make-reduction form environment)
  (cons form environment))

(define (reduction/form reduction) (car reduction))
(define (reduction/environment reduction) (cdr reduction))

(define (make-history reductions parent)
  ;; (cons (car reductions) parent)         ;Preserve the original form only.
  (cons reductions parent))

(define (make-top-level-history initial-form environment)
  (make-history (list (make-reduction initial-form environment))
                '()))

(define (top-level-history? history)
  (not (pair? (cdr history))))

(define (history/reductions history) (car history))
(define (history/parent history) (cdr history))
(define (history/parent-selector history) (car (history/parent history)))
(define (history/parent-history history) (cdr (history/parent history)))

(define (history/current-reduction history)
  (car (history/reductions history)))

(define (history/original-reduction history)
  (last (history/reductions history)))

(define (history/current-form history)
  (reduction/form (history/current-reduction history)))

(define (history/current-environment history)
  (reduction/environment (history/current-reduction history)))

(define (history/original-form history)
  (reduction/form (history/original-reduction history)))

(define (history/original-environment history)
  (reduction/environment (history/original-reduction history)))

(define (history/update-reductions history procedure)
  (and history
       (make-history (procedure (history/reductions history))
                     (history/parent history))))

(define (history/add-reduction history form environment)
  (history/update-reductions history
    (lambda (reductions)
      (cons (make-reduction form environment)
            reductions))))

(define (history/replace-reduction history form environment)
  (history/update-reductions history
    (lambda (reductions)
      (cons (make-reduction form environment)
            (cdr reductions)))))

(define (history/add-subform history selector form environment)
  (and history
       (make-history (list (make-reduction form environment))
                     (cons selector history))))

;;;;; Subform Selectors

;;; A selector is a list of integers.  Each integer's absolute value is
;;; a number of cdrs to take from a list; if the integer is
;;; non-negative, the car of that tail is taken as well.

;++ What about non-list forms?

;;; Possible optimization: store a procedure that performs the
;;; selection, to avoid the overhead of analysis in APPLY-SELECTOR.

(define (apply-selector selector form)
  (let loop ((selector (reverse selector))
             (form form))
    (if (pair? selector)
        (loop (cdr selector)
              (let ((index (car selector)))
                (if (negative? index)
                    (list-tail form (- 0 index))
                    (list-ref form index))))
        form)))

(define (select-car selector)
  (if (and (pair? selector)
           (negative? (car selector)))
      (cons (- 0 (car selector))
            (cdr selector))
      (cons 0 selector)))

(define (select-cdr selector)
  (if (and (pair? selector)
           (negative? (car selector)))
      (cons (- (car selector) 1)
            (cdr selector))
      (cons -1 selector)))

(define (select-map selector list procedure)
  (*select-map selector list cons procedure))

(define (select-append-map selector list procedure)
  (*select-map selector list append-reverse procedure))

(define (*select-map selector list combiner procedure)
  (let loop ((selector selector)
             (in list)
             (out '()))
    (if (pair? in)
        (loop (select-cdr selector)
              (cdr in)
              (combiner (procedure (select-car selector) (car in))
                        out))
        (reverse out))))

(define (select-for-each selector list procedure)
  (let loop ((selector selector) (list list))
    (if (pair? list)
        (begin (procedure (select-car selector) (car list))
               (loop (select-cdr selector) (cdr list))))))

;;;;; Pre-Defined Selectors

(define identity-selector '())

(define car-selector (select-car identity-selector))
(define cdr-selector (select-cdr identity-selector))

(define caar-selector (select-car car-selector))
(define cadr-selector (select-car cdr-selector))
(define cdar-selector (select-cdr car-selector))
(define cddr-selector (select-cdr cdr-selector))

(define caaar-selector (select-car caar-selector))
(define caadr-selector (select-car cadr-selector))
(define cadar-selector (select-car cdar-selector))
(define caddr-selector (select-car cddr-selector))
(define cdaar-selector (select-cdr caar-selector))
(define cdadr-selector (select-cdr cadr-selector))
(define cddar-selector (select-cdr cdar-selector))
(define cdddr-selector (select-cdr cddr-selector))

(define caaaar-selector (select-car caaar-selector))
(define caaadr-selector (select-car caadr-selector))
(define caadar-selector (select-car cadar-selector))
(define caaddr-selector (select-car caddr-selector))
(define cadaar-selector (select-car cdaar-selector))
(define cadadr-selector (select-car cdadr-selector))
(define caddar-selector (select-car cddar-selector))
(define cadddr-selector (select-car cdddr-selector))
(define cdaaar-selector (select-cdr caaar-selector))
(define cdaadr-selector (select-cdr caadr-selector))
(define cdadar-selector (select-cdr cadar-selector))
(define cdaddr-selector (select-cdr caddr-selector))
(define cddaar-selector (select-cdr cdaar-selector))
(define cddadr-selector (select-cdr cdadr-selector))
(define cdddar-selector (select-cdr cddar-selector))
(define cddddr-selector (select-cdr cdddr-selector))
