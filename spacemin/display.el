;; turn off scroll bars (it's in modeline)
(scroll-bar-mode -1)

;; turn off the tool bar (which-key works fine and I've been vimming
;; for long enough that I never use it.)
(tool-bar-mode -1)

;; themes!
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)

  (doom-themes-visual-bell-config)

  ;; (doom-themes-neotree-config) ;: TODO: try neotree
  (doom-themes-org-config)

  (load-theme 'doom-one)
  ;; TODO: theme switcher

  (use-package solaire-mode
    :config
    (add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)
    (add-hook 'after-revert-hook #'turn-on-solaire-mode)
    (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)

    (solaire-mode-swap-bg)))

;; pretty modeline
(use-package telephone-line
  :config
  (setq telephone-line-primary-left-separator 'telephone-line-identity-left
        telephone-line-secondary-left-separator 'telephone-line-identity-left
        telephone-line-primary-right-separator 'telephone-line-identity-right
        telephone-line-seconary-right-separator 'telephone-line-identity-right)

  (telephone-line-evil-config))

;; fonts and ligatures
(when (window-system)
  (set-default-font "Fira Code")
  (set-face-attribute 'default nil :height 130))

(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

;; test bed for ligatures
;;
;;          .= .- := =:= __
;;         == != === !== =/=
;;
;; <-< <<- <-- <- <-> -> --> ->> >->
;; <=< <<= <==    <=> => ==> =>> >=>
;;     >>= >>- >- <~> -< -<< =<<
;;         <~~ <~ ~~ ~> ~~>
;;
;;      <<< << <= <> >= >> >>>
;;   <||| <|| <| <|> |> ||> |||>
;;            <$ <$> $>
;;            <+ <+> +>
;;            <* <*> *>
;;
;;       \\ \\\ \* */ /// //
;;       </ <!-- </>  --> />
;;
;;            0xFF 10x10
;;        9:45 m-x m+x *ptr
;;
;;      ;; :: ::: .. ... ..<
;;      !! ?? %% && || ?. ?:
;;            + ++ +++
;;            - -- ---
;;            * ** ***
;;
;;        ~= ~- www -~ ~@
;;      ^= ?= /= /== |= ||=
;;        #! ## ### ####
;;     #{ #[ ]# #( #? #_ #_(
