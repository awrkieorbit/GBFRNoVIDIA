# GBFRNoVIDIA
A script to fix a NVIDIA related issue with Granblue Fantasy: Relink

THIS COULD STOP NVIDIA OVERLAY AND CAPTURE PROGRAMS FROM LAUNCHING AT START; PROCEED WITH CAUTION!!

This was the culmination of 3 months of (unnecessary) troubleshooting of a friends GBFR crash issue. It worked for him, but there's better options (NVIDIA Profile Inspector https://github.com/Orbmu2k/nvidiaProfileInspector/releases)

Just open powershell, make sure you have scripts enabled
`Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`
^ This allows scripts to run on machines with global script restrictions. DO THIS INSTEAD OF CHANGING YOUR GLOBAL RESTRICTIONS.

Then `cd` to the directory the script is in, and run `./GBFRNoVIDIA.ps1`.

Enjoy playing GBFR (if this works)!
