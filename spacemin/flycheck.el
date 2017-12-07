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

;; TODO: enable emoji so I can use this v cool package.
;; (use-package flycheck-status-emoji
;;   :init (flycheck-status-emoji-mode 1))

;;; flycheck.el ends here
