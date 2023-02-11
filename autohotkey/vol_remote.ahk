;; custom keys for logitech wireless RF presenter remote

; right arrow - increase volume
;*PgDn::Send {vkAFsc130}
*PgDn::Send {Volume_Up}
*Down::Send {Volume_Up}
 
; left arrow - decrease volume
;PgUp::Send {vkAEsc12E}
*PgUp::Send {Volume_Down 1}
*Up::Send {Volume_Down 1}

*.::Send {Media_Play_Pause}

*F5::Send {Volume_Mute}
*Escape::Send {Volume_Mute}

;;; Home use only, wanting to skip songs ;;;
;*Volume_Down::Send {Media_Prev}
;*Volume_Up::Send {Media_Next}