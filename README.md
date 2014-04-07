junos-pulse
===========

How I got this to work on Mac 10.9.2:

1. use Applescript Editor to compile vpn_reconnect.applescript
  1. cp vpn_reconnect.applescript vpn_reconnect
  2. File -> Duplicate
  3. Compile
  4. File -> Rename
     Save As: vpn_reconnect
     Type: script
  5. Save
2. start Spark  (download from http://www.shadowlab.org/Software/spark.php)
  1. File -> New HotKey -> Applescript
  2. Shortcut: <KEY>
     Name: VPN Reconnect
     File ; Choose ; vpn_reconnect
