-----------------------------------------------------------------------------------------------------
--------------------------------------- ** Contract System ** ---------------------------------------
-----------------------------------------------------------------------------------------------------
--------------------------------- ** Author: V3ct0r @ PKOdev.NET ** ---------------------------------
------------------------------- ** Revision: Angelix @ PKOdev.NET  ** -------------------------------
-----------------------------------------------------------------------------------------------------
----- Version: 1.0 (01/12/2022) @ V3ct0r
----- * Public Version.
----- Version: 1.1 (05/11/2022) @ Angelix
----- * Change script structure.
----- * Added random world contract creation.
----- * Modified reward handler to have several different rewards.
-----------------------------------------------------------------------------------------------------

ContractSys = ContractSys or {Conf = {World = {}, Maps = {}}, Text = {}, Attr = {}, Monsters = {}, Rewards = {Maps = {}, Specific = {}}}

ContractSys.Conf.Enabled = false	--  Enable/disable the system.
ContractSys.Conf.ItemID = 05700		--  ItemID used in system.
ContractSys.Conf.ItemType = 99		--	Item's type used.
ContractSys.Conf.Limit = 5			--	Maximum amount of contracts a player can have at a single time.
ContractSys.Conf.Random = true		--	Update only one contract even if they have several contracts for the same monster? If 'true', it will be at random. If 'false', it will update all.

ContractSys.Conf.World.Enabled = true   --  Enable/disable getting random contracts from any place.

ContractSys.Conf.Maps['default'] = {Allow = false, Probability = 10}
ContractSys.Conf.Maps['garner'] = {Allow = false, Probability = 10}
ContractSys.Conf.Maps['magicsea'] = {Allow = false, Probability = 10}
ContractSys.Conf.Maps['darkblue'] = {Allow = false, Probability = 10}
ContractSys.Conf.Maps['abandonedcity'] = {Allow = false, Probability = 10}
ContractSys.Conf.Maps['darkswamp'] = {Allow = false, Probability = 10}
ContractSys.Conf.Maps['puzzleworld'] = {Allow = false, Probability = 10}

ContractSys.Conf.Maps['abandonedcity2'] = ContractSys.Conf.Maps['abandonedcity']
ContractSys.Conf.Maps['abandonedcity3'] = ContractSys.Conf.Maps['abandonedcity']
ContractSys.Conf.Maps['puzzleworld2'] = ContractSys.Conf.Maps['puzzleworld']

ContractSys.Text.Received = 'Obtained a contract to hunt %d x [%s]!'
ContractSys.Text.Remaining = 'Contract: Remaining %s to hunt: %d / %d!'
ContractSys.Text.Complete = 'Contract to hunt [%s] is complete!'
ContractSys.Text.Unfinished = 'Contract is not complete yet. Killed [%s]: (%d / %d).'
ContractSys.Text.Completed = 'You have successfully completed the contract, congratulations!'
ContractSys.Text.LimitReach = 'You cannot have more than %d contracts active at the same time!'

--  Monster Configuration.
ContractSys.Monsters.General = {
    {Allow = true, ID = 103, Min = 01, Max = 02, Rate = 001},	--	Forest Spirit
	{Allow = true, ID = 075, Min = 01, Max = 02, Rate = 001},	--	Mystic Shrub
	{Allow = true, ID = 185, Min = 01, Max = 02, Rate = 001},	--	Mystic Flower
                                }
ContractSys.Monsters['abandonedcity'] = {
	{Allow = true, ID = 720, Min = 10, Max = 15, Rate = 080},	--	Elite Wailing Warrior
	{Allow = true, ID = 721, Min = 10, Max = 15, Rate = 080},	--	Wailing Marksman
	{Allow = true, ID = 722, Min = 10, Max = 15, Rate = 080},	--	Cursed Mummy
	{Allow = true, ID = 723, Min = 10, Max = 15, Rate = 080},	--	Crazy Mummy
	{Allow = true, ID = 686, Min = 05, Max = 10, Rate = 040},	--	Sorrow Warrior
	{Allow = true, ID = 687, Min = 05, Max = 10, Rate = 040},	--	Wailing Warrior
	{Allow = true, ID = 688, Min = 05, Max = 10, Rate = 040},	--	Wailing Archer
	{Allow = true, ID = 689, Min = 05, Max = 10, Rate = 040},	--	Sorrow Archer
	{Allow = true, ID = 690, Min = 01, Max = 01, Rate = 020},	--	Sorrow Captain
	{Allow = true, ID = 691, Min = 01, Max = 01, Rate = 020},	--	Wailing Captain
	{Allow = true, ID = 692, Min = 01, Max = 01, Rate = 020},	--	Wailing Archer Captain
	{Allow = true, ID = 693, Min = 01, Max = 01, Rate = 020},	--	Sorrow Archer Captain
	{Allow = true, ID = 712, Min = 01, Max = 02, Rate = 010},	--	Abandoned Chest 1
	{Allow = true, ID = 713, Min = 01, Max = 02, Rate = 010},	--	Abandoned Chest 2
	{Allow = true, ID = 714, Min = 01, Max = 02, Rate = 010},	--	Abandoned Chest 3
	{Allow = true, ID = 673, Min = 01, Max = 01, Rate = 005},	--	Death Knight
								}
