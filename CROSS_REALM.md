# Cross realm [Theory]

Here we will brainstorm a little bit about how I imagine the cross realm working (targeted to Conquer). This still a theory and when finished and done this will contain the set-up instructions for cross realms.

## Database dependency

First of all we will need to add a new field to `realm` table on account database. The field `server_id` will serve as reference to game servers `cq_client_config` table.

We could only change the type of the field `id` on the `cq_client_config` table, but I want to keep the official table structures (except for those binary fields which we changed back to varchar).

## Account Server

The account server will be the center of our operation, since all servers are connected to it and this is the responsible for authorizating everything, he will take care of telling us which server will connect to a cross realm.

## Cross Realm

The Cross Realm will be a server with limited capabilities which will be set-up in our `Game.config.json`, he will be connected to the Account Server (as all servers).

Every server will have it's copy of `cq_client_config` which must remain the same to all servers, basically it will be the same as on Account Server. We do not want our game servers connecting to the account database, so we will keep track of it locally.

So, after setting a flag `IsCrossServer` to true at our settings file, we will tell our server that he will be only loading the necessary stuff for a cross realm to work.

After thinking a little bit, we will be using preprocessor variables... better than using `if` statements inside of DB operations, we may just skip the compilation.

### Database activity

This one will be tricky, since we do not want game data to be saved if the player is on the realm. But we are probably going for preprocessor variables.

### Monster hunting

Will we allow monsters to be hunt? What if we do some special maps with free PK and good rewards?