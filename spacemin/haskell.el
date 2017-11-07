;;; haskell --- mo lambdas, mo problems

;;; Commentary:
;;; Haskell + Intero for now.  We'll see if ghc-mod is better sometime
;;; but Intero seems to be better in most respects.

;;; Code:

(use-package haskell-mode
  :mode "\\.\\(hs\\|lhs\\|hsc\\|cpphs\\|c2hs\\)\\'"
  :config
  (evil-leader/set-key-for-mode 'haskell-mode
    "mgi" 'haskell-navigate-imports
    "mei" 'haskell-mode-format-imports
    ))

(use-package intero
		:defer
  :config
  (add-hook 'haskell-mode-hook 'intero-mode))

(use-package hindent
		:defer
  :config
  (setq hindent-reformat-buffer-on-save t)

  (evil-leader/set-key-for-mode 'haskell-mode
    "mff" 'hindent-reformat-buffer
    "mfd" 'hindent-reformat-decl))

;;; haskell.el ends here
