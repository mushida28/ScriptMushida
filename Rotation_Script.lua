
---- Lucifer API Helper ----

bot = getBot()

world = bot:getWorld()

inventory = bot:getInventory()

bot.collect_path_check = true

bot.auto_collect = true

bot.collect_range = 4

bot.object_collect_delay = 200

bot.collect_interval = 100

bot.move_interval = 235

bot.move_range = 3

-------------------------------------------------------------

Table_Pack_Sequence = 1

job = 0

Remaining_Tile = 0

local Start_From = 1

local Start_Bot_List_From = 1

local Start_Drop_Pack = 1

local Start_Drop_Seed_Pack = 1

connect = 0

Farming_Status = true

autoRecon = true

local noStopScript = true

ScriptName = "Rotation Script"

CreditName = "**mushida#1447**"

WebhookTitle = ""..ScriptName.."\nScript By "..CreditName..""

WorldAndDoorIDCensor = "CENSORED"

local BotName = bots[bot.name].Bot_List[Start_Bot_List_From][1]:gsub("`.",'')

-------------------------------------------------------------



---- Defining Bot Function ----

Change_Bot_Status = bots[bot.name].Change_Bot_Status

Bot_Format = bots[bot.name].Bot_Format

Bot_List = bots[bot.name].Bot_List

TotalBotList = #Bot_List

Use_Max_Level_Status = bots[bot.name].Use_Max_Level_Status

Max_Level = bots[bot.name].Max_Level

Use_Rest_Bot = bots[bot.name].Use_Rest_Bot

Rest_Bot_Time = bots[bot.name].Rest_Bot_Time

Rest_Bot_Time_Milliseconds = Rest_Bot_Time * 60 * 1000 

Block_ID = bots[bot.name].Block_ID

Seed_ID = 1 + Block_ID

Custom_Break_Tile = bots[bot.name].Custom_Break_Tile

X_Break = bots[bot.name].X_Break

X_Break = X_Break - 1

Y_Break = bots[bot.name].Y_Break

Y_Break = Y_Break - 1

Rotation_World = bots[bot.name].Rotation_World

TotalRotationWorld = #Rotation_World

local Rotation_World_Name = Rotation_World[Start_From]:upper()

Rotation_Door_ID = bots[bot.name].Rotation_Door_ID:upper()

Save_Seed_World = bots[bot.name].Save_Seed_World:upper()

Save_Seed_Door_ID = bots[bot.name].Save_Seed_Door_ID:upper()

Save_Pack_World = bots[bot.name].Save_Pack_World:upper()

Save_Pack_Door_ID = bots[bot.name].Save_Pack_Door_ID:upper()

Take_Pickaxe = bots[bot.name].Take_Pickaxe

Take_Pickaxe_World = bots[bot.name].Take_Pickaxe_World:upper()

Take_Pickaxe_Door_ID = bots[bot.name].Take_Pickaxe_Door_ID:upper()

Buy_Rare_Clothes_Pack = bots[bot.name].Buy_Rare_Clothes_Pack

Webhook_Link = bots[bot.name].Webhook_Link

Use_Edit_Message_Webhook = bots[bot.name].Use_Edit_Message_Webhook

Webhook_Message_ID = bots[bot.name].Webhook_Message_ID

Pickaxe_ID = bots[bot.name].Pickaxe_ID

Pack_Name_To_Buy = bots[bot.name].Pack_Name_To_Buy

Pack_Price = bots[bot.name].Pack_Price

Max_Buy_Pack = bots[bot.name].Max_Buy_Pack

Max_Pack_To_Drop = bots[bot.name].Max_Pack_To_Drop

Custom_Drop_Pack = bots[bot.name].Custom_Drop_Pack

TotalBackpackNeeded = #Custom_Drop_Pack

TotalBackpackNeededRareClothesPack = 3

Drop_Seed_Marker = bots[bot.name].Drop_Seed_Marker

Drop_Pack_Marker = bots[bot.name].Drop_Pack_Marker

Harvest_Delay = bots[bot.name].Harvest_Delay

Plant_Delay = bots[bot.name].Plant_Delay

Hit_Block_Delay = bots[bot.name].Hit_Block_Delay

Put_Block_Delay = bots[bot.name].Put_Block_Delay

Auto_Buy_Delay = bots[bot.name].Auto_Buy_Delay

Join_World_Delay = bots[bot.name].Join_World_Delay

Reconnect_Delay = bots[bot.name].Reconnect_Delay

Max_Reconnect_Delay = Max_Reconnect_Delay * 60 * 1000 

-------------------------------------------------------------



---- Time Helper ----

g = os.time()

starttime = os.time()

menit = 0

detik = 0

tahminibitisdakika = 0

tahminibitissaat = 0

sonsaaat = 0

sondakika = 0

kayitliyil = (os.date"%Y")

kayitligun = (os.date"%d")

kayitliay = (os.date"%m")

kayitlisaat = (os.date"%H")

kayitlidakika = (os.date"%M")

kayitlisaniye = (os.date"%S")

kayitliyil2 =(os.date"%Y")

kayitligun2 =(os.date"%d")

kayitliay2 =(os.date"%m")

kayitlisaat2 =(os.date"%H")

kayitlidakika2 =(os.date"%M")

kayitlisaniye2 =(os.date"%S")

kalanzamansaniye6 = 0

-------------------------------------------------------------

---- Get Time ----

function webhookDate()

	local Time_Difference_Webhook = GMT_Time_Zone * 3600

	local Current_Time_GMT = os.time(os.date("!*t"))

	local Current_Time_Webhook = Current_Time_GMT + Time_Difference_Webhook

	return os.date("***%A, %B %d, %Y*** | ***%H:%M***", Current_Time_Webhook)

end



---- Webhook ----

function webhookShareInfo(message)

	local wh = Webhook.new(Webhook_Link)

	wh.username = "Mushida Scripts"

	wh.avatar_url = "https://cdn.discordapp.com/attachments/1161348198447714492/1175003816907771954/20231117162444907.jpg?ex=657c1b94&is=6569a694&hm=8ad1871ceea2f9d13ba63c4d64dd4638be3aa9d96d855a66d33f097530cea08a&"

	wh.embed1.use = true

	wh.embed1.title = (WebhookTitle)

	wh.embed1.description = (message)

	wh.embed1.color = 15105570

	wh.embed1.thumbnail = "https://cdn.discordapp.com/attachments/1161348198447714492/1175003816907771954/20231117162444907.jpg?ex=657c1b94&is=6569a694&hm=8ad1871ceea2f9d13ba63c4d64dd4638be3aa9d96d855a66d33f097530cea08a&"

		

	if Use_Edit_Message_Webhook == "yes" then

		wh:edit(Webhook_Message_ID)

	else

		wh:send()

	end

end



function reconInfo(message)

	local wh = Webhook.new(Webhook_Link)

	wh.username = "mushida script"

	wh.avatar_url = "https://cdn.discordapp.com/attachments/1161348198447714492/1175003816907771954/20231117162444907.jpg?ex=657c1b94&is=6569a694&hm=8ad1871ceea2f9d13ba63c4d64dd4638be3aa9d96d855a66d33f097530cea08a&"

	wh.embed1.use = true

	wh.embed1.title = (WebhookTitle)

	wh.embed1.description = (message)

	wh.embed1.color = 15105570

	wh.embed1.thumbnail = "https://cdn.discordapp.com/attachments/1161348198447714492/1175003816907771954/20231117162444907.jpg?ex=657c1b94&is=6569a694&hm=8ad1871ceea2f9d13ba63c4d64dd4638be3aa9d96d855a66d33f097530cea08a&"

		

	if Use_Edit_Message_Webhook == "yes" then

		wh:edit(Webhook_Message_ID)

	else

		wh:send()

	end

end



function webhookShareInfoAds(message)

	local wh = Webhook.new(Webhook_Link)

	wh.username = "mushida script"

	wh.avatar_url = "https://cdn.discordapp.com/attachments/1161348198447714492/1175003816907771954/20231117162444907.jpg?ex=657c1b94&is=6569a694&hm=8ad1871ceea2f9d13ba63c4d64dd4638be3aa9d96d855a66d33f097530cea08a&"

	wh.embed1.use = true

	wh.embed1.title = "[ ADVERTISEMENT ]"

	wh.embed1.description = (message)

	wh.embed1.color = 15105570

	wh.embed1.thumbnail = "https://cdn.discordapp.com/attachments/1161348198447714492/1175003816907771954/20231117162444907.jpg?ex=657c1b94&is=6569a694&hm=8ad1871ceea2f9d13ba63c4d64dd4638be3aa9d96d855a66d33f097530cea08a&"

	

	if Use_Edit_Message_Webhook == "yes" then

		return

	else

		wh:send()

	end

end



---- Bot Status (Online/Offline) & Reconnect ----

function statusBotDescription()

	if bot.status == BotStatus.online then

		return "Your Bot is Online"

	elseif bot.status == BotStatus.offline then

		return "Your Bot is Offline"

	elseif bot.status == BotStatus.wrong_password then

		return "Wrong Password"

	elseif bot.status == BotStatus.account_banned then

		return "Account Banned"

	elseif bot.status == BotStatus.location_banned then

		return "Location Banned"

	elseif bot.status == BotStatus.version_update then

		return "Version Update"

	elseif bot.status == BotStatus.advanced_account_protection then

		return "Advanced Account Protection"

	elseif bot.status == BotStatus.server_overload then

		return "Server Overload"

	elseif bot.status == BotStatus.too_many_login then

		return "Too Many Login"

	elseif bot.status == BotStatus.maintenance then

		return "Maintenance"

	elseif bot.status == BotStatus.http_block then

		return "Http Block"

	elseif bot.status == BotStatus.captcha_requested then

		return "Captcha Requested"

	else 

		return "-"

	end

end



function reconStatus()

	if bot.status == 1 then

		botStatus = "Online"

	else

		botStatus = "Disconnect"

	end

end



