(set-logic HORN)

(declare-datatypes ((nat 0) (natlist 0)) 
	(
		(
			(z) 
			(s (pred nat))
		)
		(
			(nil)
			(cons (hd nat) (tl natlist))
		)
	)
)


(define-fun-rec append ((l1 natlist) (l2 natlist)) natlist 
	(
		match l1
		(
			(nil l2)
			((cons h1 t1) (cons h1 (append t1 l2)))
		)
	)
)

(assert (forall ((l1 natlist) (i nat))
				(= l1 (append l1 (cons i nil)))))



(check-sat)
