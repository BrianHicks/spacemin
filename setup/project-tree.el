;;; project-tree --- project drawer

;;; Commentary:
;;; trying this out rather than customizing dired a whole lot more.
;;; We'll see how I like it; it may not stick.

;;; Code:

(use-package neotree
  :bind-prefix
  ("ft" 'neotree-toggle
   "ff" 'neotree-find
   "fp" 'neotree-project-dir)

  :config
  (doom-themes-neotree-config)

  ;; configure neotree
  (setq neo-window-width 30)

  (evil-global-set-key 'normal "-" 'neotree-find)

  ;; keybindings for inside neotree
  ;; TODO: redo these with general
  (add-hook 'neotree-mode-hook
    (lambda ()
      ;; basics
      (evil-local-set-key 'normal "q" 'neotree-hide)
      (evil-local-set-key 'normal "R" 'neotree-refresh)
      (evil-local-set-key 'normal "-" 'neotree-select-up-node)
      (evil-local-set-key 'normal "y" 'neotree-copy-filepath-to-yank-ring)

      ;; toggles
      (evil-local-set-key 'normal "I" 'neotree-hidden-file-toggle)
      (evil-local-set-key 'normal "z" 'neotree-stretch-toggle)

      ;; filesystem modification
      (evil-local-set-key 'normal "m" 'neotree-rename-node)
      (evil-local-set-key 'normal "c" 'neotree-create-node)
      (evil-local-set-key 'normal "C" 'neotree-copy-node)
      (evil-local-set-key 'normal "d" 'neotree-delete-node)

      ;; opening
      (evil-local-set-key 'normal "v" 'neotree-enter-vertical-split)
      (evil-local-set-key 'normal "s" 'neotree-enter-horizontal-split)
      (evil-local-set-key 'normal (kbd "RET") 'neotree-enter)
      ))

  (add-hook 'after-init-hook #'neotree-toggle))

(use-package find-file-in-project)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ffip-project-root))
        (file-name (buffer-file-name)))
    (if project-dir
        (progn
        (neotree-dir project-dir)
        (neotree-find file-name))
    (message "Could not find git project root."))))

(provide 'project-tree)

;;; project-tree.el ends here
