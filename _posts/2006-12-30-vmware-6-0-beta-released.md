---
layout: post
author: detro
published: true
title: "VMWARE 6.0 Beta Released"
tags: [macosx, sw, operating-systems, it, curiosity, english, devtools]
date: "2006-12-30 14:19:24"
updated: "2006-12-30 14:19:24"
permalink: /2006/12/30/vmware-60-beta-released/
---

<img src="http://h18000.www1.hp.com/products/servers/software/vmware/images/vmware-prodshot.gif" alt="VMWARE logo" align="left" width="50"/>
The <a href="http://www.vmware.com">most known Virtualization System</a> is under heavy development, and many interesting features will be in the final version. The most interesting? Integration with the <a href="http://www.eclipse.org">Eclipse IDE</a>.

I have only a doubt: what about <a href="http://www.detronizator.org/2006/12/22/vmware-fusion-beta-released/">Fusion</a>? Will be a different project or it's only the beta name for VMWARE for MacOSX? Will they be merged?

Release Notes on <!--more-->
<blockquote>
<h2>New Support for 32-Bit and 64-Bit Operating Systems</h2>

<p>This release provides experimental support for the following operating systems now in Beta:</p>

<p>
</p><ul> 
<li>32-bit and 64-bit Windows Vista as host and guest operating systems</li>
<li>32-bit and 64-bit Red Hat Enterprise Linux 4.5 (Beta, formerly called 4.0 Update 5) and Red Hat 
Enterprise Linux 5.0 (Beta) as host and guest operating systems</li>
<li>32-bit and 64-bit SUSE Linux Enterprise Server 9 SP4 (Beta) as host and guest operating systems</li>
<li>32-bit and 64-bit Solaris 10 Update 3 as guest operating system</li>
</ul>

<p>This release provides full support for the following operating systems:</p>

<ul>
<li>32-bit and 64-bit Ubuntu Linux 6.10 as host and guest operating systems</li>
<li>32-bit and 64-bit Mandriva Linux 2007 as host and guest operating systems</li>
<li>32-bit Novell Netware 6.5 SP5 as guest operating system</li>
</ul>

<p>
<a name="features"></a>
</p><h2>New Features in This Release</h2>

<p>
</p><ul> 

<li><strong>Multiple Monitor Support</strong> — At the click of a button, the guest can now 
span monitors and also reflect the monitor topology — meaning that applications, task bars, and 
so on inside the guest appear as you would expect them to on a multi-monitor system. You can specify how many 
monitors a virtual machine can detect, regardless of how many monitors are attached to the host. This feature 
is especially useful if you plan to deploy the virtual machine to a different host after you create it. You can also 
specify what screen resolution to use and how much video memory to allocate. </li>

<li><strong>Easy Upgrade or Downgrade of VMware Virtual Machines</strong> — A new Convert Hardware Version wizard 
steps you through the process of upgrading or downgrading virtual machines between Workstation versions 4, 5, and 6.
The  wizard helps you determine which virtual hardware version to use for various VMware products. You have the 
choice of either changing the version of the original virtual machine or creating a full clone.</li>
<li><strong>Automation Via Expanded VIX 2.0 API</strong> — The VIX API (formerly known as the Programming API) 
is now compatible with Workstation 6. This API allows you to write scripts and programs to automate virtual 
machine operations. This release of the API is available in the C language. There are additional language 
bindings for Perl, COM, and shell scripts (<tt>vmrun</tt>).</li> 
<li><strong><!-- Physical-to-Virtual Conversion and  -->Enhanced Import Functionality (Windows Hosts Only)</strong> — 
Included in this release is the Importer wizard from the VMware Converter product. Using the Importer wizard 
enables you to <!-- convert a physical Windows machine into a virtual machine,  -->convert a virtual machine from one 
VMware virtual machine format to another, and convert virtual machines or system images from popular third-party vendors.</li>
<li><strong>Automatic Update to the Latest Version of VMware Tools</strong> — You can now set 
VMware Tools to automatically upgrade itself when the virtual machine is powered on.</li>

<li><strong>Integrated Virtual Debuggers</strong> — With the new Workstation IDE (integrated 
development environment) plug-ins, software developers are provided with menu 
items and toolbar buttons in Visual Studio (Windows only) or Eclipse (Windows 
or Linux) to easily develop and debug programs in virtual machines.</li> 
<li><strong>Appliance View for Virtual Appliances</strong> — Rather than having users see a
console view for an appliance, you can now configure the new appliance view. It gives 
you a brief description of the type of server or appliance and provides a link that opens 
the browser on the guest system and connects to the correct port for the server console.</li>
<li><strong>Run Virtual Machines in the Background</strong> — You can now leave virtual 
machines and teams running in the background when you exit Workstation. On the host, a 
system tray icon indicates how many virtual machines are running in the background. Click 
the icon to open a virtual machine.</li>
<li><strong>Enhanced File Sharing and Copy and Paste Functionality</strong> — You can now use 
shared folders on a Solaris guest. You can copy and paste text and files between Linux and 
Windows hosts and Linus, Windows, and Solaris guests.</li>
<li><strong>Cross-Platform Drag-and-Drop Functionality</strong> — You can now drag and drop files 
and directories from a Linux or Windows host to a Linux, Solaris, or Windows guest, and vice versa.</li>

<li><strong>Virtual Machines Can Act as VNC Servers</strong> — You can set a virtual machine 
to act as a VNC server without having to install any specialized VNC software in the 
guest. </li>
<li><strong>New Online Help System for Workstation</strong> — The help system includes full-text search, bookmarking ability, index, and table of contents.
Note that for this beta release, you need an Internet connection to use the help system. </li>
<li><strong>Battery Information Is Now Reported in the Guest</strong> — If you use a laptop to 
run a guest in full screen mode, you will now be able to see status information about the 
host's battery. </li>
<li><strong>Increased RAM Support</strong> — The previous limit of 4GB total RAM that could be 
used for all virtual machines combined has been removed. The amount of memory used 
by all virtual machines combined is now limited only by the amount of the host 
computer’s RAM and page file size. The maximum amount of memory that can be allocated per virtual 
machine has been raised from 3.6GB to 8GB.</li>
<li><strong>Support for Paravirtualized Linux Kernels</strong> — If you have a VMware VMI 
(Virtual Machine Interface) 3.0 enabled kernel in a Linux guest operating system, you can now 
enable paravirtual support in the virtual machine.</li>

<li><strong>User Interface for Mapping a Virtual Disk to a Drive Letter on the Windows Host</strong></li>
<li><strong>Support for High-Speed USB 2.0 Devices</strong></li>
<li><strong>Improved 64-bit Guest Support</strong> — Intel EM64T VT-capable processors are now 
fully supported.</li>
<li><strong>New 64-bit Sound Driver</strong></li>
<li><strong>VMware Player 2.0</strong> — The new Player Welcome page  
gives you the option of browsing to a virtual machine file or downloading a virtual 
appliance from the VMTN (VMware Technology Network) web site. You can then use 
Player’s new appliance view when running a virtual appliance.</li>
<li><strong>Player Extensions Framework</strong> — A new development framework enables you 
to create new controls in VMware Player. You can embed custom toolbar and menu items in the 
Player chrome, thereby enhancing the end user’s Player experience.</li>
</ul></blockquote>

Other useful information, on the <a href="http://www.vmware.com/products/beta/ws/releasenotes_ws60_beta.html">official release notes page</a>.
Source, <a href="http://www.downloadblog.it/post/3074/vmware-60-beta">Downloadblog</a>.
