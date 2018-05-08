;;; snippets.el --- commonly typed things

;;; Commentary:

;;; Code:

(use-package yasnippet
  :general
  (general-imap "<backtab>" 'yas-expand)

  :config
  (yas-global-mode 1))

(provide 'snippets)

;;; snippets.el ends here
