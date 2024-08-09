# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

## 0.1.2 - Massive updates

I'm sorry, I stopped generating this changelog updates (and I don't know why). At this update I'll try to list everything that has been added after the last update.

About the cross server, I only tested server/realm communication, still didn't design how servers will interact with each other. It will probably be a TCP P2P communication and the Realm
will be managing the nodes. But don't expect it to be ready already, you can connect multiple servers to the realm and players will interact with each other, but you cannot travel
to another server yet.

### Added

* Modules now have a enum to check if they're loaded or not
* Cross server communication
* Server and realm user transfer
* User data transfer between servers
* Some system updates to work with cross server
* Daily SignIn system

### Fixed

* Some attack and final damage calculations from items

## 0.1.1 - Centralized user auto increment

Since we are implementing cross server, I want the account server to handle all users ID. This way we will make it easier to transfer servers, since the auto increment will be shared through all servers.

### Added

* New tables in order to create user ids on account database
* New packets for cross server communication
* Registration manager
	* This manager is meant to manage how characters are created
	* Game server will now need to be connected to the account server to create new characters
	* Realms will need to be properly configured in order to create new characters

## 0.1.0 - Upgrade to .NET 8

Decided in the middle of the path that I wanted to upgrade (for no real reason). Here we are implementing a little bit of the League system, since we are not running a server and not developing in a feature branch, I will be updating the version now with this incomplete feature.

Must pay attention to some terms: League = Union and Country = Kingdom

### Added

* Login server will now record user location based on IP2Location Lite Database
* Realm Manager implemented with some features
* Start of cross server implementation
* League and Kingdom initial implementation
	* League pledge user
	* League pledge syndicate
	* League user exit
	* League official core position set
	* League list
	* League user syndicate and other list
	* League creation
	* League declaration change
	* League recruitment declaration change
	* League token listing
	* League user loading
	* League and Kingdom correct display

### Changed

* Changed some enum types on `MsgUserAttrib` taken from 5256 MAC reverse to match real names

## 0.0.7 - Lottery

Common lottery implementation. But not happy, I decided that I want to update to version 6268, which is right before Perfection system update. I really hope that it contains good client features (wardrobe is also nice).

### Added

* General action lottery system

## 0.0.6 - Slot machines

I felt I needed to implement this! Now I can play casino with infinite money because I'm a PM and this makes me so happy.

### Added

* Slot machines system

### Changed

* Fate protect rate

### Fixed

* Process Goal Artifact and Refinery processing

## 0.0.5 - Inner Strength

We are adding Inner strength in this update and will do some tests in every system implemented until now. We need to make sure that everything is working fine now because after this we will start adding PvP and skills.

### Added

* Inner Strength Module (NeiGong)
* Solidify function (permanent artifacts and refineries)
* Inner Strength Rank

### Changed

* Process Goal modifications to fit usage, packet may still be bugged?
* New currency commands
* Magic Data compilation error fix

### Removed

* ExpBall processing on item usage, will now process action

## 0.0.4 - Magic functions

In this update we are adding a few magic functions just because I'm tired of the error logs about not implemented functions. And no, skills still cannot be cast.

### Added

* Magic creation
* Monster magic creation
* Few Monster properties
* Magic scripts support added

### Changed

* A few default messages for character creation screen has been updated

## 0.0.3 - Jiang Hu

### Added

* Jiang Hu system

### Changed

* Added more data to item check sum to avoid duplicates
* Added Jiang Hu attributes to user battle data
* Changed Final Damage Addiction and Reduction fields calculation
* Fixed some places where spending CPs would not record expense
* Added new systems to fill MsgPlayer

## 0.0.2 - Chi

### Added

* Fate system
* More currency commands
* MsgAllot packet handle (why it wasn't on 0.0.1 idk)

### Changed

* Ranking module fix to display proper Fate and Flower data
* Flower module fix to save proper ranking

## 0.0.1 - First changelog

It took me some time to start using this, so this first version may have some things missing. I will try to write below what has been implemented but I cannot guarantee much.

### Added

* Initial commit (with Canyon base)
* World Processor
* Movement (Jump and Walk)
* Screen system
* NPC System
* Equipment and inventory system
* Sash system
* Dragon Soul system
* Scripting System (LUA and Action)
* Modules System
	* Sub class module
	* Booth module
	* Competion (Quiz) module
	* Family (Clan) module
	* Flower Module
	* Guide Module
	* Peerage (Nobility) Module
	* Pigeon (Broadcast) Module
	* Rank Module
	* Relation Module (Friend, enemy)
	* Syndicate Module
	* Task Detail Module
	* Team Module
	* Totem Module (Guild Arsenal)
	* Trade Module
* Achievement System
* Activity Task System
* Message Board System
* Process Goal System
* Statistics System
* Weapon Skill System
* Auction System
* Mail System
* Status system
* Game maps system
* Instance game maps system