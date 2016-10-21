;;=======================ECB2.40配置(start)==========================
(add-to-list 'load-path "~/.emacs.d/site-lisp/ecb-2.40")
(require 'ecb)
(require 'ecb-autoloads)
(setq stack-trace-on-error nil)

;;;; 自动启动ecb，并且不显示每日提示
(setq ecb-auto-activate t

      ecb-tip-of-the-day nil)

;;;; 各窗口间切换
(global-set-key [M-left] 'windmove-left)

(global-set-key [M-right] 'windmove-right)

(global-set-key [M-up] 'windmove-up)

(global-set-key [M-down] 'windmove-down)

;;;; 隐藏和显示ecb窗口
(define-key global-map [(control f1)] 'ecb-hide-ecb-windows)

(define-key global-map [(control f2)] 'ecb-show-ecb-windows)

;;;; 使某一ecb窗口最大化
(define-key global-map "\C-c1" 'ecb-maximize-window-directories)

(define-key global-map "\C-c2" 'ecb-maximize-window-sources)

(define-key global-map "\C-c3" 'ecb-maximize-window-methods)

(define-key global-map "\C-c4" 'ecb-maximize-window-history)

;;;; 恢复原始窗口布局
(define-key global-map "\C-c`" 'ecb-restore-default-window-sizes)

;;; 启动时自动隐藏ecb窗口，自己加的～
(run-with-idle-timer 0.1 nil 'ecb-hide-ecb-windows)
;;=======================ECB2.40配置(end)==========================

;;=======================支持鼠标(start)==========================
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
;;=======================支持鼠标(end)==========================

(global-font-lock-mode 1) ;;就是能高亮了……
(custom-set-variables
 '(ecb-windows-width 0.2) ;;ecb默认占用宽度
 )

(provide 'ecb-setting)