function maxReconnect()

	reconStatus()

	if bot.status ~= 1 and bot.status == BotStatus.wrong_password then

		webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		table.remove(Bot_List, Start_Bot_List_From)

		TotalBotList = #Bot_List

		Start_Bot_List_From = 0		

		changeBotStatus()

	elseif bot.status ~= 1 and bot.status == BotStatus.account_banned then

		webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		table.remove(Bot_List, Start_Bot_List_From)

		TotalBotList = #Bot_List

		Start_Bot_List_From = 0		

		changeBotStatus()

	elseif bot.status ~= 1 and bot.status == BotStatus.advanced_account_protection then

		webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		table.remove(Bot_List, Start_Bot_List_From)

		TotalBotList = #Bot_List

		Start_Bot_List_From = 0		

		changeBotStatus()

	elseif bot.status ~= 1 and bot.status == BotStatus.captcha_requested then

		webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		table.remove(Bot_List, Start_Bot_List_From)

		TotalBotList = #Bot_List

		Start_Bot_List_From = 0		

		changeBotStatus()

	end

	

	if connect < Max_Reconnect then

		connect = connect + 1

	else

		reconInfo("<a:toa:997296837352505415> **|** Sorry, the maximum reconnect has reached the limit.\nPlease wait for the bot to come back online.\nTime to come back online: "..restBotTime(Max_Reconnect_Delay).."\n\n"..webhookDate().."")

		sleep(Max_Reconnect_Delay)

		connect = 0

	end

end



function reconMain1(world_name,id,x,y)

	reconStatus()



	if autoRecon then

		if bot.status ~= 1 then

			reconInfo("<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

			sleep(100)

			maxReconnect()

			reconInfo("<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n<a:toa:997296837352505415> **|** Bot Trying to Reconnect! ("..connect.."/"..Max_Reconnect..")\n\n"..webhookDate().."")

			bot:connect()

			sleep(Reconnect_Delay)

		while true do

		while bot.status ~= 1 and noStopScript == true do

			maxReconnect()

			reconInfo("<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n<a:toa:997296837352505415> **|** Bot Trying to Reconnect! ("..connect.."/"..Max_Reconnect..")\n\n"..webhookDate().."")

			bot:connect()

			sleep(Reconnect_Delay)

		end

		sleep(3000)

		while bot.status == 1 and world.name ~= world_name:upper() do 

			bot:warp(""..world_name:upper().."")

			sleep(Join_World_Delay)

		end

		sleep(3000)

		if bot.status == 1 and world.name == world_name:upper() then

			while world:getTile(math.floor(world:getLocal().posx / 32),math.floor(world:getLocal().posy / 32)).fg == 6 do

				bot:warp(""..world_name:upper().."|"..id:upper().."")

				sleep(Join_World_Delay)

			end

			sleep(3000)

			while math.floor(world:getLocal().posx / 32) ~= x or math.floor(world:getLocal().posy / 32) ~= y  do

				bot:findPath(x,y)

				sleep(1000)

			end

			if bot.status == 1 and math.floor(world:getLocal().posx / 32) == x and math.floor(world:getLocal().posy / 32) == y then

				reconInfo("<a:toa:997296837352505415> **|** Bot Back Online, Back To Last Position!\nAnd Bot Back Farming!\n\n"..webhookDate().."")

				sleep(1000)

				connect = 0

				reconStatus()

				return false

			end

		end

		end

		end

	end

end



function reconMain2(world_name,id,x,y)

	reconStatus()



	while true do

		while bot.status == 1 and world.name ~= world_name:upper() do 

			bot:warp(""..world_name:upper().."")

			sleep(Join_World_Delay)

		end

			sleep(3000)

		if bot.status == 1 and world.name == world_name:upper() then

			while world:getTile(math.floor(world:getLocal().posx / 32),math.floor(world:getLocal().posy / 32)).fg == 6 do

				bot:warp(""..world_name:upper().."|"..id:upper().."")

				sleep(Join_World_Delay)

			end

				sleep(3000)

			while math.floor(world:getLocal().posx / 32) ~= x or math.floor(world:getLocal().posy / 32) ~= y  do

				bot:findPath(x,y)

				sleep(1000)

			end

			if bot.status == 1 and math.floor(world:getLocal().posx / 32) == x and math.floor(world:getLocal().posy / 32) == y then

				reconInfo("<a:toa:997296837352505415> **|** Bot Back Online, Back To Last Position!\nAnd Bot Back Farming!\n\n"..webhookDate().."")

				sleep(1000)

				connect = 0

				reconStatus()

				return false

			end

		end

	end

end



---- Get Item Name With Item ID ----

function getItemByID(itemID)

	return getInfo(itemID).name

end



---- Scan ----

function fossilRockScan()

	local fossil = 0

	

	for _,tile in pairs(world:getTiles()) do

		if tile.fg == 3918 then

			fossil = fossil + 1

		end

	end

	return fossil

end



function readyTreeScan()

	local readyTree = 0

	

	for _, tile in pairs(world:getTiles()) do

		if tile.fg == Seed_ID and tile:canHarvest() then

			readyTree = readyTree + 1

		end

	end

	return readyTree

end



function unreadyTreeScan()

	local readyTree = 0

	local unreadyTree = 0

	

	for _, tile in pairs(world:getTiles()) do

		if tile.fg == Seed_ID then

			if world:getTile(tile.x, tile.y):canHarvest() then

				readyTree = readyTree + 1

		else

			unreadyTree = unreadyTree + 1

			end

		end

	end

	return unreadyTree

end



function inWorldScan(ids)

	local scan = 0 

	

	for _,tile in pairs(world:getTiles()) do

		if tile.fg == ids and tile:canHarvest() then

			scan = scan + 1

		end

	end

	return scan

end



function jobScan()

	job = 0

	

	for _, tile in pairs(world:getTiles()) do

		if tile.fg == Seed_ID then

			if world:getTile(tile.x, tile.y):canHarvest() then

				job = job + 1

			end

		end

	end

	return job

end



function tileScan()

	local emptyTile = 0

	

	for _, tile in pairs(world:getTiles()) do

		if tile.fg > 0 and tile.fg ~= Seed_ID and tile.fg ~= 12 and tile.y > 1 then

			if world:getTile(tile.x, tile.y - 1).fg == 0 then

				emptyTile = emptyTile + 1

			end

		end

	end

	return emptyTile

end



function floatScan(ids)

	local float = 0

	

	for _,obj in pairs(world:getObjects()) do

		if obj.id == ids then

			float = float + obj.count

		end

	end

	return float

end



---- Time ----

function timeStart()

	jobScan()

	

	kayitliyil =(os.date"%Y")

	kayitligun =(os.date"%d")

	kayitliay =(os.date"%m")

	kayitlisaat =(os.date"%H")

	kayitlidakika =(os.date"%M")

	kayitlisaniye =(os.date"%S")

	anadakika = inWorldScan()*0.06

	dakikayabolme= anadakika / 60

	saat = math.floor(dakikayabolme)

	dakika= (dakikayabolme - saat)*60

	tahminibitisdakika = saat

	tahminibitissaat = math.floor(dakika+4)

end



function timeEnd()

	kayitliyil1 =(os.date"%Y")

	kayitligun1 =(os.date"%d")

	kayitliay1 =(os.date"%m")

	kayitlisaat1 =(os.date"%H")

	kayitlidakika1=(os.date"%M")

	kayitlisaniye1=(os.date"%S")

	ilkzaman = os.time {year = kayitliyil , month = kayitliay , day = kayitligun , hour = kayitlisaat ,min =kayitlidakika , sec = kayitlisaniye}

	sonzaman = os.time {year = kayitliyil1 , month = kayitliay1 , day = kayitligun1 , hour = kayitlisaat1 ,min =kayitlidakika1 , sec = kayitlisaniye1}

	kalanzamansaniye = sonzaman-ilkzaman

	adimadimtarih = (kalanzamansaniye/60)/60

	sonsaaat= math.floor(adimadimtarih)

	sondakika = math.floor((adimadimtarih-sonsaaat)*60)

end



function timeR()

	kayitliyil2 =(os.date"%Y")

	kayitligun2 =(os.date"%d")

	kayitliay2 =(os.date"%m")

	kayitlisaat2 =(os.date"%H")

	kayitlidakika2 =(os.date"%M")

	kayitlisaniye2 =(os.date"%S")

end



function timeRS()

	kayitliyil3 =(os.date"%Y")

	kayitligun3 =(os.date"%d")

	kayitliay3 =(os.date"%m")

	kayitlisaat3 =(os.date"%H")

	kayitlidakika3=(os.date"%M")

	kayitlisaniye3=(os.date"%S")

	ilkzaman = os.time {year = kayitliyil2 , month = kayitliay2 , day = kayitligun2 , hour = kayitlisaat2 ,min =kayitlidakika2 , sec = kayitlisaniye2}

	sonzaman = os.time {year = kayitliyil3 , month = kayitliay3 , day = kayitligun3 , hour = kayitlisaat3 ,min =kayitlidakika3 , sec = kayitlisaniye3}

	kalanzamansaniye6 = sonzaman-ilkzaman

	adimadimtarih = (kalanzamansaniye6/3600)

	jam = math.floor(adimadimtarih)

	menit = math.floor((adimadimtarih-jam)*60)

	detik = math.floor((kalanzamansaniye6-jam*3600-menit*60))

end



function secondON(seconds)

	local seconds = tonumber(seconds)

	

	if seconds <= 0 then

		return "00:00:00";

	else

		hours = string.format("%02.f", math.floor(seconds/3600));

		mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));

		secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));

		return hours..":"..mins..":"..secs

	end

end



function secondR(seconds)

	local seconds = tonumber(seconds)

	

	if seconds <= 0 then

		return "00:00";

	else

		hours = string.format("%02.f", math.floor(seconds/3600));

		mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));

		secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));

		return mins..":"..secs

	end

end



