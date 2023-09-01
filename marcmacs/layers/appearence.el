;;;; Configure the Appearence of Emacs ;;;;

;;; Default Font
;; Source Code Pro-12
(add-to-list 'default-frame-alist
       '(font . "Menlo-12"))

;; Line numbers
(global-display-line-numbers-mode t)
(column-number-mode)

;; Highlight current line
(global-hl-line-mode 1)


;; Highlight line after jumps
;; stolen from: https://karthinks.com/software/batteries-included-with-emacs/
(defun pulse-line (&rest _)
      "Pulse the current line."
      (pulse-momentary-highlight-one-line (point)))

(dolist (command '(scroll-up-command
		   scroll-down-command
		   recenter-top-bottom
		   move-to-window-line-top-bottom
		   move-to-window-line
		   other-window))
  (advice-add command :after #'pulse-line))

;;; Doom Themes
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
	doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-monokai-machine t) ; Alternatives: doom-henna

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(use-package creamsody-theme)

;;; Modeline
;; (use-package doom-modeline) <<-- currently buggy!!!


;; ;; All-the-icons
(use-package all-the-icons)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package highlight-indentation)

(use-package golden-ratio
  :config
  (add-to-list 'golden-ratio-extra-commands 'winum-select-window-1)
  (add-to-list 'golden-ratio-extra-commands 'winum-select-window-2)
  (add-to-list 'golden-ratio-extra-commands 'winum-select-window-3)
  (add-to-list 'golden-ratio-extra-commands 'winum-select-window-4)
  (golden-ratio-adjust 0.85)
  :custom
  (golden-ratio-mode t))
