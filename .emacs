(require 'package)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode)

;; macro for updating lists in place
(defmacro append-to-list (target suffix)
  "Append SUFFIX to TARGET in place."
  `(setq ,target (append ,target ,suffix)))

;; set up emacs package archives
(append-to-list package-archives
		'(("melpa" . "http://melpa.org/packages/")
		  ("melpa-stable" . "http://stable.melpa.org/packages/")
		  ("org-elpa" . "https://orgmode.org/elpa/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq
 use-package-always-ensure t
 use-package-verbose t)

(use-package exec-path-from-shell
	     :config
	     (exec-path-from-shell-initialize))

(use-package ivy
  :init
  (ivy-mode 1)
  (setq ivy-height 10
	ivy-use-virtual-buffers t
	ivy-use-selectable-prompt -1))

(use-package counsel
  :after ivy
  :init
  (counsel-mode 1)
  :bind (:map ivy-minibuffer-map))

(use-package projectile
  :init
  (projectile-mode t)
  :config
  (setq projectile-enable-caching t
	projectile-completion-system 'ivy))

(global-set-key (kbd "C-S-P") #'projectile-switch-project)
(global-set-key (kbd "C-S-A") #'projectile-add-known-project)
(global-set-key (kbd "C-S-S") #'projectile-find-file)

(use-package company
  :bind (("C-." . company-complete))
  :custom
  (company-idle-delay 0)
  (company-dabbrev-downcase nil)
  (company-show-numbers t)
  (company-tooltip-limit 9)
  :config
  (global-company-mode)

  (let ((map company-active-map))
    (mapc (lambda (x) (define-key map (format "%d" x)
			`(lambda () (interactive) (company-complete-number ,x))))
	  (number-sequence 0 9))))

(use-package flycheck
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode)
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package lsp-mode
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil
	lsp-headerline-breadcrumb-mode nil))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
			 (require 'lsp-pyright)
			 (lsp))))

(use-package god-mode
  :init
  (god-mode)
  (setq god-exempt-major-modes nil
	god-exempt-predicates nil))

(global-set-key (kbd "M-[") #'god-local-mode)

(defun my-god-mode-update-cursor-type ()
  (setq cursor-type (if (or god-local-mode buffer-read-only) 'box 'bar)))

(add-hook 'post-command-hook #'my-god-mode-update-cursor-type)

(defun my-god-mode-update-mode-line ()
  (cond
   (god-local-mode
    (set-face-attribute 'mode-line nil
	      :foreground "#dea5dc"
	      :background "#0d0421")
    (set-face-attribute 'mode-line-inactive nil
			:foreground "#0d0421"
			:background "#dea5dc"))
   (t
    (set-face-attribute 'mode-line nil
			:foreground "#0a0a0a"
			:background "#d7d7d7")
    (set-face-attribute 'mode-line-inactive nil
			:foreground "#404148"
			:background "#efefef"))))

(add-hook 'post-command-hook #'my-god-mode-update-mode-line)

(use-package magit
  :init)

(use-package modus-themes
  :ensure t
  :config
  (load-theme 'modus-vivendi-tinted t)
  (define-key global-map (kbd "<f5>") #'modus-themes-toggle))
 

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(global-set-key (kbd "C-S-t") 'tool-bar-mode)

(custom-set-variables
 ;; custom-set-variables was added by custom.
 ;; if you edit it by hand, you could mess it up, so be careful.
 ;; your init file should contain only one such instance.
 ;; if there is more than one, they won't work right.
 '(custom-safe-themes
   '("02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" default))
 '(package-selected-packages '(doom-themes exec-path-from-shell use-package)))
(custom-set-faces
 ;; custom-set-faces was added by custom.
 ;; if you edit it by hand, you could mess it up, so be careful.
 ;; your init file should contain only one such instance.
 ;; if there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
