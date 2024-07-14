#Statscollector.
.
.the VU alternative for procon's chatguidstatslogger
.heavy work in progress, not yet useable for a live server.
.use at own risk..

.6.0.0 : fixed a player vs sql problem. (thanks doc-ice-elm)
.5.0.0 : stats for bots are more and more ignored
.	Merged all vehicles / weapon kill scripts in one file..
.4.0.0 : Test version with ,working fixes ?
.3.0.3 : Full revamp annd more fixed
.now only kills from humans got collected.
.Needed to do that what i wanted to avoid.
.BUT.....it works..
#
.Some code used from: Doc-Ice-Elm, Joe_91
.Code fixes: Bree_Arnold and Doc-Ice-Elm, Jassent, IllustrisJack, Bree_Arnold
.SQLite fix for getting weapon kills: NoFaTe

.almost working: revive check - human vs bot, bot bs human , human vs human
.See SL-commands for ingame commands
.WARNING !
.use at own risc, the mod is working, but still needs some masive tweaks.
.
.solved/Known isues: The player who made the last kill still wil not be counted for stats update (randomly), a fix is needed..
.solved/Known isues: The roadkill stuff doesnt work yet as it should be..
.Solved/Known isues: Randomly for some stupid reasons, new kills are not registered while they exist.

