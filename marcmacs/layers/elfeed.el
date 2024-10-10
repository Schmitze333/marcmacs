;;;; Configure Elfeed & Co ;;;;
(use-package elfeed
  :config

  (defun elfeed-display-buffer (buf &optional act)
    (display-buffer buf '((display-buffer-reuse-window
			   display-buffer-in-direction)
			  (direction . below)
			  (window . root)
			  (window-height . 0.7))))

  (setq elfeed-show-entry-switch #'elfeed-display-buffer)

  (defun elfeed-show-eww-open ()
    (interactive)
    (let ((browse-url-browser-function #'eww-browse-url))
      (elfeed-show-visit)))

  (defun elfeed-search-eww-open ()
    (interactive)
    (let ((browse-url-browser-function #'eww-browse-url))
      (elfeed-search-browse-url)))

  (define-key elfeed-show-mode-map (kbd "B") 'elfeed-show-eww-open)
  (define-key elfeed-search-mode-map (kbd "B") 'elfeed-search-eww-open)

  (define-key elfeed-show-mode-map (kbd "S-SPC") 'scroll-down-command)
  (define-key elfeed-search-mode-map (kbd "SPC") 'scroll-other-window)
  (define-key elfeed-search-mode-map (kbd "S-SPC") 'scroll-other-window-down)

  (setq elfeed-search-title-max-width 110)
  (setq elfeed-search-title-min-width 100)
  (setq elfeed-feeds
	'(
	  ("https://planet.emacslife.com/atom.xml" blog emacs planet-emacs)
	  ("https://protesilaos.com/codelog.xml" blog emacs patros)
	  ("https://systemcrafters.net/rss/news.xml" blog emacs dawil)

	  ("http://nullprogram.com/feed/" blog nullprogram)
	  ("https://martinfowler.com/updates.atom" blog martinfowler updates)
	  ("https://martinfowler.com/bliki/bliki.atom" blog martinfowler bliki)
	  ("https://feed.infoq.com/RSS/articles/" blog innoq)
	  ("https://feeds.feedburner.com/TheHackersNews" blog hackernews)
	  ("https://feeds.arstechnica.com/arstechnica/technology-lab" blog arstechnica)
	  ("https://thenewstack.io/blog/feed/" blog thenewstack)
	  ("https://aws.amazon.com/blogs/devops/feed/" blog devops aws)
	  ("https://www.alldaydevops.com/blog/rss.xml" blog devops alldaydevops)
	  ("https://feed.infoq.com/Devops/articles/" blog devops innoq)
	  ("https://www.czerniga.it/pl/feed/" blog devops czerni)
	  ("https://blog.devopsabcs.com/index.php/feed/" blog devops abc)
	  ("https://devopsinstitute.com/feed/" blog devops institute)
	  ("http://www.devopsonline.co.uk/feed/" blog devops devops-online)
	  ("https://www.devopstoday.net/feed/" blog devops devops-today)
	  ("https://www.docker.com/blog/feed/" blog devops docker)
	  ("https://devops.com/feed/" blog devops devops-com)
	  ("https://workatdevops.blogspot.com/feeds/posts/default" blog devops tutorial)

	  ("https://www.heise.de/rss/heise-Rubrik-Netzpolitik.rdf" blog heise netzpolitik)
	  ("https://www.heise.de/developer/rss/next-big-thing-blog.rdf" blog heise next-big-thing)
	  ("https://www.heise.de/developer/rss/tales-from-the-web-side-blog.rdf" blog heise tales-from-the-web)
	  ("https://www.heise.de/developer/rss/continuous-architecture-blog.rdf" blog heise continuous-architecture)
	  ("https://www.heise.de/developer/rss/der-pragmatische-architekt-blog.rdf" blog heise pragmatic-architect)
	  ("https://www.heise.de/developer/rss/ich-roll-dann-mal-aus.rdf" blog heise devops)
	  ("https://www.heise.de/developer/rss/well-organized-blog.rdf" blog heise well-organized)
	  ("https://www.heise.de/developer/rss/von-menschen-und-maschinen-blog.rdf" blog heise human-machine)

	  ("https://feeds.simplecast.com/7y1CbAbN" podcast maintainable)
	  ("https://innoq.podigee.io/feed/aac" podcast innoq)
	  ("https://feeds.simplecast.com/IgzWks06" podcast thenewstack)
	  ("https://devopsradio.libsyn.com/rss" podcast devops devops-radio)
	  )))
