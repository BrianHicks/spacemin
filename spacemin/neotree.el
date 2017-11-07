;;; neotree --- project drawer

;;; Commentary:
;;; trying this out rather than customizing dired a whole lot more.
;;; We'll see how I like it; it may not stick.

;;; Code:

(use-package neotree
  :config

  ;; keybindings to get into neotree
  (evil-leader/set-key
    "ft" 'neotree-toggle
    "ff" 'neotree-project-dir)

  (define-key evil-normal-state-local-map (kbd "-") 'neotree-project-dir)

  ;; keybindings for inside neotree
  (add-hook 'neotree-mode-hook
    (lambda ()
      ;; basics
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
      (define-key evil-normal-state-local-map (kbd "-") 'neotree-select-up-node)
      (define-key evil-normal-state-local-map (kbd "y") 'neotree-copy-filepath-to-yank-ring)

      ;; toggles
      (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
      (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)

      ;; filesystem modification
      (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
      (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
      (define-key evil-normal-state-local-map (kbd "C") 'neotree-copy-node)
      (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)

      ;; opening
      (define-key evil-normal-state-local-map (kbd "v") 'neotree-enter-vertical-split)
      (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-horizontal-split)
      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
      )))

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

;;; neotree.el ends here
