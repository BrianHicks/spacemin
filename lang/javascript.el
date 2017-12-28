;;; javascript --- assembly language for the web

;;; Commentary:
;;; nothing to say, really.  It's JavaScript

;;; Code:

(use-package js2-mode
  :config
  (setq js2-basic-offset 2))

(use-package prettier-js
  :config
  (add-hook 'js2-mode-hook 'prettier-js-mode))

(use-package tern
  :config
  (add-hook 'js2-mode-hook 'tern-mode)

  ;; TODO: another place where the mode differs! :(
  (general-define-key :states '(normal visual)
		      :keymaps 'term-mode-map
		      :prefix ","
		      "g" '(:ignore t :which-key "go")
		      "gg" 'tern-find-definition

		      "h" '(:ignore t :which-key "help")
		      "ht" 'tern-get-type
		      "hd" 'tern-get-docs

		      "e" '(:ignore t :which-key "edit")
		      "er" 'tern-rename-variable))

(provide 'javascript)

;;; javascript.el ends here
