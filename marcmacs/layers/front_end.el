;;;; Front-end related stuff ;;;;

(use-package web-mode
  :mode (("\\.js\\'" . web-mode)
   ("\\.jsx\\'" . web-mode)
   ("\\.html\\'" . web-mode))
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-auto-quote-style 2)
  :config
  (require 'flycheck)
  (flycheck-add-mode 'javascript-eslint 'web-mode)

  :hook
  (web-mode . flycheck-mode)
  :commands web-mode)

(use-package eslint-fix)

(use-package npm
  :ensure t)

(use-package flymake-eslint
  :defer t
  :functions flymake-eslint-enable
  :preface
  (defun me/flymake-eslint-enable-maybe ()
    "Enable `flymake-eslint' based on the project configuration.
Search for the project ESLint configuration to determine whether the buffer
should be checked."
    (when-let* ((root (locate-dominating-file (buffer-file-name) "package.json"))
                (rc (locate-file ".eslintrc" (list root) '(".js" ".json"))))
      (make-local-variable 'exec-path)
      (push (file-name-concat root "node_modules" ".bin") exec-path)
      (flymake-eslint-enable))))

(use-package jest
  :after (web-mode)
  :hook (web-mode . jest-minor-mode))

(use-package jest-test-mode
  :ensure t
  :commands jest-test-mode
  :hook (web-mode))
