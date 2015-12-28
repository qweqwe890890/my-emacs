;;  load path
(add-to-list 'load-path "~/.emacs.d/site-lisp")


;; color-theme
(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-wheat)

;; set font
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 70 :width normal)))))


;; melpa
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


;; smex
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; cedet
(add-to-list 'load-path "~/.emacs.d/site-lisp/cedet-1.1/common")
(load-file "~/.emacs.d/site-lisp/cedet-1.1/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu

;; ecb
(require 'ecb-setting)

;; ecb
(require 'yasnippet-setting)

;; 窗口的一些设置，包括光标、窗口最大化等
(require 'window-setting)

;;git-emacs
(add-to-list 'load-path "~/.emacs.d/site-lisp/git-emacs/")
(require 'git-emacs)

(register-input-method
 "chinese-wbim" "euc-cn" 'chinese-wbim-use-package
 "五笔" "汉字五笔输入法" "wb.txt")
(require 'chinese-wbim)
(setq default-input-method "chinese-wbim") 