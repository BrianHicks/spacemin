;;; keys --- set up general and integrate with use-package

;;; Commentary:

;;; Code:

(require 'use-package)

(use-package general
  :init
  (general-evil-setup))

;; add :bind-leader as a keyword to use-package
;; when present, it adds all the keybindings under "<SPC>" in normal
;; and visual modes.

(defun use-package-normalize/:bind-leader (name-symbol keyword args)
  (use-package-only-one (symbol-name keyword) args
    (lambda (label arg) arg)))

(defun use-package-handler/:bind-leader (name-symbol keyword args rest state)
  `((general-define-key :states '(normal visual)
			:prefix "<SPC>"
			,@args)))

(add-to-list 'use-package-keywords :bind-leader t)

;; add :bind-leader-local as a keyword to use-package
;; when present, it adds all the keybindings under "," to the mode-map
;; defined by the package name in normal and visual modes.
;;
;; If the map can't be determined from the mode, we'll just fall back
;; to declaring manually for now. Surely there's some way to make it
;; work, but I don't feel like figuring it out right now.

(defun use-package-normalize/:bind-leader-local (name-symbol keyword args)
  (use-package-only-one (symbol-name keyword) args
    (lambda (label arg) arg)))

(defun use-package-handler/:bind-leader-local (name-symbol keyword args rest state)
  (let ((mode-map (intern (format "%s-map" name-symbol))))
    `((general-define-key :states '(normal visual)
			  :prefix ","
			  :maps ',mode-map
			  ,@args))))
					    
(add-to-list 'use-package-keywords :bind-leader-local t)

;; (add-to-list use-package-keywords :bind-leader-mode t)

(provide 'keys)

;;; keys.el ends here
