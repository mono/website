---
layout: obsolete
title: "MonoTorrent"
lastmodified: '2009-09-30'
permalink: /old_site/MonoTorrent/
redirect_from:
  - /MonoTorrent/
  - /Bitsharp/
---

MonoTorrent
===========

Some of the information here is out of date. For up to date information and samples please check at [http://www.monotorrent.com](http://www.monotorrent.com).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#about-monotorrent">1 About MonoTorrent</a>
<ul>
<li><a href="#licensing">1.1 Licensing</a></li>
<li><a href="#source-code-and-binaries">1.2 Source Code and Binaries</a></li>
<li><a href="#uis">1.3 UIs</a></li>
</ul></li>
<li><a href="#client-library">2 Client Library</a>
<ul>
<li><a href="#features">2.1 Features</a></li>
<li><a href="#sample-code">2.2 Sample Code</a></li>
</ul></li>
<li><a href="#tracker-library">3 Tracker Library</a>
<ul>
<li><a href="#features_2">3.1 Features</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

About MonoTorrent
-----------------

MonoTorrent is the product of Googles Summer of Code 2006. It is a complete BitTorrent suite of libraries which can be embedded in an application. The suite contains:

1.  **Client Library** - Allows the uploading/downloading of torrents.
2.  **Tracker Library** - Allows the hosting of .torrents.
3.  **Torrent Creator** - Allows the creation and editing of .torrent files.

All of these libraries were written with Mono in mind. As a result these libraries will function on any operating system that supports either the Microsoft .NET Framework or Mono Framework, be it Windows, Linux, MacOs or other.

#### Licensing

All the modules in MonoTorrent are licensed under the MIT/X11 license, so anyone is free to use them as they will. Hopefully anyone who decides to use a library in an application would send an email in to get their application named in the Products Using MonoTorrent section.

#### Source Code and Binaries

The sourcecode for MonoTorrent is located in the mono SVN. It is available via annoymous SVN at this location: [http://anonsvn.mono-project.com/viewvc/trunk/bitsharp/](http://anonsvn.mono-project.com/viewvc/trunk/bitsharp/)

Currently there are no precompiled binaries hosted anywhere.

#### UIs

There is a curses based UI, in module [MonoCurses]({{site.github.url}}/old_site/MonoCurses "MonoCurses") and a Windows.Forms UI in [http://code.google.com/p/monotorrent](http://code.google.com/p/monotorrent).

Client Library
--------------

The client library contains all the functionality to create a BitTorrent client, or embed BitTorrent functionality in an application (e.g. an automatic update module).

#### Features

1.  Compact and Non-Compact tracker responses supported
2.  Multi-Tracker support
3.  Scrape and Multi-Scrape support
4.  Supports Fast Peers Extensions
5.  Supports upload and download speed limiting on per-torrent and a global basis
6.  Multiple simultaneous downloads
7.  Quick Resume
8.  Selective File Downloading
9.  File Prioritisation
10. Manual Announce
11. Only uses one port for all communications
12. Can set default download directory
13. Supports connection encryption

#### Sample Code

``` csharp
public void Main()
        {
            // An ITorrentManager is passed out of the engine when you load a torrent. This is
            // used for controlling the torrent.
            ITorrentManager torrentManager;
 
            // These are the default settings for the engine for this session
            EngineSettings engineSettings = EngineSettings.DefaultSettings;
 
            // The default location to download files to on your HardDrive, like a downloads folder
            // All files will be downloaded using this as the base directory. Single file torrents will
            // go directly into this directory, multifile torrents will create a directory within this
            // and download there.
            engineSettings.DefaultSavePath = @"D:\Downloads\Torrents";
 
            // Maximum upload speed of 30 kB/sec. At upload speeds of less than 5kB/sec, there will
            // be automatic download speed limiting to 5x the selected upload.
            engineSettings.GlobalMaxUploadSpeed = 30;
 
            // Every torrent loaded into the engine for this session will start off with these default settings
            // unless other settings are specified.
            TorrentSettings torrentSettings = TorrentSettings.DefaultSettings;
 
            // Each torrent will be allowed a max of 10kB/sec upload speed
            torrentSettings.MaxUploadSpeed = 10;
 
            // Each torrent will have 4 upload slots to allow 2.5kB/sec per slot.
            torrentSettings.UploadSlots = 4;
 
            // Instantiate a new engine with the engineSettings and Default Torrent settings.
            ClientEngine engine = new ClientEngine(engineSettings, torrentSettings);
 
            // A torrent can be downloaded from the specified url, saved to the specified file and
            // then loaded into the engine.
            // torrentManager =engine.LoadTorrent(new Uri("http://example.com/example.torrent"), @"D:\Downloads\example.torrent");
 
            // Alternatively a .torrent can just be loaded from the disk. This torrent will save
            // to the DefaultSaveLocation as specified in the EngineSettings and will inherit the
            // default settings that are set in the Engine.
            //torrentManager = engine.LoadTorrent(@"D:\Downloads\Torrents\MyTorrentFile.torrent");
 
            // This torrent would use the supplied settings instead of using the ones that were
            // supplied when instantiating the engine
            torrentManager = engine.LoadTorrent(@"D:\Downloads\Torrents\MyTorrentFile.torrent", TorrentSettings.DefaultSettings);
 
            // If you have loaded multiple torrents into the engine, you can start them all at once with this:
            // engine.Start();
 
            // Or you can start one specific torrent by passing in that torrents ITorrentManager
            engine.Start(torrentManager);
 
            // You can hook into various events in order to display information on screen:
            // Fired every time a peer is added through DHT, PEX or Tracker Updates
            torrentManager.OnPeersAdded+=new EventHandler<PeersAddedEventArgs>(PeersAdded);
 
            // Fired every time a piece is hashed
            torrentManager.OnPieceHashed+=new EventHandler<PieceHashedEventArgs>(PieceHashed);
 
            // Fired every time the torrent State changes (i.e. paused/hashing/downloading)
            torrentManager.OnTorrentStateChanged+= new EventHandler<TorrentStateChangedEventArgs>(torrentStateChanged);
 
            // Fired every time a piece changes. i.e. block sent/received/written to disk
            torrentManager.PieceManager.OnPieceChanged+=new EventHandler<PieceEventArgs>(pieceStateChanged);
 
            // Fired every time a connection is either created or destroyed
            ClientEngine.connectionManager.OnPeerConnectionChanged+=new EventHandler<PeerConnectionEventArgs>(peerConnectionChanged);
 
            // Fired every time a peer message is sent
            ClientEngine.connectionManager.OnPeerMessages+= new EventHandler<PeerMessageEventArgs>(peerMessageSentOrRecieved);
 
            // Keep running while the torrent isn't stopped or paused.
            while (torrentManager.State != TorrentState.Stopped && torrentManager.State != TorrentState.Paused)
            {
                Console.WriteLine(torrentManager.Progress());
                System.Threading.Thread.Sleep(1000);
 
                if (torrentManager.Progress() == 100.0)
                {
                    // If we want to stop a torrent, or the engine for whatever reason, we call engine.Stop()
                    // A tracker update *must* be performed before the engine is shut down, so you must
                    // wait for the waithandle to become signaled before continuing with the complete
                    // shutdown of your client. Otherwise stats will not get reported correctly.
                    WaitHandle[] handles = engine.Stop();
                    WaitHandle.WaitAll(handles);
                    return;
                }
            }
        }
```

Tracker Library
---------------

The client library contains all the functionality to host a BitTorrent Tracker, or embed Tracker functionality in an application.

#### Features

?????