function restBotTime(ms)

    local totalSeconds = math.floor(ms / 1000)



    hours = string.format("%02.f", math.floor(totalSeconds / 3600))

    mins = string.format("%02.f", math.floor((totalSeconds / 60) % 60))

    secs = string.format("%02.f", math.floor(totalSeconds % 60))

    return hours..":"..mins..":"..secs

end



---- Take Item ----

function takeItemCall(x,y,itemID)

pkt = GameUpdatePacket.new()

pkt.type = 11

pkt.int_data = itemID

pkt.pos_x = x

pkt.pos_y = y

bot:sendRaw(pkt)

sleep(10)

end



function takeItem(itemID)

	for _, obj in pairs(world:getObjects()) do

		if obj.id == itemID then

			if (math.abs(world:getLocal().posx - obj.x) < 100 and math.abs(world:getLocal().posy - obj.y) < 100) then

				takeItemCall(obj.x,obj.y,obj.oid)

			end

		end

	end

end



---- Take & Drop Pickaxe ----

function findpathPickaxe()

	bot.auto_collect = false

	for _, obj in pairs(world:getObjects()) do

		if obj.id == (Pickaxe_ID) then

			bot:findPath(math.floor(obj.x / 32), math.floor(obj.y / 32))

			sleep(2000)

			takeItem(Pickaxe_ID) 

			sleep(500)

		if inventory:getItemCount(Pickaxe_ID) > 0 then

			goto END

		end

		end

	end

	::END::

end



function dropPickaxe()

	bot.auto_collect = false

	bot:findPath(math.floor(world:getLocal().posx / 32 - 1), math.floor(world:getLocal().posy / 32))

	sleep(1000)

	bot:hit(math.floor(world:getLocal().posx / 32 + 1), math.floor(world:getLocal().posy / 32))

	sleep(10)

	bot:drop(""..Pickaxe_ID.."",inventory:getItemCount(Pickaxe_ID) - 1)

	sleep(1000)

end



function takePickaxe()

	bot.auto_collect = false

	while bot.status ~= 1 and noStopScript == true do

		reconMain1(Take_Pickaxe_World,Take_Pickaxe_Door_ID,1,1)

	end

	if Take_Pickaxe == "no" then

		return

	end

	if Take_Pickaxe == "yes" then

		if bot:getInventory():getItem(Pickaxe_ID).isActive then

			webhookShareInfo(BotName.." pickaxe is already in use and rotation starts.\n\n"..webhookDate().."")

			return

		end

		reconMain1(Take_Pickaxe_World,Take_Pickaxe_Door_ID,1,1)

		bot:warp(""..Take_Pickaxe_World.."")

		sleep(Join_World_Delay)

		bot:warp(""..Take_Pickaxe_World.."|"..Take_Pickaxe_Door_ID.."")

		sleep(3000)

		getWorldName = bot:getWorld().name

		while getWorldName ~= Take_Pickaxe_World do

			bot:warp(""..Take_Pickaxe_World.."")

			sleep(Join_World_Delay)

			bot:warp(""..Take_Pickaxe_World.."|"..Take_Pickaxe_Door_ID.."")

			sleep(3000)

			getWorldName = bot:getWorld().name

			sleep(7000)

		end

		if floatScan(Pickaxe_ID) == 0 then

			webhookShareInfo(BotName.." starts the rotation without using a pickaxe, as the remaining pickaxe in the world are 0.\n\n"..webhookDate().."")

			return

		else

			findpathPickaxe()

		end

			sleep(3000)	

		if inventory:getItemCount(Pickaxe_ID) >= 1 then

			reconMain1(Take_Pickaxe_World,Take_Pickaxe_Door_ID,1,1)

			bot:wear(Pickaxe_ID)

			sleep(2000)

		if inventory:getItemCount(Pickaxe_ID) >= 2 then

			reconMain1(Take_Pickaxe_World,Take_Pickaxe_Door_ID,1,1)

			sleep(1000)

			dropPickaxe()

			sleep(1000)

		end

			webhookShareInfo(BotName.." take the pickaxe and the rotation start.\n:package: **|** Total Pickaxe Dropped: "..floatScan(Pickaxe_ID).."\n\n"..webhookDate())

			else

			webhookShareInfo(BotName.." failed to take the pickaxe, try again.\n\n"..webhookDate())

		while inventory:getItemCount(Pickaxe_ID) == 0 do

			reconMain1(Take_Pickaxe_World,Take_Pickaxe_Door_ID,1,1)

			sleep(5000)

			bot:warp(""..Take_Pickaxe_World.."")

			sleep(Join_World_Delay)

			bot:warp(""..Take_Pickaxe_World.."|"..Take_Pickaxe_Door_ID.."")

			sleep(3000)

			if floatScan(Pickaxe_ID) == 0 then

				webhookShareInfo(BotName.." starts the rotation without using a pickaxe, as the remaining pickaxe in the world are 0.\n\n"..webhookDate())

				return

			else

				findpathPickaxe()

			end

				sleep(3000)

		if inventory:getItemCount(Pickaxe_ID) >= 1 then

			reconMain1(Take_Pickaxe_World,Take_Pickaxe_Door_ID,1,1)

			bot:wear(Pickaxe_ID)

			sleep(2000)

		if inventory:getItemCount(Pickaxe_ID) >= 2 then

			reconMain1(Take_Pickaxe_World,Take_Pickaxe_Door_ID,1,1)

			sleep(1000)

			dropPickaxe()

			sleep(1000)

		end

		end

		end

			webhookShareInfo(BotName.." take the pickaxe and the rotation starts.\n:package: **|** Total Pickaxe Dropped: "..floatScan(Pickaxe_ID).."\n\n"..webhookDate())

		end

	end

end



---- Take Seed ----

function findpathSeed()

	bot.auto_collect = false

	for _, obj in pairs(world:getObjects()) do

		if obj.id == (Seed_ID) then

			bot:findPath(math.floor(obj.x / 32), math.floor(obj.y / 32))

			sleep(2000)

			takeItem(Seed_ID)

			sleep(500)

		if inventory:getItemCount(Seed_ID) > 0 then

			goto END

		end

		end

	end

	::END::

end



function takeSeed()

		bot.auto_collect = false

		seedWorld()

		sleep(1000)

	if floatScan(Seed_ID) == 0 then

		sleep(1000)

		lastCheck()

	end 

		sleep(1000)

		findpathSeed()

		sleep(1000)

		farmWorld()

end



---- Level Check ----

function levelCheck()

	if Use_Max_Level_Status == "no" then 

		return

	end

	if Use_Max_Level_Status == "yes" then

		if bot.level >= Max_Level then

			bot.auto_reconnect = false

			while inventory:getItemCount(Seed_ID) > 0 do

				sleep(100)	

				seedWorld()

				sleep(1000)

				dropSeed()

				sleep(1000)

			end

			while inventory:getItemCount(Block_ID) > 0 do

				sleep(100)	

				seedWorld()

				sleep(1000)

				dropBlock()

				sleep(1000)

			end

			while inventory:getItemCount(Pickaxe_ID) > 0 do

				bot.auto_collect = false

				sleep(100)	

				bot:warp(""..Take_Pickaxe_World.."")

				sleep(Join_World_Delay)

				bot:warp(""..Take_Pickaxe_World.."|"..Take_Pickaxe_Door_ID.."")

				sleep(3000) 

				bot:findPath(44,13)

				sleep(2000)

				dropItem(Pickaxe_ID)

				sleep(1000)

			end

			bot:disconnect()

			reconStatus()

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `[Your level has reached or exceeded the maximum level set]`\n\n"..webhookDate().."")

			table.remove(Bot_List, Start_Bot_List_From)

			TotalBotList = #Bot_List

			Start_Bot_List_From = 0

			changeBotStatus()

		end

	end

end



---- Upgrade Backpack ----

function upgradeBackpack()

	local remainingBackpackSlots = inventory.slotcount - inventory.itemcount

	if remainingBackpackSlots >= TotalBackpackNeeded then

		return

	else

		bot:buy("upgrade_backpack")

		return

	end

end 



function upgradeBackpackForRareClothesPack()

	local remainingBackpackSlots = inventory.slotcount - inventory.itemcount

	if remainingBackpackSlots >= TotalBackpackNeededRareClothesPack then

		return

	else

		bot:buy("upgrade_backpack")

		return

	end

end 



---- Join World ----

function farmWorld()

	reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,0,23)

	bot:warp(""..Rotation_World[Start_From]:upper().."")

	sleep(Join_World_Delay)

	bot:warp(""..Rotation_World[Start_From]:upper().."|"..Rotation_Door_ID.."")

	sleep(3000)

	getWorldName = bot:getWorld().name

end



function packWorld()

	reconMain1(Save_Pack_World,Save_Pack_Door_ID,0,0)

	bot.auto_collect = false

	bot:warp(""..Save_Pack_World.."")

	sleep(Join_World_Delay)

	bot:warp(""..Save_Pack_World.."|"..Save_Pack_Door_ID.."")

	sleep(3000)

	getWorldName = bot:getWorld().name

end



function seedWorld()

	reconMain1(Save_Seed_World,Save_Seed_Door_ID,0,0)

	bot.auto_collect = false

	bot:warp(""..Save_Seed_World.."")

	sleep(Join_World_Delay)

	bot:warp(""..Save_Seed_World.."|"..Save_Seed_Door_ID.."")

	sleep(3000)

	getWorldName = bot:getWorld().name

end



---- Buy Pack ----

function buyPack()

	local maxBuy = 0

	

	while bot.gem_count > Pack_Price and maxBuy < Max_Buy_Pack do

		maxBuy = maxBuy + 1

		upgradeBackpack()

		bot:buy(Pack_Name_To_Buy)

		sleep(Auto_Buy_Delay)

	if inventory:getItemCount(Custom_Drop_Pack[Table_Pack_Sequence]) >= 100 then goto END end

	end

		::END::

		if inventory:getItemCount(Custom_Drop_Pack[Table_Pack_Sequence]) < Max_Pack_To_Drop then 

			return

		end

			packWorld()

			sleep(2000)

			dropPack1()

			sleep(500)

			farmWorld()

			sleep(1000)

			findpathBreak()

			bot.auto_collect = true

