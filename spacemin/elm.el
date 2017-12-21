;;; elm --- types and tangrams

;;; Commentary:
;;; it's Elm!

;;; Code:

(use-package elm-mode
  :mode "\\.elm\\'"
  :init
  (use-package flycheck-elm)

  :config
  (setq elm-tags-on-save t
	elm-format-on-save t)

  (add-to-list 'company-backends 'company-elm)

  (localleader :keymaps 'elm-mode-keymap
    "c" '(:ignore t :which-key "compile")
    "cc" 'elm-compile-buffer

    "e" '(:ignore t :which-key "edit")
    "ea" 'elm-compile-add-annotations
    "eI" 'elm-compile-clean-imports
    "ef" 'elm-mode-format-buffer)

  (with-eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-elm-setup)))

;;; elm.el ends here
