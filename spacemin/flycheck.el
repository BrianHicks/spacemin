;;; Package -- add flycheck checking

;;; Commentary:
;;; it's flycheck!

;;; Code:

(use-package flycheck
  :init (global-flycheck-mode)

  (evil-leader/set-key
    "el" 'flycheck-list-errors
    "en" 'next-error
    "ep" 'previous-error))