end



---- Trash Item ----

function trashItem()

    for i, trash in ipairs(Trash_Item_ID) do

        if inventory:getItemCount(trash) >= 1  then

            bot:trash(trash, inventory:getItemCount(trash))

            sleep(1000)

			reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,1,1)

        end

    end

end



---- Add Proxy ----

local fileWrite = io.open(Proxy_File_Name, "w")

local fileRead = io.open(Proxy_File_Name, "r")

function addProxyMain()

	if Use_Proxy == "no" then 

		return 

	end

	if Use_Proxy == "yes" then

		getProxyManager():setLimit(""..Proxy_Limit.."")

		sleep(1000)

		for _, proxy in ipairs(Add_Proxy) do

			fileWrite:write(proxy .. "\n")

		end

			fileWrite:close()

			

		if fileRead then

			getProxyManager():addProxy("012.345.678.901:12345:12345:12345")

			sleep(3000)

			for line in fileRead:lines() do

				getProxyManager():addProxy(line)

			end

				fileRead:close()

				sleep(5000)

				getProxyManager():removeProxy("012.345.678.901", "12345")

		else

			webhookShareInfo("Failed to open "..Proxy_File_Name.." file.\n\n"..webhookDate().."")

		end

	end

end



---- Wear Rare Clothes Pack ----

Rare_Clothes_Pack = {250, 1716, 82, 78, 754, 146, 356, 72, 46, 124, 1720, 92, 1122, 212, 84, 1722, 1844, 

2718, 70, 4966, 288, 232, 788, 148, 448, 134, 50, 74, 1504, 494, 266, 852, 132, 2954, 3060, 3056, 1800, 

88, 2960, 1022, 2578, 3164, 86, 302, 1332, 304, 1116, 6788, 492, 1690, 316, 1850, 1718, 1838, 1032, 1860, 

1026, 3048, 724, 1590, 798, 488, 1342, 794, 268, 1504, 8884, 1858, 1314, 1688, 1312, 3590, 446, 1856, 

1854, 1516, 1316, 2700, 4968, 4964, 6796, 1862, 310, 290, 296, 6674, 1864, 4954, 1476, 896, 1848, 496, 136, 

2958, 2576, 1954, 152, 796, 1524, 2928, 80, 2934, 150, 1120, 1142, 1478, 154, 452, 258, 2882, 156, 1140, 3530, 

312, 1124, 690, 3052, 294, 1650, 1652, 348, 1736, 576, 292, 1146, 1028, 1762, 600, 11204, 1118}

function wearRareClothesPack()

    for i, wearing in ipairs(Rare_Clothes_Pack) do

        for _, itemActive in pairs(bot:getInventory():getItems()) do

            if itemActive.id == wearing then

                if itemActive.isActive then

                else

                    bot:wear(wearing)

                    sleep(1000)

                end

                break

            end

        end

    end

end



local shouldGoToNext = false

function hasRareClothesPack()

	if Buy_Rare_Clothes_Pack == "no" then 

		return 

	end

	if Buy_Rare_Clothes_Pack == "yes" then

		for _, hasRareClothesPack in ipairs(Rare_Clothes_Pack) do

			if inventory:getItemCount(hasRareClothesPack) >= 1 then

				shouldGoToNext = true

				for _, itemActive in pairs(bot:getInventory():getItems()) do

					if itemActive.id == hasRareClothesPack then

						if itemActive.isActive then

						else

							bot:wear(hasRareClothesPack)

							sleep(1000)

						end

						break

					end

				end

			end

		end



		if shouldGoToNext then

			goto NEXT

		else

			bot:buy("rare_clothes")

			sleep(2000)

			upgradeBackpackForRareClothesPack()

			sleep(2000)

			wearRareClothesPack()

			sleep(2000)

		end



		::NEXT::

		sleep(2000)

		if bot:getInventory():getItem(Pickaxe_ID).isActive then

			return

		end

		if inventory:getItemCount(Pickaxe_ID) >= 1 then

			bot:wear(Pickaxe_ID)

			sleep(1000)

		end

	end

end



---- PnB ----

function pnb()

	levelCheck()

	restBot()

	sleep(500)

	if inventory:getItemCount(Custom_Drop_Pack[Table_Pack_Sequence]) >= Max_Pack_To_Drop  then

		packWorld()

		sleep(2000)

		dropPack1()

		sleep(500)

		farmWorld()

		sleep(1000)

		findpathBreak()

		bot.auto_collect = true

	end

	if bot.gem_count > Pack_Price then

		buyPack()

		sleep(1000)

	end

	if inventory:getItemCount(Seed_ID) > (Max_Seed_To_Plant + 3) then

		seedWorld1()

		sleep(1000)

	end

	while inventory:getItemCount(Block_ID) > 0 do

		if bot.status ~= 1 then

			reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,X_Break,Y_Break)

		end

		if world:getTile(math.floor(world:getLocal().posx / 32),math.floor(world:getLocal().posy / 32)).fg == 0 then

			bot:place(math.floor(world:getLocal().posx / 32), math.floor(world:getLocal().posy / 32), Seed_ID)

		end

		levelCheck()

		restBot()

		if tileScan() > Remaining_Tile and inventory:getItemCount(Seed_ID) > (Max_Seed_To_Plant) then

			plant()

		end

		if tileScan() == Remaining_Tile and inventory:getItemCount(Seed_ID) > (Max_Seed_To_Plant) then

			seedWorld()

			sleep(1000)

			dropSeed()

			sleep(1000)

			takeItem(Block_ID)

			sleep(1000)

			farmWorld()

			sleep(1000)

			bot.auto_collect = true

			findpathBreak()

			sleep(1000)

		end

		while not bot:isInTile(X_Break, Y_Break) do

			bot:findPath(X_Break,Y_Break)

			sleep(1000)

		end

		breaker()

	end

		excludeBlock()

		sleep(1000)

		lastPNBBlockTileCheck()

		sleep(1000)

		plant()

end



function pnbLast()

	while inventory:getItemCount(Block_ID) > 0 do

		reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,X_Break,Y_Break)

		levelCheck()

		restBot()

		if tileScan() > Remaining_Tile and inventory:getItemCount(Seed_ID) > (Max_Seed_To_Plant) then

			plant()

		end

		if tileScan() == Remaining_Tile and inventory:getItemCount(Seed_ID) > (Max_Seed_To_Plant) then

			seedWorld()

			sleep(1000)

			dropSeed()

			sleep(1000)

			takeItem(Block_ID)

			sleep(1000)

			farmWorld()

			sleep(1000)

			bot.auto_collect = true

			findpathBreak()

			sleep(1000)

		end

		while not bot:isInTile(X_Break, Y_Break) do

			bot:findPath(X_Break,Y_Break)

			sleep(1000)

		end

		breaker()

	end

		excludeBlock()

		sleep(1000)

		lastPNBBlockTileCheck()

		sleep(1000)

		lastCheck1()

end



function lastPNBBlockTileCheck()

	reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,X_Break,Y_Break)

	for _, tile in pairs(world:getTiles()) do 

        if tile.fg == Block_ID or tile.bg == Block_ID then

			bot:findPath(tile.x, tile.y - 1)

			sleep(500)

			while math.floor(world:getLocal().posx / 32) ~= tile.x and math.floor(world:getLocal().posy / 32) ~= tile.y - 1 do

				bot:findPath(tile.x, tile.y - 1)

				sleep(500)

			end

		while not bot:isInTile(tile.x, tile.y-1) do

			bot:findPath(X_Break,Y_Break)

			sleep(3000)

		end

			destroy2(tile.x,tile.y)

		end

    end

end



function pnbLast1()

	findpathBreak()

	pnbLast()

end



function destroy2(x,y)

	while world:getTile(x,y).fg ~= 0 or world:getTile(x,y).bg ~= 0 do

		bot:hit(x,y)

		sleep(Hit_Block_Delay)

	if bot.status ~= 1 then

		reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,X_Break,Y_Break)

	end

	end

end



function destroy(x,y)

	while world:getTile(x,y).fg ~= 0 or world:getTile(x,y).bg ~= 0 and bot:isInTile(X_Break, Y_Break) do

		if not bot:isInTile(X_Break, Y_Break) then

			bot:findPath(X_Break,Y_Break)

			sleep(3000)

		end

		bot:hit(x,y)

		sleep(Hit_Block_Delay)

	if bot.status ~= 1 then

		reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,X_Break,Y_Break)

	end

	end

end



