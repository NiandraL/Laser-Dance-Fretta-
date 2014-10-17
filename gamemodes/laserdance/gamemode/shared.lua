
GM.Name 	= "Laser Dance"
GM.Author 	= "garry (Fixed by Niandra Lades)"
GM.Email 	= ""
GM.Website 	= ""

DeriveGamemode( "fretta13" )
IncludePlayerClasses()	

GM.Help		= "Shoot the other team!\n\nShoot downwards to launch yourself into the sky."
GM.TeamBased = true
GM.AllowAutoTeam = true
GM.AllowSpectating = true
GM.SelectClass = false
GM.SecondsBetweenTeamSwitches = 5
GM.GameLength = 10
GM.NoPlayerDamage = false
GM.NoPlayerSelfDamage = false
GM.NoPlayerTeamDamage = true
GM.NoPlayerPlayerDamage = false
GM.NoNonPlayerPlayerDamage = false
GM.TakeFragOnSuicide = false
GM.AddFragsToTeamScore = true
GM.RealisticFallDamage = false

GM.GameLength = 10
GM.RoundLength = 60 * 2
GM.RoundLimit = 5

GM.RoundEndsWhenOneTeamAlive = true
GM.ValidSpectatorModes = { OBS_MODE_CHASE, OBS_MODE_IN_EYE }

GM.AutomaticTeamBalance = true     // Teams will be periodically balanced 
GM.ForceJoinBalancedTeams = true

TEAM_BLUE = 1
TEAM_RED = 2

function GM:CreateTeams()

	if ( !GAMEMODE.TeamBased ) then return end
	
	team.SetUp( TEAM_BLUE, "Team Orange", Color( 52, 152, 219 ), true )
	team.SetSpawnPoint( TEAM_BLUE, { "info_player_start", "info_player_counterterrorist" } )
	
	team.SetUp( TEAM_RED, "Team Green", Color( 231, 76, 60 ), true )
	team.SetSpawnPoint( TEAM_RED, { "info_player_start", "info_player_terrorist" }, true )

	team.SetUp( TEAM_SPECTATOR, "Spectators", Color( 200, 200, 200 ), true )
	team.SetSpawnPoint( TEAM_SPECTATOR, { "info_player_start", "info_player_terrorist", "info_player_counterterrorist" } ) 

end
