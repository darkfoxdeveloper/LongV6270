# Long (龙)

This project is a fork from [__Comet__](https://gitlab.com/spirited/comet) and all rights over Comet are reserved by Gareth Jensen "Spirited".

It is also a reimagination of [__Canyon__](https://gitlab.com/world-conquer-online/canyon/canyon) which may be a good thing (or not).

The project is split between three servers: an account server, game server and ai server. The account server authenticates players, while the game server services players in the game world and the ai server handles ai over the NPCs in the world. This simple three-server architecture acts as a good introduction into server programming and concurrency patterns. The server is interoperable with the Conquer Online game client, but a modified client will not be provided.

This still a work in progress and is not recommended to starters. No support will be given to creating events, NPCs or anything like that. But if you want to work with Canyon you may report bugs and we will keep the main repository updated with bug fixes to whoever wants to try it.

When the live server leaves the Beta Stage, we will start keeping stable versions of Canyon in the [__main__](https://gitlab.com/world-conquer-online/canyon/long/-/tree/main) main repository, if you download from [__development__](https://gitlab.com/world-conquer-online/canyon/long/-/tree/development) make sure you know what you are doing and that you are ready to face bugs.

| Patch | Pipeline Status | Quality Gate | Description |
| ----- | --------------- | ------------ | ----------- |
| [__development__](https://gitlab.com/world-conquer-online/canyon/long/-/tree/develop) | [![pipeline status](https://gitlab.com/world-conquer-online/canyon/long/badges/develop/pipeline.svg)](https://gitlab.com/world-conquer-online/canyon/long/-/commits/development) | [![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=world-conquer-online_long&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=world-conquer-online_long) | Targets the official 6270 client. |
| [__main__](https://gitlab.com/world-conquer-online/canyon/long/-/tree/main) | [![pipeline status](https://gitlab.com/world-conquer-online/canyon/long/badges/main/pipeline.svg)](https://gitlab.com/world-conquer-online/canyon/long/-/commits/main) | Not published | Targets the official 6270 client. |

## Guide for easy setup
1- Build all solution (not only gameserver and accountserver)

2- Copy lua folder from solution root

3- In table account_cq.realm of the database mysql change the ip and user, password etc

4- Change database configuration in bin folder (json files like Config.Game.json and Config.Login.json)

5- Copy folder map/map and map/Scenes from client to Bin folder of Solution

## Client download
Download preconfigurated client from here:
[__client__](https://mega.nz/file/xExUFQ5K#UzSTpyfbCazeQtxF8vpfv__E0kvAVLC-hq5_Isu6BXA)

## TODO
- Reborn system (Incomplete)
- Battle system (First touch attack maybe not are working good or are a problem if have difference in Dodge or similar)
- Nobility have some issues, in new characters not showing icon
- Some problems when user login and other player have it on screen, in some cases not loading ok
- OfflineTG (Incomplete, not working)
- Prestige System
- Hero System (Not fully because need some more data in database but working for first 4 goals)
- Daily Quests (Incomplete)
- Daily Signin (Tab in Reward) (Incomplete)
- Activeness (Tab in Reward)
- Events (Tab in Reward) (Incomplete)
- Poker
- Bulletin (I think are not implemented but need see if have some parts coded)
- Perfection
- Some npcs missing (like some npcs for quest of tower and fan)
- Arenas
- House Furnitures (Incomplete, with missing actions i think are all ok)
- Titles (Not from Wardrobe, that are fine)
- Mesh not changing when using Skill for transform to Assasin
- Rascagruta not have mobs and portals are wrong, not have npcs for the quests
- Await mode in Player when are innactive
- Lottery are removing SmallLotteryTicket if you exced tries (Low priority)
- DiceKing in market not working (Low priority)


## Getting Started

Before setting up the project, download and install the following:

* [.NET 7](https://dotnet.microsoft.com/download) - Primary language compiler
* [MariaDB](https://mariadb.org/) - Recommended flavor of MySQL for project databases 
* [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) - Recommended SQL editor and database importer
* [Visual Studio Code](https://code.visualstudio.com/) - Recommended editor for modifying and building project files

In a terminal, run the following commands to build the project (or build with Shift+Ctrl+B):

```
dotnet restore
dotnet build
```

This project has been tested already with Debian and will work well in other environments.

## Login Settings

Nothing for now. I'll fill this information when I feel that I have to.

## Game Settings

Base example of a default Game Setting file layout.

```json
{
  "CooperatorMode": false,
  "Game": {
    "Id": "94390aa0-c75d-11ed-9586-0050560401e2",
    "Name": "Comet",
    "IPAddress": "0.0.0.0",
    "Port": 5816,
    "MaxOnlinePlayers": 1500,
    "Username": "yD3Ni6tMW1NNU1QH",
    "Password": "jETqqIKi9LuFvOgu",
    "ReleaseDate": null,
    "Processors": 4,
    "Listener": {
      "RecvProcessors": 1,
      "SendProcessors": 1
    }
  },
  "Database": {
    "Hostname": "localhost",
    "Username": "root",
    "Password": "1234",
    "Schema": "cq",
    "Port": 3306
  },
  "Login": {
    "IPAddress": "127.0.0.1",
    "Port": 9865,
    "Encryption": {
      "Key": "M6gkSkSNXMZeyIwNc7YBUj42wuyh686pYmAK5Vg9L30=",
      "EncryptIV": "dGZIN8XB4o4QgNJ5YXc1Sw==",
      "DecryptIV": "K7wCbVKECO1noApl1laftA=="
    }
  },
  "Modules": [
    "Pigeon",
    "Guide",
    "Peerage",
    "Flower",
    "Rank",
    "Competion",
    "Family",
    "TaskDetail",
    "Totem",
    "Syndicate",
    "Trade",
    "Booth",
    "Relation",
    "Team",
    "AstProf",
    "Fate",
    "JiangHu",
    "NeiGong"
  ]
}
```

### Object description

| Field | Type | Description | Default |
| ----- | ---- | ----------- | ------- |
| CooperatorMode | boolean | `true` if the server will just allow cooperators account to login |
| Modules | String[] | Name of the modules to be loaded in the application. The order may taken into consideration since it will alter the initialization process. Just follow the order that is defined by default and everything will be OK, if you need to remove or re-add something, just check the order in the original file. |  |

### Game Object

| Field | Type | Description | Default |
| ----- | ---- | ----------- | ------- |
| Id | UUID | The ID of the server registered in `realm` table. |  |
| Name | String | The Name of the server registered in `realm` table. |  |
| IPAddress | String | IP Address of the device which will listen for connections. Default: `0.0.0.0` for any device. |  |
| Port | Integer | Game server port. Must be the same of `GamePort` on `realm` table. | `5816` |
| MaxOnlinePlayers | Integer | Max number of players that the server will accept. |  |
| Username | String | Username to authenticate with the account server. Plaintext. |  |
| Password | String | Password to authenticate with the account server. Plaintext. |  |
| ReleaseDate | DateTime? | If set, server will accept connections only after this date. | `null` |
| Processors | Integer | Number of Map Processors. Minimum value is `3` and maxímum is the amount of CPUs. | `4` |
| Listener.RecvProcessors | Integer | Number of processors that will receive network data. | `1` |
| Listener.SendProcessors | Integer | Number of processors that will send network data. | `1` |

### Database Object

| Field | Type | Description | Default |
| ----- | ---- | ----------- | ------- |
| Hostname | String | MySQL hostname or IPAddress | `localhost` |
| Username | String | MySQL Username | `root` |
| Password | String | MySQL Password | `1234` |
| Schema | String | MySQL Schame/Database | `cq` |
| Port | Integer | MySQL Port | `3306` |

### Login Object

| Field | Type | Description | Default |
| ----- | ---- | ----------- | ------- |
| IPAddress | String | The IP Address of the account server location. | `localhost` |
| Port | Integer | The port to connect into the account server. | `9865` |
| Encryption.Key | byte[] | Base64 Encode of 32 bytes used for en/decryption between servers. |  |
| Encryption.EncryptIV | byte[] | Base64 Encode of 16 bytes used for en/decryption between servers. |  |
| Encryption.DecryptIV | byte[] | Base64 Encode of 16 bytes used for en/decryption between servers. |  |

## Usage of internal IP Addresses

If you can set up your server with VPN or a host company with a local network, make sure to protect your sockets.

| Usage | Listen IP | Description |
| ----- | --------- | ----------- |
| I don't know what you talking about or my servers do not communicate internally. | 0.0.0.0 | Socket will be bound on all network devices. Any machine in the internet will be able to connect to the server. |
| My servers are all on the same machine | 127.0.0.1 | Socket will be bound on loopback device. Only connections made from the loopback device will be received. |
| My servers are on the same network or inside of a VPN | Internal router IP | Socket will be bound on that IP Address and only connections coming to that IP Address will be accepted. Example: `192.168.0.10` |
| I don't want local machines to connect | External machine IP | Not recommended |

## Common Questions & Answers

### Why my servers do not connect to each other?

Make sure the keys Encryption keys are the same on both sides. They are a byte array base64 encoded and must be the same to Login and Game Server, and also Game Server and AI Server (They do not need to be the same to all 3, but the same between the connected servers).

### Why can't I connect to the server?

There are a few reasons why you might not be able to connect. First, check that you can connect locally using a loopback adapter. If you can connect locally, but cannot connect externally, then check your firewall settings and port forwarding settings. If you can connect to the Account server but not the Game server, then check your IP address and port in the `realm` table. Confirm that your firewall allows the port, and that port forwarding is also set up for the Game server (and not just the Account server).

### How to disable module systems?

If the system you want to disable is a module, just remove the module from `Config.Game.json` and it will not load.

## Legality

Algorithms and packet structuring used by this project for interoperability with the Conquer Online game client is a result of reverse engineering. By Sec. 103(f) of the DMCA (17 U.S.C. § 1201 (f)), legal possession of the Conquer Online client is permitted for this purpose, including circumvention of client protection necessary for archiving interoperability (though the client will not be provided for this purpose). Comet is a non-profit, academic project and not associated with TQ Digital Entertainment. All rights over Comet are reserved by Gareth Jensen "Spirited". All rights over the game client are reserved by TQ Digital Entertainment.
