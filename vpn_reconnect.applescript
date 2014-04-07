#! /usr/bin/osascript
-- vpn_reconnect will (re)connect to the vpn using the Junos Pulse application
-- Before this will work you will need to store the vpn password in the keyring
-- e.g. security add-internet-password -s tardis.tumblrhq.com -a 'Junos Pulse' -w SECRETE
-- or use the Keychain Access application
--
-- You might want to bind this to a shortcut key.  I find
-- http://www.shadowlab.org/Software/spark.php to is the easiest way to do this.
--
-- Author: Roy Marantz <marantz@tumblr.com>

set myUser to system attribute "USER"
set myPassword to do shell script "security find-internet-password -s tardis.tumblrhq.com -a 'Junos Pulse' -w"

set appname to "Junos Pulse"
set dialogappname to "PulseTray"
set dialogname to "Tumblr VPN (tardis.tumblrhq.com)"

tell application appname
  activate
end tell

tell application "System Events"
  if not (exists window dialogname of application process dialogappname) then
    -- the password dialog isn't around, cleanup and open it
    tell process appname
      tell menu "File" of menu bar item "File" of menu bar 1
        tell menu "Connections" of menu item "Connections"
          if (exists menu item "Cancel") then
            tell me to say "Would have canceled"
            delay 1
          end if
          if (exists menu item "Disconnect") then
            tell me to display notification "Disconnecting VPN connection"
            click menu item "Disconnect"
            --tell me to say "Would have disconnected"
            delay 1
          end if
          repeat until exists menu item "Connect"
            tell me to display notification "Waiting for connection to close"
            delay 10
          end repeat
          
          click menu item "Connect"
          delay 2 -- wait for the window to popup
        end tell
      end tell
    end tell
  end if
  -- not eht password dialog is opened, fill in the static stuff
  tell window dialogname of application process dialogappname
    tell sheet 1
      set value of text field 1 to myUser
      -- Connect button doesn't go live till something is really typed!
      set focused of text field 2 to true
      tell text field 2
        keystroke myPassword
      end tell
      click button "Connect"
    end tell
  end tell
end tell
-- at this point you should have the secondary password dialog waiting

-- return so there is no value being printed out
return
