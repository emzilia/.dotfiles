;; General
(menu-bar-mode -1)
;;(tool-bar-mode -1)
(global-display-line-numbers-mode)
(fido-vertical-mode)
(savehist-mode)
(setq vc-follow-symlinks t)
(setq inhibit-startup-screen t)
(setq c-basic-offset 8)
(defalias 'yes-or-no-p 'y-or-n-p)

;;
;; Custom binds
;;
(keymap-global-set "C-x m" #'compile)
(keymap-global-set "C-x g" #'goto-line)

;;
;; Backups/autosaves
;;
(setq
   backup-by-copying t
   backup-directory-alist
    '(("." . "~/.emacs-saves/"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)

(setq auto-save-file-name-transforms
  `((".*" "~/.emacs-saves/" t)))

;;
;; Package maintance/installation
;;
(require 'package)
(setq package-native-compile t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq
  use-package-always-ensure t
  use-package-verbose t)


;; Run a shell command on buffer contents
(defun shell-command-on-buffer ()
  (interactive)
  (shell-command-on-region
	(point-min) (point-max)
	(read-shell-command "Shell command on buffer: ")))
(global-set-key (kbd "M-\"") 'shell-command-on-buffer)


;; Package: Add path to emacs shell
(use-package exec-path-from-shell
			 :config
			 (exec-path-from-shell-initialize))

;; Package: Ivy
;;(use-package ivy
;;			 :init
;;			 (ivy-mode 1)
;;			 (setq
;;			   ivy-height 10
;;			   ivy-use-virtual-buffers t
;;			   ivy-use-selectable-prompt -1))


;; Package: Counsel
;;(use-package counsel
;;			 :after ivy
;;			 :init
;;			 (counsel-mode 1)
;;			 :bind (:map ivy-minibuffer-map))


;; Package: company-mode
(use-package company
  :custom
  (company-idle-delay 0)
  (company-dabbrev-downcase nil)
  (company-show-numbers t)
  (company-tooltip-limit 9)
  :config
  (global-company-mode))


;; Package: Flycheck
(use-package flycheck
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode)
  (add-hook 'after-init-hook #'global-flycheck-mode))


;; Package: rustic
(use-package rustic
  :config
  (setq rustic-format-on-save t)
  :hook
  (rustic-mode . (lambda ()
		   (setq indent-tabs-mode nil)
		   (setq rust-indent-offset 4))))


;; Package: lsp-mode
(use-package lsp-mode
  :hook
  ((c-mode . lsp))
  ((python-mode . lsp)))


;; Enable native compilation
(when (and (fboundp 'native-comp-available-p)
         (native-comp-available-p))
  (setq native-comp-async-report-warnings-errors nil)
  (setq comp-deferred-compilation t))

;; Custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-show-quick-access t nil nil "Customized with use-package company")
 '(package-selected-packages '(company exec-path-from-shell flycheck lsp-mode rustic)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; General
(menu-bar-mode -1)
;;(tool-bar-mode -1)
(global-display-line-numbers-mode)
(fido-vertical-mode)
(savehist-mode)
(setq vc-follow-symlinks t)
(setq inhibit-startup-screen t)
(setq c-basic-offset 8)
(defalias 'yes-or-no-p 'y-or-n-p)

;;
;; Custom binds
;;
(keymap-global-set "C-x m" #'compile)
(keymap-global-set "C-x C-g" #'goto-line)

;;
;; Backups/autosaves
;;
(setq
   backup-by-copying t
   backup-directory-alist
    '(("." . "~/.emacs-saves/"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)

(setq auto-save-file-name-transforms
  `((".*" "~/.emacs-saves/" t)))

;;
;; Package maintance/installation
;;
(require 'package)
(setq package-native-compile t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq
  use-package-always-ensure t
  use-package-verbose t)


;; Run a shell command on buffer contents
(defun shell-command-on-buffer ()
  (interactive)
  (shell-command-on-region
	(point-min) (point-max)
	(read-shell-command "Shell command on buffer: ")))
(global-set-key (kbd "M-\"") 'shell-command-on-buffer)


;; Package: Add path to emacs shell
(use-package exec-path-from-shell
			 :config
			 (exec-path-from-shell-initialize))

;; Package: Ivy
;;(use-package ivy
;;			 :init
;;			 (ivy-mode 1)
;;			 (setq
;;			   ivy-height 10
;;			   ivy-use-virtual-buffers t
;;			   ivy-use-selectable-prompt -1))


;; Package: Counsel
;;(use-package counsel
;;			 :after ivy
;;			 :init
;;			 (counsel-mode 1)
;;			 :bind (:map ivy-minibuffer-map))


;; Package: company-mode
(use-package company
  :custom
  (company-idle-delay 0)
  (company-dabbrev-downcase nil)
  (company-show-numbers t)
  (company-tooltip-limit 9)
  :config
  (global-company-mode))


;; Package: Flycheck
(use-package flycheck
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode)
  (add-hook 'after-init-hook #'global-flycheck-mode))


;; Package: rustic
(use-package rustic
  :config
  (setq rustic-format-on-save t)
  :hook
  (rustic-mode . (lambda ()
		   (setq indent-tabs-mode nil)
		   (setq rust-indent-offset 4))))


;; Package: lsp-mode
(use-package lsp-mode
  :hook
  ((c-mode . lsp))
  ((python-mode . lsp)))


;; Package: magit
(use-package magit
  :config
  (keymap-global-set "C-c g" #'magit-dispatch)
  (keymap-global-set "C-c f" #'magit-file-dispatch))


;; Package: treemacs
(use-package treemacs
  :config
  (keymap-global-set "C-c f" #'treemacs))
  
;; Enable native compilation
(when (and (fboundp 'native-comp-available-p)
         (native-comp-available-p))
  (setq native-comp-async-report-warnings-errors nil)
  (setq comp-deferred-compilation t))

;; Custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-show-quick-access t nil nil "Customized with use-package company")
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
