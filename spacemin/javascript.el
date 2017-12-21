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

  (localleader :keymaps 'term-mode-map
	       "g" '(:ignore t :which-key "go")
               "gg" 'tern-find-definition

	       "h" '(:ignore t :which-key "help")
               "ht" 'tern-get-type
               "hd" 'tern-get-docs

	       "e" '(:ignore t :which-key "edit")
               "er" 'tern-rename-variable)
  )

;;; javascript.el ends here
