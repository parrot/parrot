;;; $Id$
;;; Emacs support for working on the source code of the Parrot virtual
;;; machine.
;;
;; Note that the support for editing pasm files is currently in the separate
;; file "pasm.el".  This file is for editing the Parrot VM source.
;;
;; To use this file, copy it to a known location and add this statement to
;; your .emacs file:
;;
;;   (load-file "/known/location/parrot.el")
;;

(c-add-style "parrot"
	     '("stroustrup"
	       (indent-tabs-mode . nil)
	       (fill-column      . 100)
	       (c-offsets-alist  . (
				    (label                . *)
				    (access-label         . *)
				    (case-label           . *)
				    (statement-case-intro . *)
				    (inextern-lang . 0)
				    ))))
