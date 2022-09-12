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
(set-face-background 'hl-line "#600885")

;;; Doom Themes
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

;;; Modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 1))

;; All-the-icons
(use-package all-the-icons)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package highlight-indentation)
