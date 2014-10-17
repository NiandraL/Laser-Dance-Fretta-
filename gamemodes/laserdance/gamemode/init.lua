
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

function GM:GetFallDamage( ply, speed )
	return 25
end

function GM:CanStartRound()
	if #team.GetPlayers( TEAM_RED ) + #team.GetPlayers( TEAM_BLUE ) >= 2 then return true end
	return false
end

function GM:OnPreRoundStart()

	game.CleanUpMap()

	UTIL_SpawnAllPlayers()
	

end

function GM:PlayerJoinTeam(ply, teamid) 
	if (!GAMEMODE:InRound()) and ply:Team() == TEAM_UNASSIGNED and (teamid == TEAM_RED or TEAM_BLUE) then 
		ply:SetTeam(teamid)
	end
	
	if ply:Team() != TEAM_SPECTATOR and teamid == TEAM_SPECTATOR then
		ply:SetTeam(TEAM_SPECTATOR)
		ply:KillSilent()
		ply:StripWeapons()
		ply:ChatPrint(""..ply:Nick()..", you've joined Spectators.")
	end	
	
	if (ply:Team() == TEAM_UNASSIGNED or TEAM_SPECTATOR) and ( GAMEMODE:InRound() ) and GetGlobalFloat("RoundStartTime",CurTime()) - 30 < CurTime() 
		and (teamid == TEAM_RED or TEAM_BLUE) then
		ply:SetTeam(teamid)
		timer.Simple(1, function()
			ply:Spawn()
			print("Late player successfully spawned.")
		end)
	end	
	if (ply:Team() == TEAM_UNASSIGNED or TEAM_SPECTATOR) and ( GAMEMODE:InRound() ) and GetGlobalFloat("RoundStartTime",CurTime()) + 30 < CurTime()
		and (teamid == TEAM_RED or TEAM_BLUE) then
		timer.Simple(1, function()
		ply:KillSilent()
		ply:SetTeam(teamid)
		ply:ChatPrint("You'll spawn automatically when next round starts, "..ply:Nick()..".")
		print("Late player has not been spawned.")
		end)
	end
end