---
layout: post
author: detro
published: true
title: "Mac OS X 10.4.7 Update released"
tags: [macosx, apple, it, english]
date: "2006-06-28 12:14:50"
updated: "2006-06-28 12:14:50"
permalink: /2006/06/28/mac-os-x-1047-update-released/
---

<img src="http://www.regione.emilia-romagna.it/sin_info/clipstream/java_ist_MAC_file/RitaglioMAC_0001.jpg" alt="update" width="100" align="right" />
Mac OS X 10.4.7 Update was released yesterday night: various improvements and few little new features.

You can find informations about it, <a href="http://docs.info.apple.com/article.html?artnum=303771">here</a>.

A little extract, follows.

<!--more-->
<blockquote>
<strong>Mail</strong>

    * Updates Help links within Mail alert messages so you are linked to useful content instead of a "No pages with your search words were found" page.
    * Resolves a sync alert issue that could appear if Mail accounts were in different order on the different Macs that you were syncing.
    * The Mail POP account option to "Remove copy from server after retrieving a message..." is no longer turned off after performing a sync with .Mac.
    * POP accounts you create will no longer begin with the "Remove copy from server after retrieving a message..." preference setting turned off.
    * Redirecting message to only a BCC: address no longer redirects the message to the original To: recipients as well.
    * Improves results when retrieving IMAP messages with attachments over unreliable connections.
    * Mail now supports connecting to mail servers through a SOCKS proxy.

<strong>iChat</strong>

    * Improves compatibility for iChat when using a video input source that's connected to a third-party video card.
    * Improves reliability when transferring files to or from AIM account users via iChat.
    * Addresses an issue on PowerPC-based Macs that prevented video conferencing when not enough shared memory was available.
    * Addresses potential causes of "insufficient bandwidth" alerts in iChat.
    * If a conference doesn't start as expected, iChat will now offer to send a report to Apple for investigation. 

<strong>Syncing</strong>

    * Improves support for Motorola cell phones that sync via iSync and Bluetooth
    * Addresses issues that could cause iDisk syncing to fail without alerting you or with a "Last sync failed" alert.
    * iDisk syncs in progress are now more responsive to cancel requests.
    * Shortens the time for cancellation of an iPod contact-and-calendar sync, if cancellation requested shortly after sync.
    * Improves certain .Mac connection failure alerts that included misleading error messages.
    * Resolves an issue in which the initial .Mac sync would fail if all data classes were selected to be synced (but future syncs would succeed).
    * Addresses a number of issues related to .Mac syncing of tasks, bookmarks, and contacts.
    * Addresses an issue for Mac OS X 10.4.6 in which you might not be able to sync via iSync 2.2 with Sony Ericsson k700i or S700i phones.

<strong>Finder and Apple applications</strong>

    * Manually removing unwanted fonts from /System/Library/Fonts/ will no longer potentially cause Finder to unexpectedly quit.
    * TextEdit will no longer unexpectedly quit if Helvetica fonts have been disabled in Font Book.
    * You can now create compressed disk images larger than 60 GB.
    * In iCal, a "Print Error while printing" alert message will no longer appear when creating a PDF with one of these options: Compress PDF, Encrypt PDF, Mail PDF, Save As PDF-X, Save PDF to iPhoto, or Save PDF to Web Receipts.
    * Addresses issues that might prevent Sudden Motion Sensor information from appearing in System Profiler or other utilities.
    * Addresses an issue in which some PDF files could be shifted to the right when printed from Safari.
    * Resolves an issue in which, under certain circumstances in the Japanese language version of Mac OS X 10.4, the Add Bookmark command may not work in Safari.
    * Addresses an issue in which Aperture 1.1 could unexpectedly quit while using full-screen mode.
    * Improves reliability when rebuilding a problematic RAID 1 (mirror) set in Disk Utility.
    * Disk Utility will no longer report unexpected messages after Adobe Illustrator CS2 or Photoshop CS2 are installed.
    * Resolves an issue in which an error message might appear when attempting to print a document using the "Save PDF to iPhoto" option.
    * Automator supports more file types, including JPEG, TIFF, and HTML, in the Filter Finder Items action.
    * Automator supports more websites that require cookies and sessions, specifically those where the authentication is passed along with the URLs, in the Get Image URLs for Webpage, and Get Link URLs from Webpages actions.
    * Improves responsiveness when dragging Automator actions in the workflow.
    * Resolves an issue in which Soundtrack Pro may unexpectedly quit on PowerPC-based Macs after you analyze an audio file in the Waveform Editor by selecting Clicks and Pops.
    * If you press the Kana key twice in a row while using the Kotoeri input method, the Finder and applications will no longer unexpectedly quit on Intel-based Macs.
    * Addresses an issue in which iTunes, the Finder, or other applications could unexpectedly quit under certain circumstances while using Kotoeri input.