function breaker()

	getWorldName = bot:getWorld().name

	while getWorldName ~= Rotation_World_Name do

		farmWorld()

		sleep(7000)

	end

	if math.floor(world:getLocal().posx / 32) == X_Break and math.floor(world:getLocal().posy / 32) == Y_Break then

		if bot.status ~= 1 then

		reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,X_Break,Y_Break)

		end

		if Custom_Break_Tile == "5" then

			bot:place(X_Break-1,Y_Break-2,Block_ID)

			sleep(Put_Block_Delay)

			bot:place(X_Break-1,Y_Break-1,Block_ID)

			sleep(Put_Block_Delay)

			bot:place(X_Break-1,Y_Break,Block_ID)

			sleep(Put_Block_Delay)

			bot:place(X_Break-1,Y_Break+1,Block_ID)

			sleep(Put_Block_Delay)

			bot:place(X_Break-1,Y_Break+2,Block_ID)

			sleep(Put_Block_Delay)

			destroy(X_Break-1,Y_Break-2)

			destroy(X_Break-1,Y_Break-1)

			destroy(X_Break-1,Y_Break)

			destroy(X_Break-1,Y_Break+1)

			destroy(X_Break-1,Y_Break+2)

		elseif Custom_Break_Tile == "4" then

			bot:place(X_Break-1,Y_Break-2,Block_ID)

			sleep(Put_Block_Delay)

			bot:place(X_Break-1,Y_Break-1,Block_ID)

			sleep(Put_Block_Delay)

			bot:place(X_Break-1,Y_Break,Block_ID)

			sleep(Put_Block_Delay)

			bot:place(X_Break-1,Y_Break+1,Block_ID)

			sleep(Put_Block_Delay)

			destroy(X_Break-1,Y_Break-2)

			destroy(X_Break-1,Y_Break-1)

			destroy(X_Break-1,Y_Break)

			destroy(X_Break-1,Y_Break+1)

		elseif Custom_Break_Tile == "3" then

			bot:place(X_Break-1,Y_Break-1,Block_ID)

			sleep(Put_Block_Delay)

			bot:place(X_Break-1,Y_Break,Block_ID)

			sleep(Put_Block_Delay)

			bot:place(X_Break-1,Y_Break+1,Block_ID)

			sleep(Put_Block_Delay)

			destroy(X_Break-1,Y_Break-1)

			destroy(X_Break-1,Y_Break)

			destroy(X_Break-1,Y_Break+1)

		elseif Custom_Break_Tile == "2" then

			bot:place(X_Break-1,Y_Break-1,Block_ID)

			sleep(Put_Block_Delay)

			bot:place(X_Break-1,Y_Break,Block_ID)

			sleep(Put_Block_Delay)

			destroy(X_Break-1,Y_Break-1)

			destroy(X_Break-1,Y_Break)

		elseif Custom_Break_Tile == "1" then

			bot:place(X_Break-1,Y_Break,Block_ID)

			sleep(Put_Block_Delay)

			destroy(X_Break-1,Y_Break)

		else 

			webhookShareInfo("**Enter Custom_Break_Tile with the numbers 1 to 5, according to how many tile you want to break.**\n\n"..webhookDate().."")

		end

	end

end



---- Harvest ----

function harvest()

	while bot.status ~= 1 and noStopScript == true do

		bot.auto_reconnect = false

		reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,0,23)

		sleep(3000)

		bot.auto_reconnect = true

	end

	getWorldName = bot:getWorld().name

	while getWorldName ~= Rotation_World_Name do

		bot.auto_reconnect = false

		farmWorld()

		sleep(7000)

		bot.auto_reconnect = true

	end

	bot.auto_reconnect = true

	bot.auto_collect = true

	sleep(500)

	bot:say("`6[MUSHIDA SCRIPT] `0Script Started!")

	trashItem()

	for _, tile in pairs(world:getTiles()) do

		if (tile.fg == Seed_ID) and (tile:canHarvest()) then

			while bot.status == 1 and world.name ~= Rotation_World[Start_From]:upper() do 

				bot.auto_reconnect = false

				reconInfo("<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: `[The bot is offline]`\n\n"..webhookDate().."")

				reconMain2(Rotation_World[Start_From]:upper(),Rotation_Door_ID,1,23)

				sleep(3000)

				bot.auto_reconnect = true

			end

			while world:getTile(math.floor(world:getLocal().posx / 32),math.floor(world:getLocal().posy / 32)).fg == 6 do

				bot.auto_reconnect = false

				reconInfo("<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: `[The bot is offline]`\n\n"..webhookDate().."")

				reconMain2(Rotation_World[Start_From]:upper(),Rotation_Door_ID,1,23)

				sleep(3000)

				bot.auto_reconnect = true

			end

			while getWorldName ~= Rotation_World_Name do

				bot.auto_reconnect = false

				farmWorld()

				sleep(7000)

				bot.auto_reconnect = true

			end

			levelCheck()

			restBot()

			excludeBlock()

			bot.auto_reconnect = true

			bot:findPath(tile.x,tile.y)

			sleep(Harvest_Delay)

			bot:hit(math.floor(world:getLocal().posx / 32), math.floor(world:getLocal().posy / 32))

	if inWorldScan(Seed_ID) == 0 then

		bot.auto_reconnect = false

		pnbLast1()

	end

	if inventory:getItemCount(Block_ID) >= (Max_Block_To_Retrieve) then

		bot.auto_reconnect = false

		hasRareClothesPack()

		findpathBreak()

		pnb()

	end

		end

	end

end



---- Rest Bot ----

function connectBot()

	BotName = Bot_List[Start_Bot_List_From][1]:gsub("`.",'')

	if Bot_Format == "normal" then

		bot:updateBot(Bot_List[Start_Bot_List_From][1], Bot_List[Start_Bot_List_From][2], Bot_List[Start_Bot_List_From][3], Bot_List[Start_Bot_List_From][4])

		sleep(1000)

	elseif Bot_Format == "ubi" then

		bot:updateUbiBot(Bot_List[Start_Bot_List_From][1], Bot_List[Start_Bot_List_From][2])

		sleep(1000)

	end

		bot:connect()

		sleep(Reconnect_Delay)

	while bot.status ~= 1 and noStopScript == true do

		reconStatus()

		if bot.status ~= 1 and bot.status == BotStatus.wrong_password then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

			table.remove(Bot_List, Start_Bot_List_From)

			TotalBotList = #Bot_List

			Start_Bot_List_From = 0

			changeBotStatus()

		elseif bot.status ~= 1 and bot.status == BotStatus.account_banned then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

			table.remove(Bot_List, Start_Bot_List_From)

			TotalBotList = #Bot_List

			Start_Bot_List_From = 0

			changeBotStatus()

		elseif bot.status ~= 1 and bot.status == BotStatus.location_banned then 

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")		

		elseif bot.status ~= 1 and bot.status == BotStatus.version_update then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		elseif bot.status ~= 1 and bot.status == BotStatus.advanced_account_protection then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

			table.remove(Bot_List, Start_Bot_List_From)

			TotalBotList = #Bot_List

			Start_Bot_List_From = 0

			changeBotStatus()

		elseif bot.status ~= 1 and bot.status == BotStatus.server_overload then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		elseif bot.status ~= 1 and bot.status == BotStatus.too_many_login then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		elseif bot.status ~= 1 and bot.status == BotStatus.maintenance then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		elseif bot.status ~= 1 and bot.status == BotStatus.http_block then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		elseif bot.status ~= 1 and bot.status == BotStatus.captcha_requested then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

			table.remove(Bot_List, Start_Bot_List_From)

			TotalBotList = #Bot_List

			Start_Bot_List_From = 0

			changeBotStatus()

		end

		bot:connect()

		sleep(Reconnect_Delay)

	end

	sleep(10000)

	reconStatus()

	if Use_Max_Level_Status == "yes" then

		if bot.status == 1 and bot.level >= Max_Level then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `[Your level has reached or exceeded the maximum level set]`\n\n"..webhookDate().."")

			table.remove(Bot_List, Start_Bot_List_From)

			TotalBotList = #Bot_List

			Start_Bot_List_From = 0

			changeBotStatus()

		end

	end

	BotName = Bot_List[Start_Bot_List_From][1]:gsub("`.",'')

	g = os.time()

	ge = os.time() - g

	timeR()

	timeRS()

	webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<a:toa:997296837352505415> **|** Script Name: "..ScriptName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n<a:warn:1003200385315516516> **|** Bot Level: "..bot.level.."\n<:100gems:988942738466684978> **|** Gems Amount: "..bot.gem_count.."\n\n**[ WORLD INFORMATION ]**\n:globe_with_meridians: **|** Current Farm World: `"..Rotation_World[Start_From]:upper().."`\n=> `[Farm World "..Start_From.." of "..TotalRotationWorld.." World]`\n <a:warn:1003200385315516516> **|** Farm Door ID: ||"..WorldAndDoorIDCensor.."||\n\n:globe_with_meridians: **|** Seed Storage World: `"..Save_Seed_World.."`\n <a:warn:1003200385315516516> **|** Seed Storage Door ID: ||"..WorldAndDoorIDCensor.."||\n\n:globe_with_meridians: **|** Pack Storage World: `"..Save_Pack_World.."`\n <a:warn:1003200385315516516> **|** Pack Storage Door ID: ||"..WorldAndDoorIDCensor.."||\n\n**[ TREE INFORMATION ]**\n<:pohon:1007595269199769680> **|** Farmed Tree: "..getItemByID(Block_ID).."\n\n**[ TIME INFORMATION ]**\n<a:clocksandsz:978628852832165968> **|** Online Time: "..secondON(ge).."\n<a:clocksandsz:978628852832165968> **|** Looping Time: "..secondR(kalanzamansaniye6).." Minutes\n\n"..webhookDate().."")     	

	sleep(2000)

	changeBotHelp()

end



function changeBotHelp()

	sleep(5000)

	if inventory:getItemCount(Block_ID) > 0 then

		farmWorld()

		sleep(1000)

		findpathBreak()

		sleep(1000)

		pnb()

		(1000)

	end

		main()

		sleep(2000)

		lastCheck2()

end



function changeBotStatus()

	if TotalBotList == 0 and noStopScript == true then

		bot.auto_reconnect = false

		autoRecon = false

		noStopScript = false

		bot:disconnect()

		sleep(1000)

		webhookShareInfo("Your total bots in the bot list is only "..TotalBotList..", so the script at this index will stop running.\n\n"..webhookDate().."")

	end

	

	if noStopScript == true then

		if TotalBotList == 1 then

			webhookShareInfo("Your total bot in the bot list is only "..TotalBotList..", so the bot will be rest during: "..restBotTime(Rest_Bot_Time_Milliseconds).."\n\n"..webhookDate().."")

			sleep(Rest_Bot_Time_Milliseconds)

			goto CHANGE

		end

		if Change_Bot_Status == "no" and TotalBotList >= 1 then

			webhookShareInfo("You are using change bot status `false` this is prohibited because it is feared that your bot will be banned, so the bot will be rest during: "..restBotTime(Rest_Bot_Time_Milliseconds).."\n\n"..webhookDate().."")

			sleep(Rest_Bot_Time_Milliseconds)

			connectBot()	

		end

			::CHANGE::

			Start_Bot_List_From = Start_Bot_List_From + 1	

		if Start_Bot_List_From > TotalBotList then

			Start_Bot_List_From = 1

		end

			connectBot()

	end

end



