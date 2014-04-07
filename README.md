junos-pulse
===========

How I got this to work on Mac 10.9.2:

1. use Applescript Editor to compile vpn_reconnect.applescript
  a. cp vpn_reconnect.applescript vpn_reconnect
  b. File -> Duplicate
  c. Compile
  d. File -> Rename
     Save As: vpn_reconnect
     Type: script
  e. Save
2. start Spark  (download from http://www.shadowlab.org/Software/spark.php)
  a. File -> New HotKey -> Applescript
  b. Shortcut: <KEY>
     Name: VPN Reconnect
     File ; Choose ; vpn_reconnect