ContractSys.Monsters['darkswamp'] = {
	{Allow = true, ID = 695, Min = 10, Max = 30, Rate = 080},	--	Swamp Bog
	{Allow = true, ID = 696, Min = 10, Max = 30, Rate = 080},	--	Swamp Man
	{Allow = true, ID = 697, Min = 10, Max = 30, Rate = 080},	--	Swamp Watcher
	{Allow = true, ID = 698, Min = 10, Max = 30, Rate = 080},	--	Swamp Warden
	{Allow = true, ID = 701, Min = 10, Max = 30, Rate = 040},	--	Jungle Guardian
	{Allow = true, ID = 706, Min = 01, Max = 01, Rate = 020},	--	Master Swamp Bog
	{Allow = true, ID = 707, Min = 01, Max = 01, Rate = 020},	--	Swamp Champion
	{Allow = true, ID = 708, Min = 01, Max = 01, Rate = 020},	--	Master Swamp Watcher
	{Allow = true, ID = 709, Min = 01, Max = 02, Rate = 010},	--	Obscure Chest 1
	{Allow = true, ID = 710, Min = 01, Max = 02, Rate = 010},	--	Obscure Chest 2
	{Allow = true, ID = 711, Min = 01, Max = 02, Rate = 010},	--	Obscure Chest 3
	{Allow = true, ID = 675, Min = 01, Max = 01, Rate = 005},	--	Huge Mud Monster
								}
ContractSys.Monsters['puzzleworld'] = {
	{Allow = true, ID = 669, Min = 10, Max = 30, Rate = 080},	--	Imaginary Snow Doll
	{Allow = true, ID = 670, Min = 10, Max = 30, Rate = 080},	--	Snow Doll Spirit
	{Allow = true, ID = 671, Min = 10, Max = 30, Rate = 040},	--	Evil Snow Doll Spirit
	{Allow = true, ID = 672, Min = 10, Max = 30, Rate = 040},	--	Confused Snow Doll
	{Allow = true, ID = 725, Min = 10, Max = 30, Rate = 020},	--	Demonic Snowman
	{Allow = true, ID = 726, Min = 01, Max = 01, Rate = 020},	--	Demonic Yeti
	{Allow = true, ID = 715, Min = 01, Max = 02, Rate = 010},	--	Chest of Demonic World 1
	{Allow = true, ID = 716, Min = 01, Max = 02, Rate = 010},	--	Chest of Demonic World 2
	{Allow = true, ID = 679, Min = 01, Max = 01, Rate = 005},	--	Wandering Soul
	{Allow = true, ID = 678, Min = 01, Max = 01, Rate = 005},	--	Snowman Warlord
								}
ContractSys.Monsters['abandonedcity2'] = ContractSys.Monsters['abandonedcity']
ContractSys.Monsters['abandonedcity3'] = ContractSys.Monsters['abandonedcity']
ContractSys.Monsters['puzzleworld2'] = ContractSys.Monsters['puzzleworld']

--  When selecting a reward to handle out, it will first look if there's a monster specified in the "Specific" table.
--  If no monster is found, it will then look through the "Maps" table, if none is found, it will choose a reward from "General".
ContractSys.Rewards.General = {
	{Allow = true, Gold = 0, ID = 00860, Min = 01, Max = 01, Quality = 101, Rate = 010},	--	Gem of the Wind
	{Allow = true, Gold = 0, ID = 00861, Min = 01, Max = 01, Quality = 101, Rate = 010},	--	Gem of Striking
	{Allow = true, Gold = 0, ID = 00862, Min = 01, Max = 01, Quality = 101, Rate = 010},	--	Gem of Colossus
	{Allow = true, Gold = 0, ID = 00863, Min = 01, Max = 01, Quality = 101, Rate = 010},	--	Gem of Rage
	{Allow = true, Gold = 0, ID = 01012, Min = 01, Max = 01, Quality = 101, Rate = 010},	--	Gem of Soul
								}

