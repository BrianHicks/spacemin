;;; Package -- add flycheck checking

;;; Commentary:
;;; it's flycheck!

;;; Code:

(use-package flycheck
  :init (global-flycheck-mode)

  (globalleader
   "e" '(:ignore t :which-key "errors")
   "el" 'flycheck-list-errors
   "en" 'next-error
   "ep" 'previous-error))

(use-package flycheck-status-emoji
  :init (flycheck-status-emoji-mode 1))

(use-package flycheck-color-mode-line
  :init (flycheck-color-mode-line-mode 1))

;;; flycheck.el ends here
