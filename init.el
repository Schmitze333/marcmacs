;;; init.el --- My homegrown Emacs init file

;;; Setup directories
(setq marcmacs--dir (expand-file-name "marcmacs" user-emacs-directory))
(setq marcmacs--layer-dir (expand-file-name "layers" marcmacs--dir))

(load (expand-file-name "defaults.el" marcmacs--layer-dir))
(load (expand-file-name "macos.el" marcmacs--layer-dir))
(load (expand-file-name "custom_function.el" marcmacs--layer-dir))

;; Initialize package sources
(require 'package)
(setq package-archives '(("stable-melpa" . "https://stable.melpa.org/packages/")
       ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; A few more useful configurations...
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete)
  (setq ediff-merge-split-window-function #'split-window-vertically)
  (if (fboundp 'xwidget-webkit-browse-url)
      (setq browse-url-browser-function #'xwidget-webkit-browse-url))

  :bind
  ("s-/" . #'hippie-expand)
  ("s-," . #'previous-buffer)
  ("s-." . #'next-buffer)
  ("C-x G" . #'ms/google-it))

;; All-the-icons
(use-package all-the-icons)

;; Ansi-colors in terminal
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point)))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(load (expand-file-name "dashboard.el" marcmacs--layer-dir))
;; Startup with a Dashboard
;; (use-package dashboard
;;   :ensure t
;;   :demand
;;   :init
;;   (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
;;   (setq dashboard-banner-logo-title "Happy Hacking!")
;;   (setq dashboard-startup-banner "~/.emacs.d/monstermacs.png")
;;   (setq dashboard-center-content t)
;;   (setq dashboard-projects-backend 'projectile)
;;   (setq dashboard-items
;; 	'((recents . 4)
;; 	  (projects . 5)
;; 	  (agenda . 4)))
;;   (setq dashboard-set-file-icons t)
;;   :config
;;   (dashboard-setup-startup-hook))

;; Dired config
(use-package dired
  :ensure nil
  :bind
  (("M-g d" . dired-jump)
   (:map dired-mode-map
   ("-" . dired-up-directory))))

(use-package elisp-format)

;; Doom Themes
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-xcode t) ; Alternatives: doom-henna

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;; Modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 1))

;; Completion System
(use-package vertico
  :bind
  (:map vertico-map ("C-l" . vertico-insert))
  :init (vertico-mode))

(use-package vertico-posframe
  :config
  (setq vertico-posframe-parameters
	'((left-fringe . 8)
	  (right-fringe . 8)
	  (border-color . "green")
	  (alpha . 95)))
  (vertico-posframe-mode 1))

;; Enable richer annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (:map minibuffer-local-map
	 ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

;; Fuzzy completion
(use-package orderless
  :init
  (setq completion-styles '(substring orderless)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; consult
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings (mode-specific-map)
	 ;; ("C-c h" . consult-history)
	 ("C-c m" . consult-mode-command)
	 ;; ("C-c b" . consult-bookmark)
	 ;; ("C-c k" . consult-kmacro)
	 ;; C-x bindings (ctl-x-map)
	 ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
	 ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
	 ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
	 ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
	 ;; Custom M-# bindings for fast register access
	 ;; ("M-#" . consult-register-load)
	 ;; ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
	 ;; ("C-M-#" . consult-register)
	 ;; Other custom bindings
	 ("M-y" . consult-yank-pop)                ;; orig. yank-pop
	 ("<help> a" . consult-apropos)            ;; orig. apropos-command
	 ;; M-g bindings (goto-map)
	 ("M-g e" . consult-compile-error)
	 ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
	 ("M-g g" . consult-goto-line)             ;; orig. goto-line
	 ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
	 ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
	 ("M-g m" . consult-mark)
	 ("M-g k" . consult-global-mark)
	 ("M-g i" . consult-imenu)
	 ("M-g I" . consult-imenu-multi)
	 ("M-g T" . consult-theme)
	 ;; M-s bindings (search-map)
	 ("M-s f" . consult-find)
	 ("M-s F" . consult-locate)
	 ("M-s g" . consult-grep)
	 ("M-s G" . consult-git-grep)
	 ("M-s r" . consult-ripgrep)
	 ("M-s l" . consult-line)
	 ("M-s L" . consult-line-multi)
	 ("M-s m" . consult-multi-occur)
	 ("M-s k" . consult-keep-lines)
	 ("M-s u" . consult-focus-lines)
	 ;; Isearch integration
	 ("M-s e" . consult-isearch-history)

	 :map isearch-mode-map
	 ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
	 ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
	 ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
	 ("M-s L" . consult-line-multi))           ;; needed by consult-line to detect isearch

  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  ;; Optionally replace `completing-read-multiple' with an enhanced version.
  (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)
  :config

  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme
   :preview-key '(:debounce 0.1 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-recent-file consult--source-project-recent-file consult--source-bookmark
   :preview-key (kbd "M-."))

  ;;;; 2. projectile.el (projectile-project-root)
  (autoload 'projectile-project-root "projectile")
  (setq consult-project-root-function #'projectile-project-root))

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ;; ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
	       '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
		 nil
		 (window-parameters (mode-line-format . none)))))
(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;; Ag
(use-package ag)

;; Swiper
(use-package swiper
  :bind
  ("M-s s" . swiper)
  ("M-s M-s" . swiper-thing-at-point))

(use-package which-key
  :diminish which-key-mode
  :custom
  (which-key-idle-delay 0.5)
  :init (which-key-mode))

(use-package which-key-posframe
  :config
  (setq which-key-posframe-parameters
	'((left-fringe . 25)
	  (right-fringe . 25)
	  (border-width . 5)))
  (which-key-posframe-mode))

;; Visual add-ons
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package yafolding)

;; EWW
(setq eww-search-prefix "https://duckduckgo.com/?q=")

;; Org mode
(use-package org-modern
  :config
  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-agenda-finalize-hook #'org-modern-agenda))
(use-package ox-gfm
  :after (org))

;; Projectile
(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-mode)
  :bind
  ("C-M-j" . projectile-run-vterm)
  (:map projectile-command-map
	("s-p". consult-project-buffer)
	("f" . consult-projectile-find-file))
  :bind-keymap
  ("s-p" . projectile-command-map)
  :init
  (when (file-directory-p "~/develop/ivx")
    (setq projectile-project-search-path '("~/develop/ivx")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package consult-projectile
  :after projectile)

;; Completion at point with Corfu
(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; ;; You may want to enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; mapping some keys
  :bind
  (:map corfu-map
	("C-l". corfu-insert)
	("C-SPC" . corfu-insert-separator))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since dabbrev can be used globally (M-/).
  :init
  (corfu-global-mode))

;; Use dabbrev with Corfu!
(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
	 ("C-M-/" . dabbrev-expand)))

;; Add extensions
(use-package cape
  ;; Bind dedicated completion commands
  :bind (("s-i" . completion-at-point) ;; capf
	 ("C-c p t" . complete-tag)        ;; etags
	 ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
	 ("C-c p f" . cape-file)
	 ("C-c p k" . cape-keyword)
	 ("C-c p s" . cape-symbol)
	 ("C-c p a" . cape-abbrev)
	 ("C-c p i" . cape-ispell)
	 ("C-c p l" . cape-line)
	 ("C-c p w" . cape-dict)
	 ("C-c p \\" . cape-tex)
	 ("C-c p _" . cape-tex)
	 ("C-c p ^" . cape-tex)
	 ("C-c p &" . cape-sgml)
	 ("C-c p r" . cape-rfc1345))
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-tex)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-ispell)
  (add-to-list 'completion-at-point-functions #'cape-dict)
  (add-to-list 'completion-at-point-functions #'cape-symbol)
  (add-to-list 'completion-at-point-functions #'cape-line)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
)
;;; Corfu

;; IEdit
(use-package iedit)

;; Perspective.el
(use-package perspective
  :bind ("C-x C-b" . persp-list-buffers)   ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "s-l"))
  :config
  (persp-mode))

;; Integrate perspective.el with projectile
(use-package persp-projectile
  :bind
  (:map projectile-command-map ("l" . #'projectile-persp-switch-project)))

;; Winum
(use-package winum
  :bind
  ("M-1". #'winum-select-window-1)
  ("M-2". #'winum-select-window-2)
  ("M-3". #'winum-select-window-3)
  ("M-4". #'winum-select-window-4)
  ("M-0". #'winum-select-window-0)
  :config
  (setq winum-auto-assign-0-to-minibuffer t)
  (winum-mode))

;; popwin
(use-package popwin
  :config
  (global-set-key (kbd "s-j") popwin:keymap)
  (push '(compilation-mode :noselect t :position bottom :height 22) popwin:special-display-config)
  (push '("*rspec-compilation*" :noselect t :position bottom :height 22) popwin:special-display-config)
  (push '("*vterm" :regexp t :stick t :position bottom :height 24) popwin:special-display-config)
  (popwin-mode))

;; Magit
(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Git Gutter
(use-package git-gutter
  :config
  (global-git-gutter-mode t))

;; vterm
(use-package vterm)

;; Eshell - Git prompt
(use-package eshell-git-prompt
  :config
  (eshell-git-prompt-use-theme 'powerline))

;; Restclient
(use-package restclient)

;; Exec-path-from-shell
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; add-node-modules-path
(use-package add-node-modules-path
  :hook (ruby-mode web-mode))

;; Google Translate
(use-package google-translate
  :custom
  (require 'google-translate)
  (require 'google-translate-default-ui)
  (google-translate-backend-method 'curl)
  (google-translate-backend-debug t)
  (google-translate-default-source-language "en")
  (google-translate-default-target-language "de")
  :bind ("C-x T" . google-translate-query-translate))

;; Docker
(use-package
  docker
  :custom (docker-container-columns
	   '((:name "Names"
		    :width 25
		    :template "{{ json .Names }}"
		    :sort nil
		    :format nil)
	     (:name "Status"
		    :width 20
		    :template "{{ json .Status }}"
		    :sort nil
		    :format nil)
	     (:name "Ports"
		    :width 30
		    :template "{{ json .Ports }}"
		    :sort nil
		    :format nil)
	     (:name "Created"
		    :width 23
		    :template "{{ json .CreatedAt }}"
		    :sort nil
		    :format (lambda (x)
			      (format-time-string "%F %T" (date-to-time x))))
	     (:name "Image"
		    :width 15
		    :template "{{ json .Image }}"
		    :sort nil
		    :format nil)
	     (:name "Id"
		    :width 16
		    :template "{{ json .ID }}"
		    :sort nil
		    :format nil)
	     (:name "Command"
		    :width 30
		    :template "{{ json .Command }}"
		    :sort nil
		    :format nil)))
  :bind ("s-d" . docker))

;; json-mode
(use-package json-mode
  :config
  (setq js-indent-level 2))

;; yas-snippets
(use-package yasnippet
  :config
  (yas-reload-all)
  (yas-global-mode)
  :bind (:map yas-minor-mode-map
	("C-'" . yas-expand)
	([(tab)] . nil)
	("TAB" . nil)))
(use-package react-snippets
  :after (yasnippet))
(use-package yasnippet-snippets
  :after (yasnippet))
(use-package js-react-redux-yasnippets
  :after (yasnippet))

;; Web-mode
(use-package web-mode
  :mode (("\\.js\\'" . web-mode)
   ("\\.jsx\\'" . web-mode)
   ("\\.ts\\'" . web-mode)
   ("\\.tsx\\'" . web-mode)
   ("\\.html\\'" . web-mode))
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-auto-quote-style 2)
  :commands web-mode)

;; Prettier 🧞‍♀️
(use-package
  prettier-js
  :hook (web-mode . prettier-js-mode)
  (ruby-mode . prettier-js-mode))

;; (use-package lsp-mode
;;   :init
;;   :hook ((web-mode . lsp-deferred)
;;    (ruby-mode . lsp-deferred)
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :config
;;   (setq lsp-log-io nil)
;;   (setq lsp-restart 'auto-restart)
;;   (setq lsp-keymap-prefix "C-c l")
;;   :commands lsp-deferred)

;; (use-package lsp-ui
;;   :custom
;;   (lsp-ui-sideline-show-diagnostics t)
;;   (lsp-ui-sideline-show-hover t)
;;   (lsp-ui-sideline-show-code-actions t)
;;   :commands lsp-ui-mode)

;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; eglot
(use-package eglot
  :config
  ;; (setq eglot-stay-out-of '(flymake))
  ;; (add-hook 'eglot--managed-mode-hook (lambda ()
					;; (add-hook 'flymake-diagnostic-functions
						  ;; 'eglot-flymake-backend nil t)))
  ;; (add-hook 'ruby-mode-hook 'eglot-ensure)
  (add-to-list 'eglot-server-programs '(web-mode . ("typescript-language-server" "--stdio")))
  (add-hook 'ruby-mode-hook (lambda ()
			      (setq eglot-stay-out-of '(flymake))
			      (eglot-ensure)))
  (add-hook 'web-mode-hook 'eglot-ensure)
  (add-hook 'go-mode-hook 'eglot-ensure))

;;;;;;;;;;;;;;;
;;;; Ruby ;;;;;
(use-package ruby-end)
(use-package flymake-ruby
  :hook (ruby-mode . flymake-ruby-load))
(use-package rubocop
  :hook (ruby-mode . rubocop-mode))
(use-package inf-ruby)
(use-package bundler
  :bind
  ((:map ruby-mode-map ("C-c b i" . #'bundle-install))
   (:map ruby-mode-map ("C-c b x" . #'bundle-exec))
   (:map ruby-mode-map ("C-c b u" . #'bundle-update))
   (:map ruby-mode-map ("C-c b o" . #'bundle-outdated))))

(use-package rspec-mode
  :hook (ruby-mode)
  :init
  (add-hook 'compilation-filter-hook #'inf-ruby-auto-enter)
  (add-hook 'rspec-before-verification-hook #'save-some-buffers)
  :config
  (rspec-install-snippets)
  (setq compilation-scroll-output t))

;;;; TypeScript ;;;;
(use-package flymake-eslint
  :custom
  (add-hook 'web-mode-hook (lambda ()
			     (flymake-eslint-enable))))
(use-package jest
  :after (web-mode)
  :hook (web-mode . jest-minor-mode))

;;;; Elixir ;;;;
(use-package elixir-mode)

;;;; Golang ;;;;
(use-package go-mode
  :init
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook #'gofmt-before-save))
(use-package gotest)

;;;; YAML ;;;;
(use-package yaml-mode)

;;;; Markdown ;;;;
(defun xwidget-webkit-markdown-preview (file)
  "Preview FILE with xwidget-webkit to be used with `markdown-live-preview-window-function'."
  (let ((uri (format "file://%s" file)))
      (xwidget-webkit-browse-url uri)
      xwidget-webkit-last-session-buffer))
(use-package markdown-mode
  :init
  (setq markdown-command "multimarkdown")
  (setq markdown-live-preview-window-function 'xwidget-webkit-markdown-preview))
(use-package markdown-changelog)

;;;; Groovy ;;;;
(use-package groovy-mode)

;;;; Dockerfile ;;;;
(use-package dockerfile-mode)

;;;; Read pdfs in Emacs ;;;;
(use-package pdf-tools)

(use-package csv-mode)

;;;; Play music ;;;;
(use-package bongo)

;;;;;;;;;;;;;;;;;;;
;; Supercollider ;;

;; used to visit documentation
;; (use-package w3m)

;; (use-package sclang
;;   :load-path "/Users/marcschmitz/Library/Application Support/SuperCollider/downloaded-quarks/scel/el"
;;   :init
;;   (setq exec-path (append exec-path '("/Applications/SuperCollider.app/Contents/MacOS/"))))
;; (use-package sclang-extensions)
;; (use-package sclang-snippets)

;; Show Dashboard screen
(dashboard-refresh-buffer)
(provide 'init)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/org/xlink_data.org" "/Users/marcschmitz/org/ivx_principals.org"))
 '(package-selected-packages
   '(ag bongo jest flymake-eslint flymake-collection elixir-mode dockerfile-mode jenkinsfile-mode groovy-mode markdown-changelog markdown-preview-eww markdown-mode gotest go-mode yafolding google-translate docker org-modern git-gutter rubocop elisp-format doc-view-mode csv-mode sclang-snippets sclang-extensions w3m pdf-tools yaml-mode rspec-mode bundler inf-ruby flymake-ruby ruby-end eglot prettier-js web-mode js-react-redux-yasnippets yasnippet-snippets react-snippets yasnippet json-mode add-node-modules-path exec-path-from-shell restclient eshell-git-prompt vterm magit popwin winum persp-projectile perspective iedit cape corfu consult-projectile projectile ox-gfm rainbow-delimiters which-key-posframe which-key swiper embark-consult embark consult orderless marginalia vertico-posframe vertico doom-modeline doom-themes dashboard all-the-icons use-package))
 '(safe-local-variable-values
   '((eval progn
	   (add-to-list 'exec-path
			(concat
			 (locate-dominating-file default-directory ".dir-locals.el")
			 "node_modules/.bin/"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
