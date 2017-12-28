;;; javascript --- assembly language for the web

;;; Commentary:
;;; nothing to say, really.  It's JavaScript

;;; Code:

(use-package js2-mode
  :mode "\\.js\\'"
  :config
  (setq js2-basic-offset 2))

(use-package prettier-js
  :after js2-mode
  :config
  (add-hook 'js2-mode-hook 'prettier-js-mode))

(use-package tern
  :after js2-mode
  :general
  (general-nvmap :keympas 'tern-mode-map
		 "gd" 'tern-find-definition)

  (general-nvmap :keymaps 'tern-mode-map
		 :prefix ","
		 "h" '(:ignore t :which-key "help")
		 "ht" 'tern-get-type
		 "hd" 'tern-get-docs

		 "r" 'tern-rename-variable)

  :config
  (add-hook 'js2-mode-hook 'tern-mode))

(provide 'javascript)

;;; javascript.el ends here
