;;;; init.el --- My homegrown Emacs init file ;;;;

;;; Initialize package sources
(require 'package)
(setq package-archives '(("stable-melpa" . "https://stable.melpa.org/packages/")
       ("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;; Setup directories
(setq marcmacs--dir (expand-file-name "marcmacs" user-emacs-directory))
(setq marcmacs--layer-dir (expand-file-name "layers" marcmacs--dir))

;;; Do not clutter this file with custom set variables
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq marcmacs-layers '(
			"defaults"
			"macos"
			"emacs_tweaks"
			"appearence"
			"custom_function"
			"completion_framework"
			"control_n_feel"
			"shells"
			"projects"
			"git"
			"develop_foundation"
			"ruby"
			"front_end"
			"cpp"
			"org"
			"dashboard"
			"elixir"
			"tools"
			"elfeed"
			"lilypond"
			"entertainment"))

(defun marcmacs--load-layer (layer-name)
  "Loads a MarcMacs layer"
  (message "Load layer %s" layer-name)
  (load (expand-file-name (concat layer-name ".el") marcmacs--layer-dir)))

(dolist (layer marcmacs-layers)
  (marcmacs--load-layer layer))

;;; Load Layers
;; (load (expand-file-name "defaults.el" marcmacs--layer-dir))
;; (load (expand-file-name "macos.el" marcmacs--layer-dir))
;; (load (expand-file-name "emacs_tweaks.el" marcmacs--layer-dir))
;; (load (expand-file-name "appearence.el" marcmacs--layer-dir))
;; (load (expand-file-name "custom_function.el" marcmacs--layer-dir))
;; (load (expand-file-name "completion_framework.el" marcmacs--layer-dir))
;; (load (expand-file-name "control_n_feel.el" marcmacs--layer-dir))
;; (load (expand-file-name "shells.el" marcmacs--layer-dir))
;; (load (expand-file-name "projects.el" marcmacs--layer-dir))
;; (load (expand-file-name "git.el" marcmacs--layer-dir))
;; (load (expand-file-name "develop_foundation.el" marcmacs--layer-dir))
;; (load (expand-file-name "ruby.el" marcmacs--layer-dir))
;; (load (expand-file-name "org.el" marcmacs--layer-dir))
;; (load (expand-file-name "dashboard.el" marcmacs--layer-dir))
;; (load (expand-file-name "front_end.el" marcmacs--layer-dir))
;; (load (expand-file-name "elixir.el" marcmacs--layer-dir))
;; (load (expand-file-name "tools.el" marcmacs--layer-dir))
;; (load (expand-file-name "entertainment.el" marcmacs--layer-dir))

;; (load (expand-file-name "supercollider.el" marcmacs--layer-dir))
(provide 'init)
