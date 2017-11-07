;;; elm --- types and tangrams

;;; Commentary:
;;; it's Elm!

;;; Code:

(use-package elm-mode
  :mode "\\.elm\\'"
  :config
  (setq elm-tags-on-save t
	elm-format-on-save t)

  (add-to-list 'company-backends 'company-elm)

  (evil-leader/set-key-for-mode 'elm-mode
    "mcc" 'elm-compile-buffer
    "mea" 'elm-compile-add-annotations
    "meI" 'elm-compile-clean-imports
    "mef" 'elm-mode-format-buffer)

  (use-package flycheck-elm
    :config
    (with-eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-elm-setup)))
  )

;;; elm.el ends here
