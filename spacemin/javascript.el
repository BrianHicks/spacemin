;;; javascript --- assembly language for the web

;;; Commentary:
;;; nothing to say, really.  It's JavaScript

;;; Code:

(use-package js2-mode
  :mode "\\.js\\'")

(use-package prettier-js
  :config
  (add-hook 'js2-mode-hook 'prettier-js-mode))

(use-package tern
  :config
  (add-hook 'js2-mode-hook 'tern-mode)

  (evil-leader/set-key-for-mode 'js-mode
    "mgg" 'tern-find-definition
    "mht" 'tern-get-type
    "mhd" 'tern-get-docs
    "mer" 'tern-rename-variable))

;;; javascript.el ends here