function restBot()

	bot.auto_reconnect = false

	reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,0,23)

	ge = os.time() - g

	if Use_Rest_Bot == "no" then

		reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,0,23)

		return

	end

	if Use_Rest_Bot == "yes" then

		if secondON(ge) <= restBotTime(Rest_Bot_Time_Milliseconds) then

			reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,0,23)

			return

		else

			reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,0,23)

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<a:clocksandsz:978628852832165968> **|** Bot Rest Time: "..restBotTime(Rest_Bot_Time_Milliseconds).."\n\n"..webhookDate().."")

			sleep(1000)

			bot:disconnect()

			sleep(3000)

			local currentBot = table.remove(Bot_List, Start_Bot_List_From)

			table.insert(Bot_List, currentBot)

			Start_Bot_List_From = 0

			changeBotStatus()

		end

	end

end



----- Block Place -----

function excludeBlock()

	bot.auto_reconnect = false

	for _, excludeBlockList in ipairs(Exclude_Block) do

		while world:getTile(math.floor(world:getLocal().posx / 32),math.floor(world:getLocal().posy / 32)).fg == excludeBlockList or world:getTile(math.floor(world:getLocal().posx / 32),math.floor(world:getLocal().posy / 32)).bg == excludeBlockList do

			reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,0,23)

			bot:hit(math.floor(world:getLocal().posx / 32), math.floor(world:getLocal().posy / 32))

			sleep(Hit_Block_Delay)

		end

		while world:getTile(math.floor(world:getLocal().posx / 32 - 1),math.floor(world:getLocal().posy / 32)).fg == excludeBlockList or world:getTile(math.floor(world:getLocal().posx / 32 - 1),math.floor(world:getLocal().posy / 32)).bg == excludeBlockList do

			reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,0,23)

			bot:hit(math.floor(world:getLocal().posx / 32 - 1), math.floor(world:getLocal().posy / 32))

			sleep(Hit_Block_Delay)

		end

		while world:getTile(math.floor(world:getLocal().posx / 32 + 1),math.floor(world:getLocal().posy / 32)).fg == excludeBlockList or world:getTile(math.floor(world:getLocal().posx / 32 + 1),math.floor(world:getLocal().posy / 32)).bg == excludeBlockList do

			reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,0,23)

			bot:hit(math.floor(world:getLocal().posx / 32 + 1), math.floor(world:getLocal().posy / 32))

			sleep(Hit_Block_Delay)

		end

		while world:getTile(math.floor(world:getLocal().posx / 32),math.floor(world:getLocal().posy / 32 - 1)).fg == excludeBlockList or world:getTile(math.floor(world:getLocal().posx / 32),math.floor(world:getLocal().posy / 32 - 1)).bg == excludeBlockList do

			reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,0,23)

			bot:hit(math.floor(world:getLocal().posx / 32), math.floor(world:getLocal().posy / 32 - 1))

			sleep(Hit_Block_Delay)

		end

		while world:getTile(math.floor(world:getLocal().posx / 32),math.floor(world:getLocal().posy / 32 + 1)).fg == excludeBlockList or world:getTile(math.floor(world:getLocal().posx / 32),math.floor(world:getLocal().posy / 32 + 1)).bg == excludeBlockList do

			reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,0,23)

			bot:hit(math.floor(world:getLocal().posx / 32), math.floor(world:getLocal().posy / 32 + 1))

			sleep(Hit_Block_Delay)

		end

	end

end



---- Plant ----

function webhookPlant()

	ge = os.time() - g

	webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<a:toa:997296837352505415> **|** Script Name: "..ScriptName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n<a:warn:1003200385315516516> **|** Bot Level: "..bot.level.."\n<:100gems:988942738466684978> **|** Gems Amount: "..bot.gem_count.."\n\n**[ WORLD INFORMATION ]**\n:globe_with_meridians: **|** Current Farm World: `"..Rotation_World[Start_From]:upper().."`\n=> `[Farm World "..Start_From.." of "..TotalRotationWorld.." World]`\n<a:warn:1003200385315516516> **|** Farm Door ID: ||"..WorldAndDoorIDCensor.."||\n\n:globe_with_meridians: **|** Seed Storage World: `"..Save_Seed_World.."`\n<a:warn:1003200385315516516> **|** Seed Storage Door ID: ||"..WorldAndDoorIDCensor.."||\n\n:globe_with_meridians: **|** Pack Storage World: `"..Save_Pack_World.."`\n<a:warn:1003200385315516516> **|** Pack Storage Door ID: ||"..WorldAndDoorIDCensor.."||\n\n**[ TREE INFORMATION ]**\n<:pohon:1007595269199769680> **|** Farmed Tree: "..getItemByID(Block_ID).."\n<:pohon:1007595269199769680> **|** Ready Tree Amount: "..readyTreeScan().."\n<:pohon:1007595269199769680> **|** Unready Tree Amount: "..unreadyTreeScan().."\n\n**[ FOSSIL INFORMATION ]**\n<:posil:989484591029026867> **|** Fossil Rock Amount: "..fossilRockScan().."\n\n**[ TIME INFORMATION ]**\n<a:clocksandsz:978628852832165968> **|** Online Time: "..secondON(ge).."\n<a:clocksandsz:978628852832165968> **|** Looping Time: "..secondR(kalanzamansaniye6).." Minutes\n\n"..webhookDate().."")

end



function plant()

	while bot.status ~= 1 and noStopScript == true do

		bot.auto_reconnect = false

		reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,0,23)

		sleep(3000)

		bot.auto_reconnect = true

	end

	getWorldName = bot:getWorld().name

	while getWorldName ~= Rotation_World_Name do

		bot.auto_reconnect = false

		farmWorld()

		sleep(7000)

		bot.auto_reconnect = true

	end

	bot.auto_reconnect = true

	timeRS()

	timeR()

	webhookPlant()

	bot.auto_collect = true

	sleep(500)

	if inventory:getItemCount(Seed_ID) > 0 then

		for _,tile in pairs(world:getTiles()) do

			if tile.fg == 0 and world:getTile(tile.x, tile.y + 1).fg ~= 0 and world:getTile(tile.x, tile.y + 1).fg % 2 == 0 and world:getTile(tile.x, tile.y + 1).fg ~= Block_ID then

				while bot.status == 1 and world.name ~= Rotation_World[Start_From]:upper() do 

					bot.auto_reconnect = false

					reconInfo("<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: `[The bot is offline]`\n\n"..webhookDate().."")

					reconMain2(Rotation_World[Start_From]:upper(),Rotation_Door_ID,1,23)

					sleep(3000)

					bot.auto_reconnect = true

				end

				while world:getTile(math.floor(world:getLocal().posx / 32),math.floor(world:getLocal().posy / 32)).fg == 6 do

					bot.auto_reconnect = false

					reconInfo("<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: `[The bot is offline]`\n\n"..webhookDate().."")

					reconMain2(Rotation_World[Start_From]:upper(),Rotation_Door_ID,1,23)

					sleep(3000)

					bot.auto_reconnect = true

				end

				while getWorldName ~= Rotation_World_Name do

					bot.auto_reconnect = false

					farmWorld()

					sleep(7000)

					bot.auto_reconnect = true

				end

				levelCheck()

				restBot()

				excludeBlock()

				bot.auto_reconnect = true

				bot:findPath(tile.x,tile.y)

				sleep(Plant_Delay)

				bot:place(math.floor(world:getLocal().posx / 32), math.floor(world:getLocal().posy / 32), Seed_ID)

			if inventory:getItemCount(Seed_ID) == 0 then

				bot.auto_reconnect = false

				lastCheck2()

			end

			end

		end

	end

	bot.auto_reconnect = false

	lastCheck2()

end



function plantLast()

	while bot.status ~= 1 and noStopScript == true do

		bot.auto_reconnect = false

		reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,0,23)

		sleep(3000)

		bot.auto_reconnect = true

	end

	getWorldName = bot:getWorld().name

	while getWorldName ~= Rotation_World_Name do

		bot.auto_reconnect = false

		farmWorld()

		sleep(7000)

		bot.auto_reconnect = true

	end

	bot.auto_collect = true 

	sleep(500)

	if inventory:getItemCount(Seed_ID) > 0 then

		for _,tile in pairs(world:getTiles()) do

			if tile.fg == 0 and world:getTile(tile.x, tile.y + 1).fg ~= 0 and world:getTile(tile.x, tile.y + 1).fg % 2 == 0 and world:getTile(tile.x, tile.y + 1).fg ~= Block_ID then

				while bot.status == 1 and world.name ~= Rotation_World[Start_From]:upper() do 

					bot.auto_reconnect = false

					reconInfo("<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: `[The bot is offline]`\n\n"..webhookDate().."")

					reconMain2(Rotation_World[Start_From]:upper(),Rotation_Door_ID,1,23)

					sleep(3000)

					bot.auto_reconnect = true

				end

				while world:getTile(math.floor(world:getLocal().posx / 32),math.floor(world:getLocal().posy / 32)).fg == 6 do

					bot.auto_reconnect = false

					reconInfo("<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: `[The bot is offline]`\n\n"..webhookDate().."")

					reconMain2(Rotation_World[Start_From]:upper(),Rotation_Door_ID,1,23)

					sleep(3000)

					bot.auto_reconnect = true

				end

				while getWorldName ~= Rotation_World_Name do

					bot.auto_reconnect = false

					farmWorld()

					sleep(7000)

					bot.auto_reconnect = true

				end

				levelCheck()

				restBot()

				excludeBlock()

				bot.auto_reconnect = true

				bot:findPath(tile.x,tile.y)

				sleep(Plant_Delay)

				bot:place(math.floor(world:getLocal().posx / 32), math.floor(world:getLocal().posy / 32), Seed_ID)

			if inventory:getItemCount(Seed_ID) == 0 then

				bot.auto_reconnect = false

				lastCheck1()

			end

			end

		end

	end

	bot.auto_reconnect = false

	lastCheck1()

end



---- Drop Item ----

function dropItem(itemID)

	bot:drop(""..itemID.."",inventory:getItemCount(itemID))

	sleep(175)

