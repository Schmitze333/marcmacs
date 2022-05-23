;;;; Front-end related stuff ;;;;

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


(use-package flymake-eslint
  :custom
  (add-hook 'web-mode-hook (lambda ()
			     (flymake-eslint-enable))))

(use-package jest
  :after (web-mode)
  :hook (web-mode . jest-minor-mode))
