;;; project-tree --- project drawer

;;; Commentary:
;;; trying this out rather than customizing dired a whole lot more.
;;; We'll see how I like it; it may not stick.

;;; Code:

(use-package treemacs
  :general
  (general-nmap "-" 'treemacs)

  :config
  (treemacs-follow-mode t)
  (treemacs-git-mode 'simple)
  (treemacs-filewatch-mode t))

(use-package treemacs-evil
  :after treemacs
  )

(provide 'project-tree)

;;; project-tree.el ends here
