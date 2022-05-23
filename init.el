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


;;; Load Layers
(load (expand-file-name "defaults.el" marcmacs--layer-dir))
(load (expand-file-name "macos.el" marcmacs--layer-dir))
(load (expand-file-name "emacs_tweaks.el" marcmacs--layer-dir))
(load (expand-file-name "appearence.el" marcmacs--layer-dir))
(load (expand-file-name "custom_function.el" marcmacs--layer-dir))
(load (expand-file-name "completion_framework.el" marcmacs--layer-dir))
(load (expand-file-name "control_n_feel.el" marcmacs--layer-dir))
(load (expand-file-name "shells.el" marcmacs--layer-dir))
(load (expand-file-name "projects.el" marcmacs--layer-dir))
(load (expand-file-name "git.el" marcmacs--layer-dir))
(load (expand-file-name "develop_foundation.el" marcmacs--layer-dir))
(load (expand-file-name "ruby.el" marcmacs--layer-dir))
(load (expand-file-name "org.el" marcmacs--layer-dir))
(load (expand-file-name "dashboard.el" marcmacs--layer-dir))
(load (expand-file-name "front_end.el" marcmacs--layer-dir))
(load (expand-file-name "elixir.el" marcmacs--layer-dir))
(load (expand-file-name "tools.el" marcmacs--layer-dir))
(load (expand-file-name "entertainment.el" marcmacs--layer-dir))

;; (load (expand-file-name "supercollider.el" marcmacs--layer-dir))
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
