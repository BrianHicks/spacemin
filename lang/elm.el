;;; elm --- types and tangrams

;;; Commentary:
;;; it's Elm!

;;; Code:

(use-package elm-mode
  :mode "\\.elm\\'"

  :general
  (general-nvmap :prefix ","
		 :keymaps 'elm-mode-map
		 "c" '(:ignore t :which-key "compile")
		 "cc" 'elm-compile-buffer

		 "e" '(:ignore t :which-key "edit")
		 "ea" 'elm-compile-add-annotations
		 "eI" 'elm-compile-clean-imports
		 "ef" 'elm-mode-format-buffer)

  :config
  (setq elm-tags-on-save t
	elm-format-on-save t)

  (add-to-list 'company-backends 'company-elm))

(use-package flycheck-elm
  :after '(flycheck elm)
  :config
  ;; TODO: this isn't working. Why?
  (with-eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-elm-setup)))

(provide 'elm)

;;; elm.el ends here
