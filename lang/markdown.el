;;; markdown --- kinda nice, really.

;;; Commentary:
;;; not a lot to see here, move along.

;;; Code:

(use-package markdown-mode)

(use-package markdown-toc
    :config
    ;; TODO: another! :(
    (general-define-key :states '(normal visual)
			:keymaps 'markdown-mode-map
			:prefix ","
			"e" '(:ignore t :which-key "edit")
			"et" 'markdown-toc-generate-or-refresh-toc))

(provide 'markdown)

;;; markdown.el ends here