end



local markerTilesCache = {}

function markerScan(itemID)

    if markerTilesCache[itemID] then

        return markerTilesCache[itemID]

    end

    local markerTiles = {}

    for _, tile in pairs(world:getTiles()) do 

        if tile.fg == itemID or tile.bg == itemID then

            local markerTile = {x = tile.x - 1, y = tile.y}

            table.insert(markerTiles, markerTile)

        end

    end

    markerTilesCache[itemID] = markerTiles

    return markerTiles

end



function dropPack()

	for _,listp in pairs(Custom_Drop_Pack) do

		if inventory:getItemCount(listp) > 0 then

			dropItem(listp)

			sleep(1000)

		end

	end

end



function dropPack1()

    bot.auto_collect = false

	getWorldName = bot:getWorld().name

	while getWorldName ~= Save_Pack_World do

		packWorld()

		sleep(7000)

	end

	while inventory:getItemCount(Custom_Drop_Pack[Table_Pack_Sequence]) >= 1 do

		while getWorldName ~= Save_Pack_World do

			packWorld()

			sleep(7000)

		end

        local markerTiles = markerScan(Drop_Pack_Marker)

        if #markerTiles > 0 then

			reconMain1(Save_Pack_World,Save_Pack_Door_ID,0,0)

            local nextMarkerTile = markerTiles[Start_Drop_Pack]

            bot:findPath(nextMarkerTile.x, nextMarkerTile.y)

            lastTileX = nextMarkerTile.x

            lastTileY = nextMarkerTile.y

			excludeBlock()

            dropPack()

            sleep(1000)

		if inventory:getItemCount(Custom_Drop_Pack[Table_Pack_Sequence]) >= 1 then

			dropPack()

            sleep(1000)

			table.remove(markerTiles, Start_Drop_Pack)

            Start_Drop_Pack = 1

		elseif inventory:getItemCount(Custom_Drop_Pack[Table_Pack_Sequence]) == 0 then

			goto END

		end

		else

			bot.auto_reconnect = false

			autoRecon = false

			bot:disconnect()

			sleep(1000)

			reconStatus()

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `[Your Storage Pack is Full]`\n\n"..webhookDate().."")

			sleep(60000)

		end

    end

    if inventory:getItemCount(Custom_Drop_Pack[Table_Pack_Sequence]) == 0 then

        goto END

    end

	::END::

	reconMain1(Save_Pack_World,Save_Pack_Door_ID,0,0)

	scanFloatTotalPack()

	sleep(100)

end



function scanFloatTotalPack()

	local str = ""

	for _, packlist in pairs(Custom_Drop_Pack) do

		str = str.."\n"..getItemByID(packlist)..": "..floatScan(packlist)

	end

		webhookShareInfo("**[ PACK INFORMATION ]**\n:globe_with_meridians: **|** World Pack: `"..bot:getWorld().name.."`\n:package: **|** Total Pack Dropped:\n"..str.."\n\n"..webhookDate().."")

end



function dropSeed()

    bot.auto_collect = false

	getWorldName = bot:getWorld().name

	while getWorldName ~= Save_Seed_World do

		seedWorld()

		sleep(7000)

	end

	while inventory:getItemCount(Seed_ID) >= 1 do

		while getWorldName ~= Save_Seed_World do

			seedWorld()

			sleep(7000)

		end

        local markerTiles = markerScan(Drop_Seed_Marker)

        if #markerTiles > 0 then

			reconMain1(Save_Seed_World,Save_Seed_Door_ID,0,0)

            local nextMarkerTile = markerTiles[Start_Drop_Seed_Pack]

            bot:findPath(nextMarkerTile.x, nextMarkerTile.y)

            lastTileX = nextMarkerTile.x

            lastTileY = nextMarkerTile.y

			excludeBlock()

            dropItem(Seed_ID)

            sleep(1000)

		if inventory:getItemCount(Seed_ID) >= 1 then

			dropItem(Seed_ID)

            sleep(1000)

			table.remove(markerTiles, Start_Drop_Seed_Pack)

            Start_Drop_Seed_Pack = 1

		elseif inventory:getItemCount(Seed_ID) == 0 then

			goto END

		end

		else

			bot.auto_reconnect = false

			autoRecon = false

			bot:disconnect()

			sleep(1000)

			reconStatus()

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `[Your Storage Seed is Full]`\n\n"..webhookDate().."")

			sleep(60000)

		end

    end

    if inventory:getItemCount(Seed_ID) == 0 then

        goto END

    end

	::END::

	reconMain1(Save_Seed_World,Save_Seed_Door_ID,0,0)

	webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<a:toa:997296837352505415> **|** Bot Information: Dropping Seed\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n<a:warn:1003200385315516516> **|** Bot Level: "..bot.level.."\n<:100gems:988942738466684978> **|** Gems Amount: "..bot.gem_count .."\n\n**[ WORLD INFORMATION ]**\n:globe_with_meridians: **|** Save Seed World: `"..bot:getWorld().name.."`\n:package: **|** Total Seed Dropped: "..floatScan(Seed_ID).."\n\n"..webhookDate().."")

	sleep(100)

end



function dropBlock()

    bot.auto_collect = false

	while getWorldName ~= Save_Seed_World do

		seedWorld()

		sleep(7000)

	end

	while inventory:getItemCount(Block_ID) >= 1 do

		while getWorldName ~= Save_Seed_World do

			seedWorld()

			sleep(7000)

		end

        local markerTiles = markerScan(Drop_Seed_Marker)

        if #markerTiles > 0 then

			reconMain1(Save_Seed_World,Save_Seed_Door_ID,0,0)

            local nextMarkerTile = markerTiles[Start_Drop_Seed_Pack]

            bot:findPath(nextMarkerTile.x, nextMarkerTile.y)

            lastTileX = nextMarkerTile.x

            lastTileY = nextMarkerTile.y

			excludeBlock()

            dropItem(Block_ID)

            sleep(1000)

		if inventory:getItemCount(Block_ID) >= 1 then

			dropItem(Block_ID)

            sleep(1000)

			table.remove(markerTiles, Start_Drop_Seed_Pack)

            Start_Drop_Seed_Pack = 1

		elseif inventory:getItemCount(Block_ID) == 0 then

			goto END

		end

		else

			bot.auto_reconnect = false

			autoRecon = false

			bot:disconnect()

			sleep(1000)

			reconStatus()

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `[Your Storage Block is Full]`\n\n"..webhookDate().."")

			sleep(60000)

		end

    end

    if inventory:getItemCount(Block_ID) == 0 then

        goto END

    end

	::END::

	reconMain1(Save_Seed_World,Save_Seed_Door_ID,0,0)

	webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<a:toa:997296837352505415> **|** Bot Information: Dropping Block\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n<a:warn:1003200385315516516> **|** Bot Level: "..bot.level.."\n<:100gems:988942738466684978> **|** Gems Amount: "..bot.gem_count .."\n\n**[ WORLD INFORMATION ]**\n:globe_with_meridians: **|** Save Block World: `"..bot:getWorld().name.."`\n:package: **|** Total Block Dropped: "..floatScan(Block_ID).."\n\n"..webhookDate().."")

	sleep(100)

end



function lastBreakBlock()

	for _,tile in pairs(world:getTiles()) do

		if tile.fg == Block_ID or tile.bg == Block_ID then

			sleep(100)

			bot:findPath(tile.x,tile.y + 1)

			sleep(100)

		while world:getTile(tile.x,tile.y).fg == Block_ID or world:getTile(tile.x,tile.y).bg == Block_ID do

			bot:hit(tile.x,tile.y - 1)

			sleep(110)

		end

		end

	end

end



function lastCheck()

	lastBreakBlock()

	timeEnd()

	sleep(500)

	if inventory:getItemCount(Seed_ID) > 0 then

		sleep(100)	

		seedWorld()

		sleep(1000)

		dropSeed()

		sleep(1000)

	end

	if inventory:getItemCount(Block_ID) > 0 then

		sleep(100)	

		seedWorld()

		sleep(1000)

		dropBlock()

		sleep(1000)

	end

	if bot.gem_count > Pack_Price then

		sleep(100)

		packWorld()

		local maxBuy = 0

		while bot.gem_count > Pack_Price and maxBuy < Max_Buy_Pack do

			maxBuy = maxBuy + 1

			upgradeBackpack()

			bot:buy(Pack_Name_To_Buy)

			sleep(Auto_Buy_Delay)

		if inventory:getItemCount(Custom_Drop_Pack[Table_Pack_Sequence]) >= 100 then goto END end

		end

			::END::

			sleep(1000)

			dropPack1()

			sleep(1000)

			loopStatus()

	else

			loopStatus()

	end

end



function lastCheck1()

	if tileScan() == Remaining_Tile then

		goto END

	else

	while tileScan() > Remaining_Tile do

		sleep(2000)

		if inventory:getItemCount(Seed_ID) == 0 then

			takeSeed()

		end

		sleep(100)

		plantLast()

	end

	end

	::END::

	lastCheck()

end



function lastCheck2()

	while bot.status ~= 1 and noStopScript == true do

		reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,1,1)

	end

	if inWorldScan(Seed_ID) == 0 and tileScan() == Remaining_Tile then

		goto END

	else

	while inWorldScan(Seed_ID) > 0 do

		reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,1,1)

		sleep(100)

		if inventory:getItemCount(Seed_ID) > 0 then

			sleep(100)	

			seedWorld()

			sleep(1000)

			dropSeed()

			sleep(1000)

			takeItem(Block_ID)

			sleep(1000)

			farmWorld()

		end

		harvest()

	end

	end

	::END::

	reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,1,1)

	pnbLast1()

end



function loopStatus()

	if bot:isInWorld(Rotation_World[Start_From]:upper()) then

		if Offline_After_Rotation_Completed == "no" then

			nextWorldLoop()

		else

			nextWorldNoLoop()

		end

	end

end



