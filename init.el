;;; init.el --- user init file -*- no-byte-compile: t -*-

;;; Commentary:
;;; Bootstrap everything.  As little as possible should live here.

;;; Code:

;; enable package.  This wasn't required before, I'm not sure what changed! :(
(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)

;; bootstrap straight.el
(let ((bootstrap-file (concat user-emacs-directory "straight/bootstrap.el"))
      (bootstrap-version 2))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; integrate with use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; use-package dependencies
(straight-use-package 'delight)

;;;; bootstrapping done! ;;;;

(defvar emacs-d
  (file-name-directory (file-chase-links load-file-name))
  "Our .emacs.d location.")

;; wrap use-package to load local packages
(defmacro local (from name &rest body)
  "Look in FROM for NAME, and send BODY to use-package."
  `(use-package ,name
     :straight nil
     :load-path ,from
     ,@body))

;; base packages. These set up the basic editor functionality I expect.
(local "setup" keys) ;; needs to be first to register :bind-leader and :bind-leader-local
(local "setup" vim) ;; needs to be second to register evil state maps

(local "setup" basics)
(local "setup" compilation)
(local "setup" completion)
(local "setup" display)
(local "setup" fuzzy-everything)
(local "setup" git)
(local "setup" icons)
(local "setup" jumping)
(local "setup" linting)
(local "setup" profiling)
(local "setup" project-tree)
(local "setup" projects)

;; language packages
(local "lang" coffeescript)
(local "lang" csv)
(local "lang" elm)
(local "lang" graphviz     :mode "\\.dot\\'")
(local "lang" haml         :mode "\\.haml\\'")
(local "lang" haskell      :mode "\\.\\(hs\\|lhs\\|hsc\\|cpphs\\|c2hs\\)\\'")
(local "lang" idris        :mode "\\.idr\\'")
(local "lang" javascript   :mode "\\.js\\'")
(local "lang" lang-json    :mode "\\.json\\'")
(local "lang" markdown)
(local "lang" ruby         :mode "\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'")
(local "lang" rust         :mode "\\.rs\\'")
(local "lang" toml         :mode "/\\(.+\\.toml\\|Cargo.lock\\|.cargo/config\\)\\'")
(local "lang" yaml         :mode "\\.ya?ml\\'")


;; autogenerated stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
