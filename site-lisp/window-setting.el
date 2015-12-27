;; show time
(display-time-mode 1)  
(setq display-time-24hr-format t)  
(setq display-time-day-and-date t)

;; 在标题栏提示你目前在什么位置
(setq frame-title-format "%b")

;; 设置字体
;;  方法为: emacs->options->Set Default Font->"M-x describe-font"查看当前使用的字体名称、字体大小
;;(set-default-font " -bitstream-Courier 10 Pitch-normal-normal-normal-*-19-*-*-*-m-0-iso10646-1")

;; 显示列号
(setq column-number-mode t)
(setq line-number-mode t)
(global-linum-mode t)

;; 光标
(setq-default cursor-type 'bar)

(provide 'window-setting)


;; 最大化
(defun my-maximized ()
(interactive)
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
(x-send-client-message
nil 0 nil "_NET_WM_STATE" 32
'(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
)
;; 启动emacs时窗口最大化
(my-maximized)

;; 启动窗口大小
;;(setq default-frame-alist
;;      '((height . 35) (width . 125) (menu-bar-lines . 20) (tool-bar-lines . 0))) 
;;(put 'upcase-region 'disabled nil)

;;(require 'package)
;;(add-to-list 'package-archives'
;;  ("elpa" . "http://tromey.com/elpa/") t)
;;(add-to-list 'package-archives'
;;  ("marmalade" . "http://marmalade-repo.org/packages/") t)
;;(add-to-list 'package-archives'
;;  ("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(package-initialize)