<strong>Third-party</strong>

    * Adds support for Sierra wireless cards AirCard 580 (AC580), PC5220, and for the Novatel V620, S620, and U730 wireless cards for PowerBook computers.
    * Improves compatibility for Adobe Photoshop CS2 by preventing menu items being highlighted if the cursor was in an image's zoom field.
    * Improves compatibility for Microsoft Virtual PC—the installer application will no longer unexpectedly quit when performing an uninstallation.
    * Prevents certain Adobe and Quark applications from unexpectedly quitting when saving a file to a non-Apple AFP server.

<strong>Networking and Xsan</strong>

    * Addresses an issue that could cause files to be deleted when duplicating them in the Finder on a mounted AFP volume.
    * Addresses an issue that could cause the error "Bad file descriptor" when using the cp command to copy a file to an AFP volume.
    * Mac OS X 10.4 computers now respond to Layer 2 Multicast ARPs.
    * Addresses an issue in which the configd process could take excessive CPU resources when a DHCP server sent a malformed DHCP response.
    * The included Apple VPN client now supports group membership on Cisco VPN servers.
    * Improves reliability of the lsof command on systems with a large amount of RAM installed.
    * Resolves an issue that could cause Xsan clients to stop responding when accessing the SAN if an Xsan peer was rebooted.
    * Increases the maximum number of vnodes on systems with 2 GB or more RAM to avoid an issue that could cause Xsan clients to become unresponsive when the vnode table became full.
    * Resolves an issue using "Save As..." from certain Adobe applications to an Xsan volume reshared via AFP.
    * The cp, mv and tar commands now pre-allocate space on Xsan volumes to avoid file fragmentation.
    * Safari will no longer intermittently, unexpectedly quit if you use PAC (Proxy Auto Configuration) files.
    * Addresses an issue in which Apple Remote Desktop clients could stop updating the admin's control screen.

<strong>Other</strong>

    * Resolves an issue for Mac OS X 10.4.6 and PowerPC-based Macs in which some applications may silently fail to open, or you could see "error: can't fragload" when trying to open an application.
    * Addresses an issue in which HTML files on a downloaded disk image might not be readable, and a "Safari cant find the file. No file exists at the address /private/tmp/..." alert appears, after Safari mounts the downloaded image.
    * Resolves an issue that prevented users with Active Directory accounts from logging in if "Use UNC path from Active Directory" was enabled.
    * Resolves an issue in which Intel-based Macs could not bind to Active Directory when multiple domain controllers are available.
    * Adds RAW image support for these cameras: Olympus C7070, Olympus E330, Olympus E500, Minolta Dynax 5D, Minolta Maxxum 5D, and Pentax *ist DL.
    * Addresses an issue that prevented the Apple USB Modem from receiving faxes on some computers.
    * You can now verify whether or not a Dashboard widget you downloaded is the same version as a widget featured on (www.apple.com) before installing it.
    * Includes recent Apple security updates.
</blockquote>