ContractSys.Rewards.Maps['abandonedcity'] = {
	{Allow = true, Gold = 0, ID = 00860, Min = 01, Max = 01, Quality = 101, Rate = 010},	--	Gem of the Wind
	{Allow = true, Gold = 0, ID = 00861, Min = 01, Max = 01, Quality = 101, Rate = 010},	--	Gem of Striking
	{Allow = true, Gold = 0, ID = 00862, Min = 01, Max = 01, Quality = 101, Rate = 010},	--	Gem of Colossus
	{Allow = true, Gold = 0, ID = 00863, Min = 01, Max = 01, Quality = 101, Rate = 010},	--	Gem of Rage
	{Allow = true, Gold = 0, ID = 01012, Min = 01, Max = 01, Quality = 101, Rate = 010},	--	Gem of Soul
								}
ContractSys.Rewards.Maps['abandonedcity2'] = ContractSys.Rewards.Maps['abandonedcity']
ContractSys.Rewards.Maps['abandonedcity3'] = ContractSys.Rewards.Maps['abandonedcity']
ContractSys.Rewards.Maps['darkswamp'] = ContractSys.Rewards.Maps['abandonedcity']
ContractSys.Rewards.Maps['puzzleworld'] = ContractSys.Rewards.Maps['abandonedcity']
ContractSys.Rewards.Maps['puzzleworld2'] = ContractSys.Rewards.Maps['abandonedcity']
																
