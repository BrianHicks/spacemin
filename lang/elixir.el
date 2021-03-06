;;; elixir --- potions 'n such

;;; Commentary:

;;; Code:

;; TODO: thaw/update/freeze cycle for this when the auto-format PR lands.
(use-package elixir-mode
  :mode "\\.exs?\\'"
  :config
  (add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t))))

;; TODO: uncomment this once I've researched what Alechemist actually does. It's
;; a big surface area to just say "meh, ok, turn it on" without bindings or any
;; idea how it will effect my editing environment.
(use-package alchemist
  :after elixir-mode
  :init
  (add-hook 'elixir-mode-hook 'alchemist-mode)
  ;; TODO: http://alchemist.readthedocs.io/en/latest/basic_usage/
  ;; TODO: https://github.com/bodil/ohai-emacs/blob/master/modules/ohai-elixir.el
  )

(provide 'elixir)

;;; elixir.el ends here
