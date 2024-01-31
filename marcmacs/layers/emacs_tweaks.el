;;;; Configure emacs internal stuff ;;;;

;;; Emacs
(use-package emacs
  :init
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 1)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete)
  (setq ediff-merge-split-window-function #'split-window-vertically)
  ;; (if (fboundp 'xwidget-webkit-browse-url)
  ;;     (setq browse-url-browser-function #'xwidget-webkit-browse-url))

  :bind
  ;; tab usage
  ("M-g M-t" . #'tab-next)
  ("M-g M-b" . #'tab-previous)

  ;; text expansion
  ("s-/" . #'hippie-expand)

  ;; buffer management
  ("s-," . #'previous-buffer)
  ("s-." . #'next-buffer)

  ;; google
  ("C-x G" . #'ms/google-it)

  :config
  (setq tab-width 4)
  (add-hook 'bookmark-exit-hook 'bookmark-save) ;; save bookmarks when exiting emacs
  )


(use-package winner
  :bind
  ("C-c h" . #'winner-undo)
  ("C-c l" . #'winner-redo))
(winner-mode 1)

;;; Dired
(use-package dired
  :ensure nil
  :bind
  (("M-g d" . dired-jump)
   (:map dired-mode-map
	 ("-" . dired-up-directory)
	 ("E" . emms-add-dired)))
  :config
  (use-package all-the-icons-dired
    :hook (dired-mode . all-the-icons-dired-mode)
    :config (setq all-the-icons-dired-monochrome nil))
)



;;; Hydra
(use-package hydra)
