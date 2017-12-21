;;; haskell --- mo lambdas, mo problems

;;; Commentary:
;;; Haskell + Intero for now.  We'll see if ghc-mod is better sometime
;;; but Intero seems to be better in most respects.

;;; Code:

(use-package haskell-mode
  :mode "\\.\\(hs\\|lhs\\|hsc\\|cpphs\\|c2hs\\)\\'"
  :config
  (localleader :keymaps 'haskell-mode-map
               "g" '(:ignore t :which-key "go")
               "gi" 'haskell-navigate-imports

               "e" '(:ignore t :which-key "edit")
               "ei" 'haskell-mode-format-imports)
  )

(use-package intero
  :defer
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(use-package hindent
  :defer
  :config
  (setq hindent-reformat-buffer-on-save t)

  (localleader :keymaps 'haskell-mode-map
               "f" (:ignore t :which-key "format")
               "ff" 'hindent-reformat-buffer
               "fd" 'hindent-reformat-decl)
  )

;;; haskell.el ends here
