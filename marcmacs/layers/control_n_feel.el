;;;; Controls above completion ;;;;

(use-package embark
  :commands embark-act
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

(use-package swiper
  :bind
  ("M-s s" . swiper)
  ("M-s M-s" . swiper-thing-at-point))

(use-package which-key
  :defer t
  :diminish which-key-mode
  :custom
  (which-key-idle-delay 0.5)
  :init (which-key-mode))

(use-package which-key-posframe
  :after which-key
  :config
  (setq which-key-posframe-parameters
	'((left-fringe . 25)
	  (right-fringe . 25)
	  (border-width . 5)))
  (which-key-posframe-mode))

(use-package yafolding
  :defer t)

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

(use-package popwin
  :defer t
  :config
  (global-set-key (kbd "s-j") popwin:keymap)
  (push '(compilation-mode :noselect t :position bottom :height 22) popwin:special-display-config)
  (push '("*rspec-compilation*" :noselect t :position bottom :height 22) popwin:special-display-config)
  (push '("*vterm" :regexp t :stick t :position bottom :height 24) popwin:special-display-config)
  (popwin-mode))

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

