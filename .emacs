
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(cond
 ((>= 24 emacs-major-version)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
           '("melpa-stable" . "http://stable.melpa.org/packages/"))
  (package-refresh-contents)
 )
)
;;(require 'server)
;;(unless (server-running-p)
;;  (start-server))
(require 'pug-mode)
(global-linum-mode t)
(setq inhibit-startup-screen t)
(setq-default frame-title-format '("%b %f [%m]"))

