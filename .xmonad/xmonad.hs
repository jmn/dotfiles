import XMonad
import XMonad.Config.Gnome
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Util.EZConfig (additionalKeys, removeKeysP)
import XMonad.Actions.NoBorders
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
-- import XMonad.Hooks.ManageDocks

import XMonad.Hooks.ManageHelpers
import qualified XMonad.StackSet as W

myFloatManageHook = composeAll
    [ manageHook gnomeConfig
    , className =? "Gimp"      --> doFloat
    , className =? "Pidgin"    --> doFloat
    , className =? "Tilda" --> doFloat
    , className =? "Yakuake" --> doFloat
    , className =? "Nautilus" --> doFloat
    -- Allows focusing other monitors without killing the fullscreen
    , isFullscreen --> (doF W.focusDown <+> doFullFloat)
    ]

myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled   = Tall 1 (3/100) (3/5)
    
main = xmonad $ gnomeConfig
       {
       -- seriously? you want to steal meta?
       modMask = mod4Mask
       -- red border is useless on full-screened windows
       , layoutHook = lessBorders OnlyFloat $ myLayout 
       -- , layoutHook = lessBorders OnlyFloat $ avoidStruts $ myLayout  -- layoutHook via http://stackoverflow.com/a/13515196/41829
                 , borderWidth = 0
                 , normalBorderColor  = "#000000" -- black
                 , focusedBorderColor = "#ff3f3f" -- reddish

       -- trackpoint jitter makes this unusable
       , focusFollowsMouse = False

       -- launching this from xsession doesn't set env correctly
       , startupHook = spawn "killall xbindkeys; xbindkeys"

       -- This ^ Xmonad.Hooks.EwmDesktops (from xmonad-contrib)
       -- For fullscreen chrome
       , handleEventHook = handleEventHook gnomeConfig <+> fullscreenEventHook

       -- Default certain applications to "float" WM handling
       , manageHook = myFloatManageHook  <+> manageHook defaultConfig

       }

       -- gnome's launcher is crappy compared to dmenu
       `additionalKeys` [ ((mod4Mask, xK_r), spawn "dmenu_run") ]

       -- toggle borders for the focused window.
       `additionalKeys` [ ((mod4Mask,  xK_b ), withFocused toggleBorder) ]

       -- let this fall through to xbindkeys
       `removeKeysP` ["M-m"]
