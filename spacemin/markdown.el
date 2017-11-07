;;; markdown --- kinda nice, really.

;;; Commentary:
;;; not a lot to see here, move along.

;;; Code:

(use-package markdown-mode
  :mode ("\\.md\\'" . markdown-mode))

(use-package markdown-toc
    :config
    (evil-leader/set-key-for-mode 'markdown-mode
      "met" 'markdown-toc-generate-or-refresh-toc))

;;; markdown.el ends here