function seedWorld1()

	sleep(100)

	seedWorld()

	sleep(1000)

	dropSeed()

	sleep(1000)

	takeItem(Block_ID)

	sleep(1000)

	farmWorld()

	sleep(1000)

	findpathBreak()

	bot.auto_collect = true

end



---- Next World ----

function nextWorldLoop()

	if Farming_Status == false then 

		return

	end

	

		webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<a:toa:997296837352505415> **|** Bot Information: Next World\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n<a:warn:1003200385315516516> **|** Bot Level: "..bot.level.."\n\n**[ ESTIMATED TIME ]**\n:globe_with_meridians: **|** World Status: `"..Rotation_World[Start_From]:upper().."` Finished\n=> `[Farm World "..Start_From.." of "..TotalRotationWorld.." World]`\n<a:clocksandsz:978628852832165968> **|** Estimated End Time:\n**"..sonsaaat.." Hours, "..sondakika.." Minutes/"..job.." Tree**\n\n"..webhookDate().."")

		Start_From = Start_From + 1

	if Start_From <= TotalRotationWorld then

		Rotation_World_Name = Rotation_World[Start_From]:upper()

		sleep(2000)

		main()

		sleep(2000)

		lastCheck2()

	else

		Start_From = 1

		Rotation_World_Name = Rotation_World[Start_From]:upper()

		sleep(2000)

		main()

		sleep(2000)

		lastCheck2()

	end

end



function nextWorldNoLoop()

	webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<a:toa:997296837352505415> **|** Bot Information: Next World\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n<a:warn:1003200385315516516> **|** Bot Level: "..bot.level.."\n\n**[ ESTIMATED TIME ]**\n:globe_with_meridians: **|** World Status: `"..Rotation_World[Start_From]:upper().."` Finished\n=> `[Farm World "..Start_From.." of "..TotalRotationWorld.." World]`\n<a:clocksandsz:978628852832165968> **|** Estimated End Time:\n**"..sonsaaat.." Hours, "..sondakika.." Minutes/"..job.." Tree**\n\n"..webhookDate().."")

	Start_From = Start_From + 1

	if Start_From <= TotalRotationWorld then

		Rotation_World_Name = Rotation_World[Start_From]:upper()

		sleep(2000)

		main()

		sleep(2000)

		lastCheck2()

	else

		Start_From = Start_From - 1

		Rotation_World_Name = Rotation_World[Start_From]:upper()

		sleep(2000)

		bot.auto_reconnect = false

		autoRecon = false

		Farming_Status = false

		sleep(1000)

		bot:sendPacket(3, "action|quit")

		sleep(3500)

		reconStatus()

		webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<a:toa:997296837352505415> **|** Bot Information: Rotation Complete, Bot Offline!\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		sleep(1000)

	end

end



function findpathBreak()

	sleep(350)

	bot:findPath(X_Break,Y_Break)

	sleep(1000)

	while math.floor(world:getLocal().posx / 32) ~= X_Break and math.floor(world:getLocal().posy / 32) ~= Y_Break do

		bot:findPath(X_Break,Y_Break)

		sleep(1000)

	end

end



---- Main Function ----

function changeBotAddBotFirst()

	if TotalBotList == 0 and noStopScript == true then

		bot.auto_reconnect = false

		autoRecon = false

		noStopScript = false

		bot:disconnect()

		sleep(1000)

		webhookShareInfo("Your total bots in the bot list is only "..TotalBotList..", so the script at this index will stop running.\n\n"..webhookDate().."")

	end

	

	if noStopScript == true then

			Start_Bot_List_From = Start_Bot_List_From + 1

		if Start_Bot_List_From > TotalBotList then

			Start_Bot_List_From = 1

		end

			addBotFirst()

	end

end



function addBotFirst()

	bot.auto_reconnect = false

	BotName = Bot_List[Start_Bot_List_From][1]:gsub("`.",'')

	if Bot_Format == "normal" then

		bot:updateBot(Bot_List[Start_Bot_List_From][1], Bot_List[Start_Bot_List_From][2], Bot_List[Start_Bot_List_From][3], Bot_List[Start_Bot_List_From][4])

		sleep(1000)

	elseif Bot_Format == "ubi" then

		bot:updateUbiBot(Bot_List[Start_Bot_List_From][1], Bot_List[Start_Bot_List_From][2])

		sleep(1000)

	end

		bot:connect()

		sleep(Reconnect_Delay)

	while bot.status ~= 1 and noStopScript == true do

		reconStatus()

		if bot.status ~= 1 and bot.status == BotStatus.wrong_password then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")		

			table.remove(Bot_List, Start_Bot_List_From)

			TotalBotList = #Bot_List

			Start_Bot_List_From = 0

			changeBotAddBotFirst()

		elseif bot.status ~= 1 and bot.status == BotStatus.account_banned then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

			table.remove(Bot_List, Start_Bot_List_From)

			TotalBotList = #Bot_List

			Start_Bot_List_From = 0

			changeBotAddBotFirst()

		elseif bot.status ~= 1 and bot.status == BotStatus.location_banned then 

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")		

		elseif bot.status ~= 1 and bot.status == BotStatus.version_update then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		elseif bot.status ~= 1 and bot.status == BotStatus.advanced_account_protection then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

			table.remove(Bot_List, Start_Bot_List_From)

			TotalBotList = #Bot_List

			Start_Bot_List_From = 0

			changeBotAddBotFirst()

		elseif bot.status ~= 1 and bot.status == BotStatus.server_overload then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		elseif bot.status ~= 1 and bot.status == BotStatus.too_many_login then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		elseif bot.status ~= 1 and bot.status == BotStatus.maintenance then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		elseif bot.status ~= 1 and bot.status == BotStatus.http_block then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

		elseif bot.status ~= 1 and bot.status == BotStatus.captcha_requested then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n\n"..webhookDate().."")

			table.remove(Bot_List, Start_Bot_List_From)

			TotalBotList = #Bot_List

			Start_Bot_List_From = 0

			changeBotAddBotFirst()

		end

		bot:connect()

		sleep(Reconnect_Delay)

	end

	sleep(10000)

	reconStatus()

	if Use_Max_Level_Status == "yes" then

		if bot.status == 1 and bot.level >= Max_Level then

			webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `[Your level has reached or exceeded the maximum level set]`\n\n"..webhookDate().."")

			table.remove(Bot_List, Start_Bot_List_From)

			TotalBotList = #Bot_List

			Start_Bot_List_From = 0

			changeBotAddBotFirst()

		end

	end

	g = os.time()

	ge = os.time() - g

	BotName = Bot_List[Start_Bot_List_From][1]:gsub("`.",'')

	webhookShareInfo("**[ BOT INFORMATION ]**\n<:growbot:992058196439072770> **|** Bot Name: "..BotName.."\n<a:toa:997296837352505415> **|** Script Name: "..ScriptName.."\n<:status:1007595490600288326> **|** Bot Status: "..botStatus.."\n=> `["..statusBotDescription().."]`\n<a:warn:1003200385315516516> **|** Bot Level: "..bot.level.."\n<:100gems:988942738466684978> **|** Gems Amount: "..bot.gem_count.."\n\n**[ WORLD INFORMATION ]**\n:globe_with_meridians: **|** Current Farm World: `"..Rotation_World[Start_From]:upper().."`\n=> `[Farm World "..Start_From.." of "..TotalRotationWorld.." World]`\n <a:warn:1003200385315516516> **|** Farm Door ID: ||"..WorldAndDoorIDCensor.."||\n\n:globe_with_meridians: **|** Seed Storage World: `"..Save_Seed_World.."`\n <a:warn:1003200385315516516> **|** Seed Storage Door ID: ||"..WorldAndDoorIDCensor.."||\n\n:globe_with_meridians: **|** Pack Storage World: `"..Save_Pack_World.."`\n <a:warn:1003200385315516516> **|** Pack Storage Door ID: ||"..WorldAndDoorIDCensor.."||\n\n**[ TREE INFORMATION ]**\n<:pohon:1007595269199769680> **|** Farmed Tree: "..getItemByID(Block_ID).."\n\n**[ TIME INFORMATION ]**\n<a:clocksandsz:978628852832165968> **|** Online Time: "..secondON(ge).."\n\n"..webhookDate().."")

	sleep(100)

	webhookShareInfoAds(":pushpin: **|** Buy other script only at Mushida Scripts.\nReport bugs here https://discord.gg/JZ6YBDhsbQ.\n\n"..webhookDate().."")

	sleep(100)

	bot:getLog():append("...............................................................\n[MUSHIDA SCRIPTS] Script Started!\n\nBuy other script only at Mushida Scripts.\nReport bugs here https://discord.gg/JZ6YBDhsbQ.\n...............................................................\n\n"..webhookDate().."")

	sleep(100)

	main()

end



function main()

	while bot.status ~= 1 and noStopScript == true do

		reconMain1(Rotation_World[Start_From]:upper(),Rotation_Door_ID,1,1)

	end

	if inventory:getItemCount(Pickaxe_ID) >= 2 then

		reconMain1(Take_Pickaxe_World,Take_Pickaxe_Door_ID,1,1)

		sleep(1000)

		bot:warp(""..Take_Pickaxe_World.."")

		sleep(Join_World_Delay)

		bot:warp(""..Take_Pickaxe_World.."|"..Take_Pickaxe_Door_ID.."")

		sleep(3000)

		dropPickaxe()

		sleep(1000)

	end

		takePickaxe()

		sleep(100)

		bot:warp(""..Rotation_World[Start_From]:upper().."")

		sleep(Join_World_Delay)

		trashItem()

		sleep(2000)

		bot:warp(""..Rotation_World[Start_From]:upper().."|"..Rotation_Door_ID.."")

		sleep(3000)

		timeStart()

	if inWorldScan(Seed_ID) == 0 then

		loopStatus()

	end

		bot.auto_collect = true

		sleep(100)

		lastCheck2()

end



function continue()

	if pcall(function() lastCheck2() end) == false then

		sleep(100)

		continue()

	end

		sleep(100)

		continue()

end



addProxyMain()

sleep(1000)

addBotFirst()
