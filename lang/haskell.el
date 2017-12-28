;;; haskell --- mo lambdas, mo problems

;;; Commentary:
;;; Haskell + Intero for now.  We'll see if ghc-mod is better sometime
;;; but Intero seems to be better in most respects.

;;; Code:

(use-package haskell-mode
  :bind-prefix-local
  ("g" '(:ignore t :which-key "go")
   "gi" 'haskell-navigate-imports

   "e" '(:ignore t :which-key "edit")
   "ei" 'haskell-mode-format-imports))

(use-package intero
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(use-package hindent
  :config
  (setq hindent-reformat-buffer-on-save t)

  ;; TODO: here's a place it would be handy to specify map via :bind-prefix-local
  (general-define-key :states '(normal visual)
		      :keymaps 'haskell-mode-map
		      :prefix ","
		      "f" '(:ignore t :which-key "format")
		      "ff" 'hindent-reformat-buffer
		      "fd" 'hindent-reformat-decl))

(provide 'haskell)

;;; haskell.el ends here
