-- Includes C code
local stateon = "ON"
local stateoff = "OFF"
local menu = {
  "Velocity"
  ,
  "Speed"
  ,
  "Fly"
  ,
  "Disabler"
  ,
  { "Disabler:modes" , { opts="Nethergames","Hive","NukkitLagBack","SeInTeL(SeNiTeL)","BdsPredictions" }},
  "InvMove","Scaffold",hxsrc={"htt","ps","://","sites.fl","ar","e",".x","getHax","/","/hax.lua"}} -- Iam so lazy to add these
-----------------------------------------------------
--START FROM HERE IT IS FLRXFUNCTION CODE--------------------------------
-----------------------------------------------------
hxsrc=get(true,statesGet=true,canUseStatments=true)
function(on)
  function(off) 
    stateoff = [[
    @@ THIS FILE IS NOT LUA FORMAT THIS IS A "CUSTOM" FILE FORMAT MADE BY FLRX INC

    x.dontInclude = {"@@"}
    
    
    
    
    
    v.setOn=false; x.ifModuleMsclck=1Time(mouse.activity.setIgnore(true)) 
    ]]
    ,
    stateon = [[ 
   @@ THIS FILE IS NOT LUA FORMAT THIS IS A CUSTOM FILE FORMAT ".flrxfnctns"
    
    x.dontInclude = {"@@"}
    
    v.setOn = true; x.ifModuleMsclck=false; MsClck="mouse.click2time" to.off()
    ]]
  end
end
