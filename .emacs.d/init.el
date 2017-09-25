;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))

;; the package manager
(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("org" . "http://orgmode.org/elpa/")
                    ("melpa" . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package scala-mode
  :interpreter
  ("scala" . scala-mode))

(require 'pug-mode)
;(add-hook 'after-save-hook 'pug-compile)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (helm use-package scala-mode pug-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq help-char nil)
(eval-after-load "helm-files"
  '(let ((helm-find-files-C-h-map (lookup-key helm-find-files-map (kbd "C-h"))))
     ;; make sure C-h is no longer a prefix key
     (define-key helm-find-files-map (kbd "C-h") nil)
     ;; rebind "C-h ..." to "M-m ..." to preserve functionality
     (define-key helm-find-files-map (kbd "M-m") helm-find-files-C-h-map)))

(global-set-key (kbd "C-h") 'backward-char)
(global-set-key (kbd "C-j") 'next-line)
(global-set-key (kbd "C-k") 'previous-line)
(global-set-key (kbd "C-l") 'forward-char)

(menu-bar-mode 0)
(fset `yes-or-no-p `y-or-n-p)

(global-set-key (kbd "M-]") 'next-buffer)
(global-set-key (kbd "M-[") 'previous-buffer)

;; nodejs REPL prompt fix
(setenv "NODE_NO_READLINE" "1")

;; Jakubova hlavni klavesa
(define-prefix-command 'jakub-map)
(global-set-key (kbd "M-j") 'jakub-map)
(define-prefix-command 'jakub-switch-map)
(global-set-key (kbd "M-j s") 'jakub-switch-map)
(defun switch-to-scratch () (interactive) (switch-to-buffer "*scratch*"))
(global-set-key (kbd "M-j s s") 'switch-to-scratch)