ContractSys.Rewards.Specific[0673] = {
	{Allow = true, Gold = 0, ID = 00860, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of the Wind
	{Allow = true, Gold = 0, ID = 00861, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of Striking
	{Allow = true, Gold = 0, ID = 00862, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of Colossus
	{Allow = true, Gold = 0, ID = 00863, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of Rage
	{Allow = true, Gold = 0, ID = 01012, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of Soul
	{Allow = true, Gold = 0, ID = 03422, Min = 01, Max = 01, Quality = 004, Rate = 001},	--	Chest of Forsaken City
	{Allow = true, Gold = 0, ID = 00938, Min = 01, Max = 01, Quality = 004, Rate = 001},	--	Goddess's Favor
								}
																
ContractSys.Rewards.Specific[0675] = {
	{Allow = true, Gold = 0, ID = 00860, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of the Wind
	{Allow = true, Gold = 0, ID = 00861, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of Striking
	{Allow = true, Gold = 0, ID = 00862, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of Colossus
	{Allow = true, Gold = 0, ID = 00863, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of Rage
	{Allow = true, Gold = 0, ID = 01012, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of Soul
	{Allow = true, Gold = 0, ID = 03423, Min = 01, Max = 01, Quality = 004, Rate = 001},	--	Chest of Dark Swamp
	{Allow = true, Gold = 0, ID = 00938, Min = 01, Max = 01, Quality = 004, Rate = 001},	--	Goddess's Favor
								}
																
ContractSys.Rewards.Specific[0679] = {
	{Allow = true, Gold = 0, ID = 00860, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of the Wind
	{Allow = true, Gold = 0, ID = 00861, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of Striking
	{Allow = true, Gold = 0, ID = 00862, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of Colossus
	{Allow = true, Gold = 0, ID = 00863, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of Rage
	{Allow = true, Gold = 0, ID = 01012, Min = 01, Max = 01, Quality = 101, Rate = 001},	--	Gem of Soul
	{Allow = true, Gold = 0, ID = 03424, Min = 01, Max = 01, Quality = 004, Rate = 001},	--	Chest of Demonic World
	{Allow = true, Gold = 0, ID = 03458, Min = 01, Max = 01, Quality = 004, Rate = 001},	--	Chest of Enigma
								}
																
ContractSys.Rewards.Specific[678] = ContractSys.Rewards.Specific[679]
								
ContractSys.RewardHandler = function(Player, Item)
    local RewardList = ContractSys.Rewards.General
	Player = TurnToCha(Player)
	local TargetID  = GetItemAttr(Item, ContractSys.Attr.TargetID)
	local TargetMax = GetItemAttr(Item, ContractSys.Attr.TargetMax)
	local TargetCur = GetItemAttr(Item, ContractSys.Attr.TargetCur)
    if ContractSys.Rewards.Specific[TargetID] then
        RewardList = ContractSys.Rewards.Specific[TargetID]
    else
        for MapName, Var in pairs(ContractSys.Monsters) do
            if MapName ~= 'General' then
                for _, Monster in pairs(Var) do
                    if Monster.ID == TargetID then
                        RewardList = ContractSys.Rewards.Maps[MapName]
                    end
                end
            end
        end
    end
	local Chance = 0
	for _, Reward in pairs(RewardList) do
		if Reward.Allow then
			Chance = Chance + (RewardList.Rate or 1)
		end
	end
	local R = math.random() * Chance
	for _, Reward in pairs(RewardList) do
		if R < Reward.Rate and Reward.Allow then
			if Reward.Gold ~= 0 then
				AddMoney(Player, 0, Reward.Gold)
				break
			end
			if Reward.ID ~= 0 and GetItemName(Reward.ID) ~= 'Unknown' then
                local Quantity = math.random(Reward.Min, Reward.Max)
				GiveItem(Player, 0, Reward.ID, math.max(Quantity, 1), (Reward.Quality or 4))
				break
			end
		else
			R = R - Reward.Rate
	    end
	end
end

---------------------------------------
-- Constants
---------------------------------------
ContractSys.Attr.TargetID = ITEMATTR_VAL_STR
ContractSys.Attr.TargetMax = ITEMATTR_VAL_AGI
ContractSys.Attr.TargetCur = ITEMATTR_VAL_DEX

---------------------------------------
-- Hooks
---------------------------------------

ContractSys.OriginalCreat_Item = Creat_Item
Creat_Item = function(Item, ItemType, ItemLevel, ItemEvent)
	if ItemType == ContractSys.Conf.ItemType then
		Reset_item_add()
		Add_Item_Attr(ContractSys.Attr.TargetID,  0)
		Add_Item_Attr(ContractSys.Attr.TargetMax, 0)
		Add_Item_Attr(ContractSys.Attr.TargetCur, 0)
		return item_add.cnt,
			item_add.attr[1][1], item_add.attr[1][2],
			item_add.attr[2][1], item_add.attr[2][2],
			item_add.attr[3][1], item_add.attr[3][2],
			item_add.attr[4][1], item_add.attr[4][2],
			item_add.attr[5][1], item_add.attr[5][2],
			item_add.attr[6][1], item_add.attr[6][2],
			item_add.attr[7][1], item_add.attr[7][2]
	end
	return ContractSys.OriginalCreat_Item(Item, ItemType, ItemLevel, ItemEvent)
end

ContractSys.OriginalGetExp_PKM = GetExp_PKM
GetExp_PKM = function(Monster, Player)
	ContractSys.OriginalGetExp_PKM(Monster, Player)

    if not ContractSys.Conf.Enabled then
        return
    end
	Player = TurnToCha(Player)
	local MapName = GetChaMapName(Player)
	
	local ContractCount = CheckBagItem(Player, ContractSys.Conf.ItemID)
	if (ContractCount > 0) then
		local MonsterID = GetChaTypeID(Monster)
		local Contracts = {}
		local Count = 0

		for Slot = 0, (GetKbCap(Player) - 1), 1 do
			local Item = GetChaItem(Player, 2, Slot)
			if GetItemID(Item) == ContractSys.Conf.ItemID and GetItemType(Item) == 99 then
				local TargetID = GetItemAttr(Item, ContractSys.Attr.TargetID)
				if MonsterID == TargetID then
					local TargetCur = GetItemAttr(Item, ContractSys.Attr.TargetCur)
					local TargetMax = GetItemAttr(Item, ContractSys.Attr.TargetMax)
					if TargetCur < TargetMax then
						Count = Count + 1
						Contracts[Count] = {Item = Item, Cur = TargetCur, Max = TargetMax }
					end
				end
			end
		end
		if Count > 0 then
			if ContractSys.Conf.Random then
				local r = math.random(1, Count)
				Contracts[r].Cur = Contracts[r].Cur + 1
				SetItemAttr(Contracts[r].Item, ContractSys.Attr.TargetCur, Contracts[r].Cur)
				SynChaKitbag(Player, 13)
				if Contracts[r].Cur < Contracts[r].Max then
					BickerNotice(Player, string.format(ContractSys.Text.Remaining, GetMonsterName(MonsterID), Contracts[r].Cur, Contracts[r].Max))
				else
					BickerNotice(Player, string.format(ContractSys.Text.Complete, GetMonsterName(MonsterID)))
				end
			else
				for Num, Var in pairs(Contracts) do
					Var.Cur = Var.Cur + 1
					SetItemAttr(Var.Item, ContractSys.Attr.TargetCur, Var.Cur)
					SynChaKitbag(Player, 13)
					if Var.Cur < Var.Max then
						BickerNotice(Player, string.format(ContractSys.Text.Remaining, GetMonsterName(MonsterID), Var.Cur, Var.Max))
					else
						BickerNotice(Player, string.format(ContractSys.Text.Complete, GetMonsterName(MonsterID)))
					end
				end
			end
		end
	end
    if ContractSys.Conf.World.Enabled then
		if ContractCount >= ContractSys.Conf.Limit then
			SystemNotice(Player, string.format(ContractSys.Text.LimitReach, ContractSys.Conf.Limit))
			return
		end
		ContractSys.Conf.Maps[MapName] = ContractSys.Conf.Maps[MapName] or ContractSys.Conf.Maps['default']
		local Random = math.random(1, 100)
        if ContractSys.Conf.Maps[MapName].Allow and Random <= ContractSys.Conf.Maps[MapName].Probability then
            local ChosenID, Quantity = ContractSys.SelectContract(Player)
            ContractSys.CreateContract(Player, ChosenID, Quantity)
        end
    end
end
ContractSys.SelectContract = function(Player)
    local MapName = GetChaMapName(Player)
    local MonsterList = nil
    if ContractSys.Monsters[MapName] then
        MonsterList = ContractSys.Monsters[MapName]
    else
        MonsterList = ContractSys.Monsters.General
    end
	local Chance = 0
	for _, Monster in pairs(MonsterList) do
		if Monster.Allow then
			Chance = Chance + (Monster.Rate or 1)
		end
	end
	local R = math.random() * Chance
	for _, Monster in pairs(MonsterList) do
		if R < Monster.Rate and Monster.Allow then
			return Monster.ID, math.random(Monster.Min, Monster.Max)
		else
			R = R - Monster.Rate
	    end
	end
end
ContractSys.CreateContract = function(Player, TargetID, Amount)
	if not ContractSys.Conf.Enabled then
		return LUA_FALSE, nil, 0
	end
	Player = TurnToCha(Player)

	if KitbagLock(Player, 0) == LUA_FALSE then
		return LUA_FALSE, nil, 0
	end
	if GetChaFreeBagGridNum(Player) == 0 then
		return LUA_FALSE, nil, 0
	end
	local r1, r2 = MakeItem(Player, ContractSys.Conf.ItemID, 1, 4)
	if r1 == 0 then
		LG("pkodev.Contract", "Can't create the Contract item (id:", ContractSys.Conf.ItemID, ")!") 
		return LUA_FALSE, nil, 0
	end

	local Item = GetChaItem(Player, 2, r2)
	local SetTargetID = SetItemAttr(Item, ContractSys.Attr.TargetID, TargetID)
	local SetTargetMax = SetItemAttr(Item, ContractSys.Attr.TargetMax, Amount)
	local SetTargetCur = SetItemAttr(Item, ContractSys.Attr.TargetCur, 0)

	if (SetTargetID == 0) or (SetTargetMax == 0) or (SetTargetCur == 0) then
		LG("pkodev.Contract", "Can't set the Contract data! TargetID = ", SetTargetID, ", Max = ", SetTargetMax, ", Cur = ", SetTargetCur)
		return LUA_FALSE, Item, r2
	end
	SynChaKitbag(Player, 13)
	SystemNotice(Player, string.format(ContractSys.Text.Received, Amount, GetMonsterName(TargetID)))
	return LUA_TRUE, Item, r2
end

ItemUse_ContractSys = function(Player, Item)
	Player = TurnToCha(Player)
	local TargetID  = GetItemAttr(Item, ContractSys.Attr.TargetID)
	local TargetMax = GetItemAttr(Item, ContractSys.Attr.TargetMax)
	local TargetCur = GetItemAttr(Item, ContractSys.Attr.TargetCur)
	if (TargetCur < TargetMax) then
		SystemNotice(Player, string.format(ContractSys.Text.Unfinished, GetMonsterName(TargetID), TargetCur, TargetMax))
		UseItemFailed(Player)
        return
	else
		SystemNotice(Player, ContractSys.Text.Completed)
		ContractSys.RewardHandler(Player, Item)
	end
end