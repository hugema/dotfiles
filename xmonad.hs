import XMonad
import XMonad.Config.Azerty
import Data.Monoid
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Util.EZConfig

myBorderWidth   = 0
defModMask = mod1Mask

-- Workspaces
myworkspaces :: [WorkspaceId]
myworkspaces = map show [1 .. 9 :: Int] 

main :: IO ()
main = xmonad $ azertyConfig {
            borderWidth        = myBorderWidth,
            workspaces         = myworkspaces
    } 
    `removeMouseBindings`
      [ (defModMask, button1), (defModMask, button2) ]
    `additionalKeys`
       [ ((mod1Mask, xK_a        ), spawn "mocp")
       , ((mod1Mask, xK_e        ), spawn "uxterm")
       , ((mod1Mask, xK_f        ), spawn "chromium")
       , ((mod1Mask, xK_g        ), spawn "gimp")
       , ((mod1Mask, xK_l        ), spawn "libreoffice")
       , ((mod1Mask, xK_n        ), spawn "gnumeric")
       , ((mod1Mask, xK_r        ), spawn "evince")
       , ((mod1Mask, xK_v        ), spawn "geeqie")
       ]
