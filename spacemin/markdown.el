;;; markdown --- kinda nice, really.

;;; Commentary:
;;; not a lot to see here, move along.

;;; Code:

(use-package markdown-mode
  :mode ("\\.md\\'" . markdown-mode))

(use-package markdown-toc
    :config
    (localleader :keymaps 'markdown-mode-map
		 "e" '(:ignore t :which-key "edit")
		 "et" 'markdown-toc-generate-or-refresh-toc))

;;; markdown.el ends here
