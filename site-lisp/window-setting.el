;; show time
;;启用时间显示设置，在minibuffer上面的那个杠上
(display-time-mode 1)
;;时间使用24小时制
(setq display-time-24hr-format t)
;;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
;;时间的变化频率
(setq display-time-interval 10)
;;显示时间的格式
(setq display-time-format "%Y-%m-%d %A %H:%M")

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

;; 隐藏工具栏
(tool-bar-mode 0)

;; 设置开启的时候不显示欢迎界面
;;(setq inhibit-startup-message t)

;;关闭其它窗口
;;(delete-other-windows)
;;(run-with-idle-timer 0.2 nil 'delete-other-windows)

;;开机自动显示日程表
;;(org-agenda-list t)
;;(run-with-idle-timer 0.3 nil 'org-agenda-list)

;; 取消文件备份
(setq make-backup-files nil)
;; 或者 all backups goto ~/.backups instead in the current directory
;;(setq backup-directory-alist (quote (("." . "~/.backups"))))


;; 在 emacs 默认设置中，要想删除整行，需要先 C-a 跳到行首，然后使用 C-k 来删除整行，有些不方便。
;; 通过如下配置，可以使用 C-w 来删除整行（操作时不用事先选中整行），同时不影响原有的剪切功能。M-w 也可以在不事先选中整行的情况下复制整行。
 (defadvice kill-ring-save (before slickcopy activate compile)  
   (interactive  
    (if mark-active (list (region-beginning) (region-end))  
      (list (line-beginning-position)  
            (line-beginning-position 2)))))  
 (defadvice kill-region (before slickcut activate compile)  
   (interactive  
    (if mark-active (list (region-beginning) (region-end))  
      (list (line-beginning-position)  
            (line-beginning-position 2)))))


;; 我觉得这个很有用，特别是需要一边写代码一边看参照其他文档时。按 F11 键可以一键切换透明度，非常方便：
;; set transparent effect
(global-set-key [(f11)] 'loop-alpha)
(setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))                ;; head value will set to
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
)

;; Emacs 的默认设置中，M-; 可以起到注释的作用，但是有不方便的地方：必须在选中一部分区域后才能进行注释。
;; 通过如下配置，可以达到以下效果：当光标位于行尾时，M-; 在行尾进行注释；
;; 当光标位于其他位置时，M-; 起到注释该行的作用；当选中一部分区域时，M-; 起到注释该区域的作用。
(defun qiang-comment-dwim-line (&optional arg)
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line)



(provide 'window-setting)
