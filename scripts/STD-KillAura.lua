-- Silent Aim
local target = "xXxCroutsOPMoonsxXx"
target = game.Players[target].Character.Head
game.ReplicatedStorage.Remotes.AttemptShoot:InvokeServer(target)
