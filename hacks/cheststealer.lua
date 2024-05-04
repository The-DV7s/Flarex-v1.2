--all new files are Lua files

--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.5) ~  Much Love, Ferib 

]]--

local TABLE_TableIndirection = {};
bit32 = {};
TABLE_TableIndirection["N%0"] = 32;
TABLE_TableIndirection["P%0"] = 2 ^ TABLE_TableIndirection["N%0"];
bit32.bnot = function(x)
	x = x % TABLE_TableIndirection["P%0"];
	return (TABLE_TableIndirection["P%0"] - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
	TABLE_TableIndirection["r%0"] = 0;
	TABLE_TableIndirection["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
		end
		TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
	end
	return TABLE_TableIndirection["r%0"];
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
	TABLE_TableIndirection["r%0"] = 0;
	TABLE_TableIndirection["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
		end
		TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
	end
	return TABLE_TableIndirection["r%0"];
end;
bit32.bxor = function(x, y)
	x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
	TABLE_TableIndirection["r%0"] = 0;
	TABLE_TableIndirection["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
		end
		TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
	end
	return TABLE_TableIndirection["r%0"];
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%0"];
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % TABLE_TableIndirection["P%0"];
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%0"];
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%0"];
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%0"];
	if (s_amount > 0) then
		TABLE_TableIndirection["add%0"] = 0;
		if (x >= (TABLE_TableIndirection["P%0"] / 2)) then
			TABLE_TableIndirection["add%0"] = TABLE_TableIndirection["P%0"] - (2 ^ (TABLE_TableIndirection["N%0"] - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["add%0"];
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%0"];
	end
end;
TABLE_TableIndirection["v0%0"] = tonumber;
TABLE_TableIndirection["v1%0"] = string.byte;
TABLE_TableIndirection["v2%0"] = string.char;
TABLE_TableIndirection["v3%0"] = string.sub;
TABLE_TableIndirection["v4%0"] = string.gsub;
TABLE_TableIndirection["v5%0"] = string.rep;
TABLE_TableIndirection["v6%0"] = table.concat;
TABLE_TableIndirection["v7%0"] = table.insert;
TABLE_TableIndirection["v8%0"] = math.ldexp;
TABLE_TableIndirection["v9%0"] = getfenv or function()
	return _ENV;
end;
TABLE_TableIndirection["v10%0"] = setmetatable;
TABLE_TableIndirection["v11%0"] = pcall;
TABLE_TableIndirection["v12%0"] = select;
TABLE_TableIndirection["v13%0"] = unpack or table.unpack;
TABLE_TableIndirection["v14%0"] = tonumber;
local function v15(v16, v17, ...)
	TABLE_TableIndirection["v18%0"] = 0;
	TABLE_TableIndirection["v19%0"] = nil;
	TABLE_TableIndirection["v20%0"] = nil;
	TABLE_TableIndirection["v21%0"] = nil;
	TABLE_TableIndirection["v22%0"] = nil;
	TABLE_TableIndirection["v23%0"] = nil;
	TABLE_TableIndirection["v24%0"] = nil;
	TABLE_TableIndirection["v25%0"] = nil;
	TABLE_TableIndirection["v26%0"] = nil;
	TABLE_TableIndirection["v27%0"] = nil;
	TABLE_TableIndirection["v28%0"] = nil;
	TABLE_TableIndirection["v29%0"] = nil;
	TABLE_TableIndirection["v30%0"] = nil;
	while true do
		if (TABLE_TableIndirection["v18%0"] == 5) then
			TABLE_TableIndirection["v27%0"] = TABLE_TableIndirection["v24%0"];
			TABLE_TableIndirection["v28%0"] = nil;
			TABLE_TableIndirection["v28%0"] = function(...)
				return {...}, TABLE_TableIndirection["v12%0"]("#", ...);
			end;
			TABLE_TableIndirection["v18%0"] = 6;
		end
		if (TABLE_TableIndirection["v18%0"] == 2) then
			TABLE_TableIndirection["v22%0"] = function()
				TABLE_TableIndirection["v31%0"] = TABLE_TableIndirection["v1%0"](v16, TABLE_TableIndirection["v19%0"], TABLE_TableIndirection["v19%0"]);
				TABLE_TableIndirection["v19%0"] = TABLE_TableIndirection["v19%0"] + 1;
				return TABLE_TableIndirection["v31%0"];
			end;
			TABLE_TableIndirection["v23%0"] = nil;
			TABLE_TableIndirection["v23%0"] = function()
				local v32, v33 = TABLE_TableIndirection["v1%0"](v16, TABLE_TableIndirection["v19%0"], TABLE_TableIndirection["v19%0"] + (5 - 3));
				TABLE_TableIndirection["v19%0"] = TABLE_TableIndirection["v19%0"] + 2;
				return (v33 * (732 - 476)) + v32;
			end;
			TABLE_TableIndirection["v18%0"] = 3;
		end
		if (TABLE_TableIndirection["v18%0"] == 4) then
			TABLE_TableIndirection["v25%0"] = function()
				TABLE_TableIndirection["v34%0"] = 0;
				TABLE_TableIndirection["v35%0"] = nil;
				TABLE_TableIndirection["v36%0"] = nil;
				TABLE_TableIndirection["v37%0"] = nil;
				TABLE_TableIndirection["v38%0"] = nil;
				TABLE_TableIndirection["v39%0"] = nil;
				TABLE_TableIndirection["v40%0"] = nil;
				while true do
					if (TABLE_TableIndirection["v34%0"] == 2) then
						TABLE_TableIndirection["v39%0"] = TABLE_TableIndirection["v21%0"](TABLE_TableIndirection["v36%0"], 40 - 19, 79 - 48);
						TABLE_TableIndirection["v40%0"] = ((TABLE_TableIndirection["v21%0"](TABLE_TableIndirection["v36%0"], 32) == (620 - ((1362 - 807) + 64))) and -1) or (932 - (631 + 226 + 74));
						TABLE_TableIndirection["v34%0"] = 571 - (367 + (798 - 597));
					end
					if (TABLE_TableIndirection["v34%0"] == ((1880 - (802 + 150)) - (214 + 713))) then
						TABLE_TableIndirection["v37%0"] = 1 + 0;
						TABLE_TableIndirection["v38%0"] = (TABLE_TableIndirection["v21%0"](TABLE_TableIndirection["v36%0"], 1 + 0, 897 - (282 + 595)) * (((4412 - 2773) - (1523 + 114)) ^ (29 + 3))) + TABLE_TableIndirection["v35%0"];
						TABLE_TableIndirection["v34%0"] = 2 - 0;
					end
					if (TABLE_TableIndirection["v34%0"] == 3) then
						if (TABLE_TableIndirection["v39%0"] == (1065 - (68 + 997))) then
							if (TABLE_TableIndirection["v38%0"] == (1270 - (226 + 1044))) then
								return TABLE_TableIndirection["v40%0"] * (0 - (0 - 0));
							else
								TABLE_TableIndirection["v39%0"] = 118 - (32 + 62 + 23);
								TABLE_TableIndirection["v37%0"] = 0 + 0;
							end
						elseif (TABLE_TableIndirection["v39%0"] == (3044 - (915 + 82))) then
							return ((TABLE_TableIndirection["v38%0"] == (0 + 0)) and (TABLE_TableIndirection["v40%0"] * ((958 - (892 + 65)) / (0 - 0)))) or (TABLE_TableIndirection["v40%0"] * NaN);
						end
						return TABLE_TableIndirection["v8%0"](TABLE_TableIndirection["v40%0"], TABLE_TableIndirection["v39%0"] - (1890 - (2454 - 1587))) * (TABLE_TableIndirection["v37%0"] + (TABLE_TableIndirection["v38%0"] / ((3 - 1) ^ (402 - (87 + 263)))));
					end
					if (TABLE_TableIndirection["v34%0"] == (180 - (67 + 113))) then
						TABLE_TableIndirection["v35%0"] = TABLE_TableIndirection["v24%0"]();
						TABLE_TableIndirection["v36%0"] = TABLE_TableIndirection["v24%0"]();
						TABLE_TableIndirection["v34%0"] = 1 + 0;
					end
				end
			end;
			TABLE_TableIndirection["v26%0"] = nil;
			TABLE_TableIndirection["v26%0"] = function(v41)
				TABLE_TableIndirection["v42%0"] = nil;
				if not v41 then
					TABLE_TableIndirection["v82%0"] = 1187 - ((1898 - 829) + 118);
					while true do
						if (TABLE_TableIndirection["v82%0"] == (0 + 0)) then
							v41 = TABLE_TableIndirection["v24%0"]();
							if (v41 == (0 - 0)) then
								return "";
							end
							break;
						end
					end
				end
				v42 = TABLE_TableIndirection["v3%0"](v16, TABLE_TableIndirection["v19%0"], (TABLE_TableIndirection["v19%0"] + v41) - (1 - 0));
				TABLE_TableIndirection["v19%0"] = TABLE_TableIndirection["v19%0"] + v41;
				TABLE_TableIndirection["v43%0"] = {};
				for v66 = 1 + 0, #v42 do
					TABLE_TableIndirection["v43%0"][v66] = TABLE_TableIndirection["v2%0"](TABLE_TableIndirection["v1%0"](TABLE_TableIndirection["v3%0"](v42, v66, v66)));
				end
				return TABLE_TableIndirection["v6%0"](TABLE_TableIndirection["v43%0"]);
			end;
			TABLE_TableIndirection["v18%0"] = 5;
		end
		if (TABLE_TableIndirection["v18%0"] == 6) then
			TABLE_TableIndirection["v29%0"] = nil;
			TABLE_TableIndirection["v29%0"] = function()
				TABLE_TableIndirection["v44%0"] = 0 - 0;
				TABLE_TableIndirection["v45%0"] = nil;
				TABLE_TableIndirection["v46%0"] = nil;
				TABLE_TableIndirection["v47%0"] = nil;
				TABLE_TableIndirection["v48%0"] = nil;
				TABLE_TableIndirection["v49%0"] = nil;
				TABLE_TableIndirection["v50%0"] = nil;
				TABLE_TableIndirection["v51%0"] = nil;
				while true do
					if (TABLE_TableIndirection["v44%0"] == 1) then
						TABLE_TableIndirection["v47%0"] = nil;
						TABLE_TableIndirection["v48%0"] = nil;
						TABLE_TableIndirection["v44%0"] = 1667 - (970 + 695);
					end
					if (TABLE_TableIndirection["v44%0"] == (3 - 1)) then
						TABLE_TableIndirection["v49%0"] = nil;
						TABLE_TableIndirection["v50%0"] = nil;
						TABLE_TableIndirection["v44%0"] = 1993 - (582 + 1408);
					end
					if ((10 - 7) == TABLE_TableIndirection["v44%0"]) then
						TABLE_TableIndirection["v51%0"] = nil;
						while true do
							TABLE_TableIndirection["v90%0"] = 0 - 0;
							TABLE_TableIndirection["v91%0"] = nil;
							while true do
								if (TABLE_TableIndirection["v90%0"] ~= 0) then
								else
									TABLE_TableIndirection["v91%0"] = 0 - 0;
									while true do
										if (0 ~= TABLE_TableIndirection["v91%0"]) then
										else
											TABLE_TableIndirection["v97%0"] = 0;
											while true do
												if (TABLE_TableIndirection["v97%0"] == (1825 - (1195 + 629))) then
													TABLE_TableIndirection["v91%0"] = 1 - 0;
													break;
												end
												if (0 == TABLE_TableIndirection["v97%0"]) then
													if (TABLE_TableIndirection["v45%0"] ~= (244 - (187 + 54))) then
													else
														for v308 = 781 - (162 + 618), TABLE_TableIndirection["v24%0"]() do
															TABLE_TableIndirection["v47%0"][v308 - 1] = TABLE_TableIndirection["v29%0"]();
														end
														return TABLE_TableIndirection["v49%0"];
													end
													if (TABLE_TableIndirection["v45%0"] == (2 + 0)) then
														TABLE_TableIndirection["v287%0"] = 0;
														TABLE_TableIndirection["v288%0"] = nil;
														while true do
															if (TABLE_TableIndirection["v287%0"] ~= 0) then
															else
																TABLE_TableIndirection["v288%0"] = 0;
																while true do
																	if (TABLE_TableIndirection["v288%0"] == 0) then
																		TABLE_TableIndirection["v487%0"] = 0 + 0;
																		while true do
																			if (TABLE_TableIndirection["v487%0"] ~= 0) then
																			else
																				for v496 = 1 - 0, TABLE_TableIndirection["v50%0"] do
																					TABLE_TableIndirection["v497%0"] = 0 - 0;
																					TABLE_TableIndirection["v498%0"] = nil;
																					TABLE_TableIndirection["v499%0"] = nil;
																					TABLE_TableIndirection["v500%0"] = nil;
																					TABLE_TableIndirection["v501%0"] = nil;
																					while true do
																						if (TABLE_TableIndirection["v497%0"] ~= (1 + 0)) then
																						else
																							TABLE_TableIndirection["v500%0"] = nil;
																							TABLE_TableIndirection["v501%0"] = nil;
																							TABLE_TableIndirection["v497%0"] = 2;
																						end
																						if (TABLE_TableIndirection["v497%0"] ~= 2) then
																						else
																							while true do
																								if (TABLE_TableIndirection["v498%0"] == 0) then
																									TABLE_TableIndirection["v503%0"] = 1636 - (1373 + 263);
																									while true do
																										if (TABLE_TableIndirection["v503%0"] ~= (1001 - (451 + 549))) then
																										else
																											TABLE_TableIndirection["v498%0"] = 1 + 0;
																											break;
																										end
																										if (TABLE_TableIndirection["v503%0"] == 0) then
																											TABLE_TableIndirection["v499%0"] = 0 - 0;
																											TABLE_TableIndirection["v500%0"] = nil;
																											TABLE_TableIndirection["v503%0"] = 1;
																										end
																									end
																								end
																								if (TABLE_TableIndirection["v498%0"] == 1) then
																									TABLE_TableIndirection["v501%0"] = nil;
																									while true do
																										if (1 == TABLE_TableIndirection["v499%0"]) then
																											if (TABLE_TableIndirection["v500%0"] == 1) then
																												TABLE_TableIndirection["v501%0"] = TABLE_TableIndirection["v22%0"]() ~= 0;
																											elseif (TABLE_TableIndirection["v500%0"] == (2 - 0)) then
																												TABLE_TableIndirection["v501%0"] = TABLE_TableIndirection["v25%0"]();
																											elseif (TABLE_TableIndirection["v500%0"] ~= 3) then
																											else
																												TABLE_TableIndirection["v501%0"] = TABLE_TableIndirection["v26%0"]();
																											end
																											TABLE_TableIndirection["v51%0"][v496] = TABLE_TableIndirection["v501%0"];
																											break;
																										end
																										if (TABLE_TableIndirection["v499%0"] == (1384 - (746 + 638))) then
																											TABLE_TableIndirection["v510%0"] = 0 + 0;
																											TABLE_TableIndirection["v511%0"] = nil;
																											TABLE_TableIndirection["v512%0"] = nil;
																											while true do
																												if (TABLE_TableIndirection["v510%0"] == (1 - 0)) then
																													while true do
																														if (TABLE_TableIndirection["v511%0"] == 0) then
																															TABLE_TableIndirection["v512%0"] = 0;
																															while true do
																																if (TABLE_TableIndirection["v512%0"] ~= (342 - (218 + 123))) then
																																else
																																	TABLE_TableIndirection["v499%0"] = 1582 - (1535 + 46);
																																	break;
																																end
																																if (TABLE_TableIndirection["v512%0"] == (0 + 0)) then
																																	TABLE_TableIndirection["v521%0"] = 0 + 0;
																																	TABLE_TableIndirection["v522%0"] = nil;
																																	while true do
																																		if (TABLE_TableIndirection["v521%0"] ~= 0) then
																																		else
																																			TABLE_TableIndirection["v522%0"] = 0;
																																			while true do
																																				if ((560 - (306 + 254)) == TABLE_TableIndirection["v522%0"]) then
																																					TABLE_TableIndirection["v525%0"] = 0;
																																					while true do
																																						if (TABLE_TableIndirection["v525%0"] == (1 + 0)) then
																																							TABLE_TableIndirection["v522%0"] = 1 - 0;
																																							break;
																																						end
																																						if (TABLE_TableIndirection["v525%0"] ~= 0) then
																																						else
																																							TABLE_TableIndirection["v500%0"] = TABLE_TableIndirection["v22%0"]();
																																							TABLE_TableIndirection["v501%0"] = nil;
																																							TABLE_TableIndirection["v525%0"] = 1468 - (899 + 568);
																																						end
																																					end
																																				end
																																				if (TABLE_TableIndirection["v522%0"] ~= (1 + 0)) then
																																				else
																																					TABLE_TableIndirection["v512%0"] = 2 - 1;
																																					break;
																																				end
																																			end
																																			break;
																																		end
																																	end
																																end
																															end
																															break;
																														end
																													end
																													break;
																												end
																												if (TABLE_TableIndirection["v510%0"] == (603 - (268 + 335))) then
																													TABLE_TableIndirection["v511%0"] = 290 - (60 + 230);
																													TABLE_TableIndirection["v512%0"] = nil;
																													TABLE_TableIndirection["v510%0"] = 1;
																												end
																											end
																										end
																									end
																									break;
																								end
																							end
																							break;
																						end
																						if (TABLE_TableIndirection["v497%0"] ~= 0) then
																						else
																							TABLE_TableIndirection["v498%0"] = 0;
																							TABLE_TableIndirection["v499%0"] = nil;
																							TABLE_TableIndirection["v497%0"] = 1;
																						end
																					end
																				end
																				TABLE_TableIndirection["v49%0"][575 - (426 + 146)] = TABLE_TableIndirection["v22%0"]();
																				TABLE_TableIndirection["v487%0"] = 1 + 0;
																			end
																			if (TABLE_TableIndirection["v487%0"] ~= 1) then
																			else
																				TABLE_TableIndirection["v288%0"] = 1;
																				break;
																			end
																		end
																	end
																	if (TABLE_TableIndirection["v288%0"] ~= 1) then
																	else
																		for v490 = 1457 - (282 + 1174), TABLE_TableIndirection["v24%0"]() do
																			TABLE_TableIndirection["v491%0"] = 0;
																			TABLE_TableIndirection["v492%0"] = nil;
																			TABLE_TableIndirection["v493%0"] = nil;
																			TABLE_TableIndirection["v494%0"] = nil;
																			while true do
																				if (TABLE_TableIndirection["v491%0"] ~= (811 - (569 + 242))) then
																				else
																					TABLE_TableIndirection["v492%0"] = 0;
																					TABLE_TableIndirection["v493%0"] = nil;
																					TABLE_TableIndirection["v491%0"] = 1;
																				end
																				if (TABLE_TableIndirection["v491%0"] == (2 - 1)) then
																					TABLE_TableIndirection["v494%0"] = nil;
																					while true do
																						if (TABLE_TableIndirection["v492%0"] == 1) then
																							while true do
																								if (TABLE_TableIndirection["v493%0"] ~= (0 + 0)) then
																								else
																									TABLE_TableIndirection["v494%0"] = TABLE_TableIndirection["v22%0"]();
																									if (TABLE_TableIndirection["v21%0"](TABLE_TableIndirection["v494%0"], 1025 - (706 + 318), 1) ~= 0) then
																									else
																										TABLE_TableIndirection["v504%0"] = 0;
																										TABLE_TableIndirection["v505%0"] = nil;
																										TABLE_TableIndirection["v506%0"] = nil;
																										TABLE_TableIndirection["v507%0"] = nil;
																										TABLE_TableIndirection["v508%0"] = nil;
																										while true do
																											if (TABLE_TableIndirection["v504%0"] ~= (1251 - (721 + 530))) then
																											else
																												TABLE_TableIndirection["v505%0"] = 0;
																												TABLE_TableIndirection["v506%0"] = nil;
																												TABLE_TableIndirection["v504%0"] = 1;
																											end
																											if (TABLE_TableIndirection["v504%0"] == 2) then
																												while true do
																													if (TABLE_TableIndirection["v505%0"] == (1274 - (945 + 326))) then
																														if (TABLE_TableIndirection["v21%0"](TABLE_TableIndirection["v507%0"], 7 - 4, 3 + 0) ~= 1) then
																														else
																															TABLE_TableIndirection["v508%0"][4] = TABLE_TableIndirection["v51%0"][TABLE_TableIndirection["v508%0"][704 - (271 + 429)]];
																														end
																														TABLE_TableIndirection["v46%0"][v490] = TABLE_TableIndirection["v508%0"];
																														break;
																													end
																													if (TABLE_TableIndirection["v505%0"] ~= 1) then
																													else
																														TABLE_TableIndirection["v514%0"] = 0 + 0;
																														TABLE_TableIndirection["v515%0"] = nil;
																														while true do
																															if (TABLE_TableIndirection["v514%0"] == 0) then
																																TABLE_TableIndirection["v515%0"] = 0;
																																while true do
																																	if ((1500 - (1408 + 92)) == TABLE_TableIndirection["v515%0"]) then
																																		TABLE_TableIndirection["v523%0"] = 1086 - (461 + 625);
																																		while true do
																																			if (0 == TABLE_TableIndirection["v523%0"]) then
																																				TABLE_TableIndirection["v508%0"] = {TABLE_TableIndirection["v23%0"](),TABLE_TableIndirection["v23%0"](),nil,nil};
																																				if (TABLE_TableIndirection["v506%0"] == 0) then
																																					TABLE_TableIndirection["v526%0"] = 0 + 0;
																																					TABLE_TableIndirection["v527%0"] = nil;
																																					while true do
																																						if (TABLE_TableIndirection["v526%0"] == (0 + 0)) then
																																							TABLE_TableIndirection["v527%0"] = 0 + 0;
																																							while true do
																																								if (TABLE_TableIndirection["v527%0"] == (0 + 0)) then
																																									TABLE_TableIndirection["v508%0"][3] = TABLE_TableIndirection["v23%0"]();
																																									TABLE_TableIndirection["v508%0"][533 - (406 + 123)] = TABLE_TableIndirection["v23%0"]();
																																									break;
																																								end
																																							end
																																							break;
																																						end
																																					end
																																				elseif (TABLE_TableIndirection["v506%0"] == 1) then
																																					TABLE_TableIndirection["v508%0"][1772 - (1749 + 20)] = TABLE_TableIndirection["v24%0"]();
																																				elseif (TABLE_TableIndirection["v506%0"] == 2) then
																																					TABLE_TableIndirection["v508%0"][1 + 2] = TABLE_TableIndirection["v24%0"]() - (2 ^ 16);
																																				elseif (TABLE_TableIndirection["v506%0"] == 3) then
																																					TABLE_TableIndirection["v536%0"] = 1322 - (1249 + 73);
																																					TABLE_TableIndirection["v537%0"] = nil;
																																					while true do
																																						if (TABLE_TableIndirection["v536%0"] == 0) then
																																							TABLE_TableIndirection["v537%0"] = 0 + 0;
																																							while true do
																																								if (0 == TABLE_TableIndirection["v537%0"]) then
																																									TABLE_TableIndirection["v508%0"][1148 - (466 + 679)] = TABLE_TableIndirection["v24%0"]() - ((4 - 2) ^ 16);
																																									TABLE_TableIndirection["v508%0"][11 - 7] = TABLE_TableIndirection["v23%0"]();
																																									break;
																																								end
																																							end
																																							break;
																																						end
																																					end
																																				end
																																				TABLE_TableIndirection["v523%0"] = 1;
																																			end
																																			if (TABLE_TableIndirection["v523%0"] ~= (1901 - (106 + 1794))) then
																																			else
																																				TABLE_TableIndirection["v515%0"] = 1;
																																				break;
																																			end
																																		end
																																	end
																																	if (TABLE_TableIndirection["v515%0"] == (1 + 0)) then
																																		TABLE_TableIndirection["v505%0"] = 1 + 1;
																																		break;
																																	end
																																end
																																break;
																															end
																														end
																													end
																													if (TABLE_TableIndirection["v505%0"] == 2) then
																														TABLE_TableIndirection["v516%0"] = 0 - 0;
																														TABLE_TableIndirection["v517%0"] = nil;
																														while true do
																															if (TABLE_TableIndirection["v516%0"] == 0) then
																																TABLE_TableIndirection["v517%0"] = 0;
																																while true do
																																	if (TABLE_TableIndirection["v517%0"] ~= 0) then
																																	else
																																		TABLE_TableIndirection["v524%0"] = 0;
																																		while true do
																																			if (TABLE_TableIndirection["v524%0"] ~= (2 - 1)) then
																																			else
																																				TABLE_TableIndirection["v517%0"] = 1;
																																				break;
																																			end
																																			if (TABLE_TableIndirection["v524%0"] ~= (114 - (4 + 110))) then
																																			else
																																				if (TABLE_TableIndirection["v21%0"](TABLE_TableIndirection["v507%0"], 1, 585 - (57 + 527)) == 1) then
																																					TABLE_TableIndirection["v508%0"][1429 - (41 + 1386)] = TABLE_TableIndirection["v51%0"][TABLE_TableIndirection["v508%0"][2]];
																																				end
																																				if (TABLE_TableIndirection["v21%0"](TABLE_TableIndirection["v507%0"], 2, 105 - (17 + 86)) ~= 1) then
																																				else
																																					TABLE_TableIndirection["v508%0"][3 + 0] = TABLE_TableIndirection["v51%0"][TABLE_TableIndirection["v508%0"][6 - 3]];
																																				end
																																				TABLE_TableIndirection["v524%0"] = 2 - 1;
																																			end
																																		end
																																	end
																																	if (TABLE_TableIndirection["v517%0"] ~= (167 - (122 + 44))) then
																																	else
																																		TABLE_TableIndirection["v505%0"] = 3;
																																		break;
																																	end
																																end
																																break;
																															end
																														end
																													end
																													if (TABLE_TableIndirection["v505%0"] ~= 0) then
																													else
																														TABLE_TableIndirection["v518%0"] = 0;
																														while true do
																															if (TABLE_TableIndirection["v518%0"] == 1) then
																																TABLE_TableIndirection["v505%0"] = 1;
																																break;
																															end
																															if ((0 - 0) == TABLE_TableIndirection["v518%0"]) then
																																TABLE_TableIndirection["v506%0"] = TABLE_TableIndirection["v21%0"](TABLE_TableIndirection["v494%0"], 2, 3);
																																TABLE_TableIndirection["v507%0"] = TABLE_TableIndirection["v21%0"](TABLE_TableIndirection["v494%0"], 4, 6);
																																TABLE_TableIndirection["v518%0"] = 1;
																															end
																														end
																													end
																												end
																												break;
																											end
																											if (TABLE_TableIndirection["v504%0"] == 1) then
																												TABLE_TableIndirection["v507%0"] = nil;
																												TABLE_TableIndirection["v508%0"] = nil;
																												TABLE_TableIndirection["v504%0"] = 2;
																											end
																										end
																									end
																									break;
																								end
																							end
																							break;
																						end
																						if (TABLE_TableIndirection["v492%0"] == (0 - 0)) then
																							TABLE_TableIndirection["v502%0"] = 0;
																							while true do
																								if (TABLE_TableIndirection["v502%0"] ~= (0 + 0)) then
																								else
																									TABLE_TableIndirection["v493%0"] = 0 + 0;
																									TABLE_TableIndirection["v494%0"] = nil;
																									TABLE_TableIndirection["v502%0"] = 1 - 0;
																								end
																								if (1 == TABLE_TableIndirection["v502%0"]) then
																									TABLE_TableIndirection["v492%0"] = 66 - (30 + 35);
																									break;
																								end
																							end
																						end
																					end
																					break;
																				end
																			end
																		end
																		TABLE_TableIndirection["v45%0"] = 3 + 0;
																		break;
																	end
																end
																break;
															end
														end
													end
													TABLE_TableIndirection["v97%0"] = 1;
												end
											end
										end
										if (TABLE_TableIndirection["v91%0"] ~= 1) then
										else
											if (1 == TABLE_TableIndirection["v45%0"]) then
												TABLE_TableIndirection["v98%0"] = 0;
												TABLE_TableIndirection["v99%0"] = nil;
												while true do
													if (TABLE_TableIndirection["v98%0"] == (1257 - (1043 + 214))) then
														TABLE_TableIndirection["v99%0"] = 0 - 0;
														while true do
															if (TABLE_TableIndirection["v99%0"] ~= (1213 - (323 + 889))) then
															else
																TABLE_TableIndirection["v51%0"] = {};
																TABLE_TableIndirection["v45%0"] = 5 - 3;
																break;
															end
															if ((580 - (361 + 219)) == TABLE_TableIndirection["v99%0"]) then
																TABLE_TableIndirection["v49%0"] = {TABLE_TableIndirection["v46%0"],TABLE_TableIndirection["v47%0"],nil,TABLE_TableIndirection["v48%0"]};
																TABLE_TableIndirection["v50%0"] = TABLE_TableIndirection["v24%0"]();
																TABLE_TableIndirection["v99%0"] = 1;
															end
														end
														break;
													end
												end
											end
											if (TABLE_TableIndirection["v45%0"] == (413 - (15 + 398))) then
												TABLE_TableIndirection["v100%0"] = 0;
												while true do
													if ((983 - (18 + 964)) == TABLE_TableIndirection["v100%0"]) then
														TABLE_TableIndirection["v48%0"] = {};
														TABLE_TableIndirection["v45%0"] = 1;
														break;
													end
													if (TABLE_TableIndirection["v100%0"] ~= (0 - 0)) then
													else
														TABLE_TableIndirection["v46%0"] = {};
														TABLE_TableIndirection["v47%0"] = {};
														TABLE_TableIndirection["v100%0"] = 1;
													end
												end
											end
											break;
										end
									end
									break;
								end
							end
						end
						break;
					end
					if (0 ~= TABLE_TableIndirection["v44%0"]) then
					else
						TABLE_TableIndirection["v45%0"] = 0 + 0;
						TABLE_TableIndirection["v46%0"] = nil;
						TABLE_TableIndirection["v44%0"] = 1;
					end
				end
			end;
			TABLE_TableIndirection["v30%0"] = nil;
			TABLE_TableIndirection["v18%0"] = 7;
		end
		if (TABLE_TableIndirection["v18%0"] == 0) then
			TABLE_TableIndirection["v19%0"] = 1;
			TABLE_TableIndirection["v20%0"] = nil;
			v16 = TABLE_TableIndirection["v4%0"](TABLE_TableIndirection["v3%0"](v16, 5), "..", function(v52)
				if (TABLE_TableIndirection["v1%0"](v52, 2) == 79) then
					TABLE_TableIndirection["v83%0"] = 0;
					while true do
						if (TABLE_TableIndirection["v83%0"] == 0) then
							TABLE_TableIndirection["v20%0"] = TABLE_TableIndirection["v0%0"](TABLE_TableIndirection["v3%0"](v52, 1, 1));
							return "";
						end
					end
				else
					TABLE_TableIndirection["v84%0"] = TABLE_TableIndirection["v2%0"](TABLE_TableIndirection["v0%0"](v52, 16));
					if TABLE_TableIndirection["v20%0"] then
						TABLE_TableIndirection["v92%0"] = TABLE_TableIndirection["v5%0"](TABLE_TableIndirection["v84%0"], TABLE_TableIndirection["v20%0"]);
						TABLE_TableIndirection["v20%0"] = nil;
						return TABLE_TableIndirection["v92%0"];
					else
						return TABLE_TableIndirection["v84%0"];
					end
				end
			end);
			TABLE_TableIndirection["v18%0"] = 1;
		end
		if (TABLE_TableIndirection["v18%0"] == 3) then
			TABLE_TableIndirection["v24%0"] = nil;
			TABLE_TableIndirection["v24%0"] = function()
				local v53, v54, v55, v56 = TABLE_TableIndirection["v1%0"](v16, TABLE_TableIndirection["v19%0"], TABLE_TableIndirection["v19%0"] + 1 + 1 + 1);
				TABLE_TableIndirection["v19%0"] = TABLE_TableIndirection["v19%0"] + 4;
				return (v56 * (16778066 - (20 + 830))) + (v55 * ((51895 - (542 + 196)) + (30823 - 16444))) + (v54 * (382 - (116 + 10))) + v53;
			end;
			TABLE_TableIndirection["v25%0"] = nil;
			TABLE_TableIndirection["v18%0"] = 4;
		end
		if (TABLE_TableIndirection["v18%0"] == 7) then
			TABLE_TableIndirection["v30%0"] = function(v57, v58, v59)
				TABLE_TableIndirection["v60%0"] = v57[1];
				TABLE_TableIndirection["v61%0"] = v57[2];
				TABLE_TableIndirection["v62%0"] = v57[3];
				return function(...)
					TABLE_TableIndirection["v68%0"] = TABLE_TableIndirection["v60%0"];
					TABLE_TableIndirection["v69%0"] = TABLE_TableIndirection["v61%0"];
					TABLE_TableIndirection["v70%0"] = TABLE_TableIndirection["v62%0"];
					TABLE_TableIndirection["v71%0"] = TABLE_TableIndirection["v28%0"];
					TABLE_TableIndirection["v72%0"] = 1;
					TABLE_TableIndirection["v73%0"] = -1;
					TABLE_TableIndirection["v74%0"] = {};
					TABLE_TableIndirection["v75%0"] = {...};
					TABLE_TableIndirection["v76%0"] = TABLE_TableIndirection["v12%0"]("#", ...) - 1;
					TABLE_TableIndirection["v77%0"] = {};
					TABLE_TableIndirection["v78%0"] = {};
					for v85 = 0, TABLE_TableIndirection["v76%0"] do
						if (v85 >= TABLE_TableIndirection["v70%0"]) then
							TABLE_TableIndirection["v74%0"][v85 - TABLE_TableIndirection["v70%0"]] = TABLE_TableIndirection["v75%0"][v85 + 1];
						else
							TABLE_TableIndirection["v78%0"][v85] = TABLE_TableIndirection["v75%0"][v85 + 1];
						end
					end
					TABLE_TableIndirection["v79%0"] = (TABLE_TableIndirection["v76%0"] - TABLE_TableIndirection["v70%0"]) + 1;
					TABLE_TableIndirection["v80%0"] = nil;
					TABLE_TableIndirection["v81%0"] = nil;
					while true do
						TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
						TABLE_TableIndirection["v81%0"] = TABLE_TableIndirection["v80%0"][1];
						if (TABLE_TableIndirection["v81%0"] <= 26) then
							if (TABLE_TableIndirection["v81%0"] <= 12) then
								if (TABLE_TableIndirection["v81%0"] <= 5) then
									if (TABLE_TableIndirection["v81%0"] <= 2) then
										if (TABLE_TableIndirection["v81%0"] <= 0) then
											for v143 = TABLE_TableIndirection["v80%0"][2], TABLE_TableIndirection["v80%0"][3] do
												TABLE_TableIndirection["v78%0"][v143] = nil;
											end
										elseif (TABLE_TableIndirection["v81%0"] > 1) then
											TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]] % TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]];
										else
											TABLE_TableIndirection["v160%0"] = 0;
											TABLE_TableIndirection["v161%0"] = nil;
											while true do
												if (TABLE_TableIndirection["v160%0"] == 4) then
													TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
													if TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] then
														TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
													else
														TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
													end
													break;
												end
												if (TABLE_TableIndirection["v160%0"] == 2) then
													TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
													TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
													TABLE_TableIndirection["v161%0"] = TABLE_TableIndirection["v80%0"][2];
													TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v161%0"]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v161%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v161%0"] + 1, TABLE_TableIndirection["v80%0"][3]));
													TABLE_TableIndirection["v160%0"] = 3;
												end
												if (TABLE_TableIndirection["v160%0"] == 3) then
													TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
													TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
													TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]]];
													TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
													TABLE_TableIndirection["v160%0"] = 4;
												end
												if (TABLE_TableIndirection["v160%0"] == 0) then
													TABLE_TableIndirection["v161%0"] = nil;
													TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
													TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
													TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
													TABLE_TableIndirection["v160%0"] = 1;
												end
												if (TABLE_TableIndirection["v160%0"] == 1) then
													TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
													TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
													TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
													TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
													TABLE_TableIndirection["v160%0"] = 2;
												end
											end
										end
									elseif (TABLE_TableIndirection["v81%0"] <= 3) then
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v80%0"][4]];
									elseif (TABLE_TableIndirection["v81%0"] == 4) then
										TABLE_TableIndirection["v162%0"] = nil;
										TABLE_TableIndirection["v163%0"] = nil;
										TABLE_TableIndirection["v164%0"] = nil;
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]]] = TABLE_TableIndirection["v80%0"][4];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v59[TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v164 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v164] = TABLE_TableIndirection["v78%0"][v164](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v164 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v163 = TABLE_TableIndirection["v80%0"][3];
										v162 = TABLE_TableIndirection["v78%0"][v163];
										for v289 = v163 + 1, TABLE_TableIndirection["v80%0"][4] do
											v162 = v162 .. TABLE_TableIndirection["v78%0"][v289];
										end
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v162;
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
									else
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]]();
									end
								elseif (TABLE_TableIndirection["v81%0"] <= 8) then
									if (TABLE_TableIndirection["v81%0"] <= 6) then
										do
											return;
										end
									elseif (TABLE_TableIndirection["v81%0"] == 7) then
										TABLE_TableIndirection["v177%0"] = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v177%0"]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v177%0"]](TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v177%0"] + 1]);
									else
										TABLE_TableIndirection["v179%0"] = nil;
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v179 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v179] = TABLE_TableIndirection["v78%0"][v179](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v179 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										if (TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] == TABLE_TableIndirection["v80%0"][4]) then
											TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										else
											TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
										end
									end
								elseif (TABLE_TableIndirection["v81%0"] <= 10) then
									if (TABLE_TableIndirection["v81%0"] == 9) then
										TABLE_TableIndirection["v186%0"] = nil;
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v186 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v186] = TABLE_TableIndirection["v78%0"][v186](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v186 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										if TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] then
											TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										else
											TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
										end
									else
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v59[TABLE_TableIndirection["v80%0"][3]];
									end
								elseif (TABLE_TableIndirection["v81%0"] == 11) then
									TABLE_TableIndirection["v196%0"] = TABLE_TableIndirection["v80%0"][3];
									TABLE_TableIndirection["v197%0"] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v196%0"]];
									for v290 = TABLE_TableIndirection["v196%0"] + 1, TABLE_TableIndirection["v80%0"][4] do
										TABLE_TableIndirection["v197%0"] = TABLE_TableIndirection["v197%0"] .. TABLE_TableIndirection["v78%0"][v290];
									end
									TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v197%0"];
								else
									TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v30%0"](TABLE_TableIndirection["v69%0"][TABLE_TableIndirection["v80%0"][3]], nil, v59);
								end
							elseif (TABLE_TableIndirection["v81%0"] <= 19) then
								if (TABLE_TableIndirection["v81%0"] <= 15) then
									if (TABLE_TableIndirection["v81%0"] <= 13) then
										TABLE_TableIndirection["v103%0"] = nil;
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v103 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v103] = TABLE_TableIndirection["v78%0"][v103](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v103 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]]] = TABLE_TableIndirection["v80%0"][4];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
									elseif (TABLE_TableIndirection["v81%0"] > 14) then
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
									else
										TABLE_TableIndirection["v202%0"] = 0;
										while true do
											if (TABLE_TableIndirection["v202%0"] == 4) then
												TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v59[TABLE_TableIndirection["v80%0"][3]];
												TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
												TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
												TABLE_TableIndirection["v202%0"] = 5;
											end
											if (7 == TABLE_TableIndirection["v202%0"]) then
												if not TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] then
													TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
												else
													TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
												end
												break;
											end
											if (TABLE_TableIndirection["v202%0"] == 0) then
												TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v59[TABLE_TableIndirection["v80%0"][3]];
												TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
												TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
												TABLE_TableIndirection["v202%0"] = 1;
											end
											if (TABLE_TableIndirection["v202%0"] == 3) then
												TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v80%0"][4]];
												TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
												TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
												TABLE_TableIndirection["v202%0"] = 4;
											end
											if (TABLE_TableIndirection["v202%0"] == 6) then
												TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v59[TABLE_TableIndirection["v80%0"][3]];
												TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
												TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
												TABLE_TableIndirection["v202%0"] = 7;
											end
											if (TABLE_TableIndirection["v202%0"] == 1) then
												TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v80%0"][4]];
												TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
												TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
												TABLE_TableIndirection["v202%0"] = 2;
											end
											if (TABLE_TableIndirection["v202%0"] == 2) then
												TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v59[TABLE_TableIndirection["v80%0"][3]];
												TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
												TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
												TABLE_TableIndirection["v202%0"] = 3;
											end
											if (5 == TABLE_TableIndirection["v202%0"]) then
												TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v80%0"][4]];
												TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
												TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
												TABLE_TableIndirection["v202%0"] = 6;
											end
										end
									end
								elseif (TABLE_TableIndirection["v81%0"] <= 17) then
									if (TABLE_TableIndirection["v81%0"] > 16) then
										TABLE_TableIndirection["v203%0"] = nil;
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v203 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v203] = TABLE_TableIndirection["v78%0"][v203](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v203 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]]] = TABLE_TableIndirection["v80%0"][4];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v203 = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][v203] = TABLE_TableIndirection["v78%0"][v203](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v203 + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]]] = TABLE_TableIndirection["v80%0"][4];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
									else
										TABLE_TableIndirection["v212%0"] = nil;
										TABLE_TableIndirection["v213%0"] = nil;
										TABLE_TableIndirection["v214%0"] = nil;
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = #TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v214 = TABLE_TableIndirection["v80%0"][2];
										v213 = TABLE_TableIndirection["v78%0"][v214];
										v212 = TABLE_TableIndirection["v78%0"][v214 + 2];
										if (v212 > 0) then
											if (v213 > TABLE_TableIndirection["v78%0"][v214 + 1]) then
												TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
											else
												TABLE_TableIndirection["v78%0"][v214 + 3] = v213;
											end
										elseif (v213 < TABLE_TableIndirection["v78%0"][v214 + 1]) then
											TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
										else
											TABLE_TableIndirection["v78%0"][v214 + 3] = v213;
										end
									end
								elseif (TABLE_TableIndirection["v81%0"] == 18) then
									TABLE_TableIndirection["v222%0"] = TABLE_TableIndirection["v80%0"][2];
									do
										return TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v222%0"], TABLE_TableIndirection["v73%0"]);
									end
								else
									TABLE_TableIndirection["v223%0"] = 0;
									TABLE_TableIndirection["v224%0"] = nil;
									TABLE_TableIndirection["v225%0"] = nil;
									TABLE_TableIndirection["v226%0"] = nil;
									TABLE_TableIndirection["v227%0"] = nil;
									TABLE_TableIndirection["v228%0"] = nil;
									while true do
										if (TABLE_TableIndirection["v223%0"] == 0) then
											TABLE_TableIndirection["v224%0"] = nil;
											TABLE_TableIndirection["v225%0"], TABLE_TableIndirection["v226%0"] = nil;
											TABLE_TableIndirection["v227%0"] = nil;
											TABLE_TableIndirection["v228%0"] = nil;
											TABLE_TableIndirection["v223%0"] = 1;
										end
										if (7 == TABLE_TableIndirection["v223%0"]) then
											TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
											TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
											TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
											break;
										end
										if (TABLE_TableIndirection["v223%0"] == 4) then
											TABLE_TableIndirection["v228%0"] = TABLE_TableIndirection["v80%0"][2];
											TABLE_TableIndirection["v225%0"], TABLE_TableIndirection["v226%0"] = TABLE_TableIndirection["v71%0"](TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v228%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v228%0"] + 1, TABLE_TableIndirection["v80%0"][3])));
											TABLE_TableIndirection["v73%0"] = (TABLE_TableIndirection["v226%0"] + TABLE_TableIndirection["v228%0"]) - 1;
											TABLE_TableIndirection["v224%0"] = 0;
											TABLE_TableIndirection["v223%0"] = 5;
										end
										if (TABLE_TableIndirection["v223%0"] == 2) then
											TABLE_TableIndirection["v227%0"] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
											TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v228%0"] + 1] = TABLE_TableIndirection["v227%0"];
											TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v228%0"]] = TABLE_TableIndirection["v227%0"][TABLE_TableIndirection["v80%0"][4]];
											TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
											TABLE_TableIndirection["v223%0"] = 3;
										end
										if (TABLE_TableIndirection["v223%0"] == 1) then
											TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v59[TABLE_TableIndirection["v80%0"][3]];
											TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
											TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
											TABLE_TableIndirection["v228%0"] = TABLE_TableIndirection["v80%0"][2];
											TABLE_TableIndirection["v223%0"] = 2;
										end
										if (TABLE_TableIndirection["v223%0"] == 3) then
											TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
											TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v80%0"][4]];
											TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
											TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
											TABLE_TableIndirection["v223%0"] = 4;
										end
										if (6 == TABLE_TableIndirection["v223%0"]) then
											TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v228%0"]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v228%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v228%0"] + 1, TABLE_TableIndirection["v73%0"]));
											TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
											TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
											TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]]();
											TABLE_TableIndirection["v223%0"] = 7;
										end
										if (5 == TABLE_TableIndirection["v223%0"]) then
											for v457 = TABLE_TableIndirection["v228%0"], TABLE_TableIndirection["v73%0"] do
												TABLE_TableIndirection["v224%0"] = TABLE_TableIndirection["v224%0"] + 1;
												TABLE_TableIndirection["v78%0"][v457] = TABLE_TableIndirection["v225%0"][TABLE_TableIndirection["v224%0"]];
											end
											TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
											TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
											TABLE_TableIndirection["v228%0"] = TABLE_TableIndirection["v80%0"][2];
											TABLE_TableIndirection["v223%0"] = 6;
										end
									end
								end
							elseif (TABLE_TableIndirection["v81%0"] <= 22) then
								if (TABLE_TableIndirection["v81%0"] <= 20) then
									TABLE_TableIndirection["v111%0"] = TABLE_TableIndirection["v80%0"][2];
									TABLE_TableIndirection["v112%0"] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v111%0"] + 2];
									TABLE_TableIndirection["v113%0"] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v111%0"]] + TABLE_TableIndirection["v112%0"];
									TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v111%0"]] = TABLE_TableIndirection["v113%0"];
									if (TABLE_TableIndirection["v112%0"] > 0) then
										if (TABLE_TableIndirection["v113%0"] <= TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v111%0"] + 1]) then
											TABLE_TableIndirection["v312%0"] = 0;
											while true do
												if (TABLE_TableIndirection["v312%0"] == 0) then
													TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
													TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v111%0"] + 3] = TABLE_TableIndirection["v113%0"];
													break;
												end
											end
										end
									elseif (TABLE_TableIndirection["v113%0"] >= TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v111%0"] + 1]) then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v111%0"] + 3] = TABLE_TableIndirection["v113%0"];
									end
								elseif (TABLE_TableIndirection["v81%0"] > 21) then
									TABLE_TableIndirection["v229%0"] = TABLE_TableIndirection["v80%0"][2];
									TABLE_TableIndirection["v230%0"] = {};
									for v291 = 1, #TABLE_TableIndirection["v77%0"] do
										TABLE_TableIndirection["v292%0"] = TABLE_TableIndirection["v77%0"][v291];
										for v315 = 0, #TABLE_TableIndirection["v292%0"] do
											TABLE_TableIndirection["v316%0"] = TABLE_TableIndirection["v292%0"][v315];
											TABLE_TableIndirection["v317%0"] = TABLE_TableIndirection["v316%0"][1];
											TABLE_TableIndirection["v318%0"] = TABLE_TableIndirection["v316%0"][2];
											if ((TABLE_TableIndirection["v317%0"] == TABLE_TableIndirection["v78%0"]) and (TABLE_TableIndirection["v318%0"] >= TABLE_TableIndirection["v229%0"])) then
												TABLE_TableIndirection["v230%0"][TABLE_TableIndirection["v318%0"]] = TABLE_TableIndirection["v317%0"][TABLE_TableIndirection["v318%0"]];
												TABLE_TableIndirection["v316%0"][1] = TABLE_TableIndirection["v230%0"];
											end
										end
									end
								else
									TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = {};
								end
							elseif (TABLE_TableIndirection["v81%0"] <= 24) then
								if (TABLE_TableIndirection["v81%0"] == 23) then
									TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v58[TABLE_TableIndirection["v80%0"][3]];
								else
									TABLE_TableIndirection["v234%0"] = 0;
									TABLE_TableIndirection["v235%0"] = nil;
									TABLE_TableIndirection["v236%0"] = nil;
									TABLE_TableIndirection["v237%0"] = nil;
									TABLE_TableIndirection["v238%0"] = nil;
									while true do
										if (TABLE_TableIndirection["v234%0"] == 1) then
											TABLE_TableIndirection["v73%0"] = (TABLE_TableIndirection["v237%0"] + TABLE_TableIndirection["v235%0"]) - 1;
											TABLE_TableIndirection["v238%0"] = 0;
											TABLE_TableIndirection["v234%0"] = 2;
										end
										if (TABLE_TableIndirection["v234%0"] == 0) then
											TABLE_TableIndirection["v235%0"] = TABLE_TableIndirection["v80%0"][2];
											TABLE_TableIndirection["v236%0"], TABLE_TableIndirection["v237%0"] = TABLE_TableIndirection["v71%0"](TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v235%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v235%0"] + 1, TABLE_TableIndirection["v73%0"])));
											TABLE_TableIndirection["v234%0"] = 1;
										end
										if (TABLE_TableIndirection["v234%0"] == 2) then
											for v463 = TABLE_TableIndirection["v235%0"], TABLE_TableIndirection["v73%0"] do
												TABLE_TableIndirection["v238%0"] = TABLE_TableIndirection["v238%0"] + 1;
												TABLE_TableIndirection["v78%0"][v463] = TABLE_TableIndirection["v236%0"][TABLE_TableIndirection["v238%0"]];
											end
											break;
										end
									end
								end
							elseif (TABLE_TableIndirection["v81%0"] == 25) then
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
							else
								TABLE_TableIndirection["v241%0"] = TABLE_TableIndirection["v80%0"][2];
								do
									return TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v241%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v241%0"] + 1, TABLE_TableIndirection["v80%0"][3]));
								end
							end
						elseif (TABLE_TableIndirection["v81%0"] <= 39) then
							if (TABLE_TableIndirection["v81%0"] <= 32) then
								if (TABLE_TableIndirection["v81%0"] <= 29) then
									if (TABLE_TableIndirection["v81%0"] <= 27) then
										TABLE_TableIndirection["v115%0"] = nil;
										TABLE_TableIndirection["v116%0"] = nil;
										TABLE_TableIndirection["v117%0"] = nil;
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = #TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v117 = TABLE_TableIndirection["v80%0"][2];
										v116 = TABLE_TableIndirection["v78%0"][v117];
										v115 = TABLE_TableIndirection["v78%0"][v117 + 2];
										if (v115 > 0) then
											if (v116 > TABLE_TableIndirection["v78%0"][v117 + 1]) then
												TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
											else
												TABLE_TableIndirection["v78%0"][v117 + 3] = v116;
											end
										elseif (v116 < TABLE_TableIndirection["v78%0"][v117 + 1]) then
											TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
										else
											TABLE_TableIndirection["v78%0"][v117 + 3] = v116;
										end
									elseif (TABLE_TableIndirection["v81%0"] == 28) then
										TABLE_TableIndirection["v242%0"] = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v242%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v242%0"] + 1, TABLE_TableIndirection["v73%0"]));
									else
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]] + TABLE_TableIndirection["v80%0"][4];
									end
								elseif (TABLE_TableIndirection["v81%0"] <= 30) then
									TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]];
								elseif (TABLE_TableIndirection["v81%0"] > 31) then
									TABLE_TableIndirection["v244%0"] = nil;
									TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
									TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
									TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
									TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
									TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
									TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
									v244 = TABLE_TableIndirection["v80%0"][2];
									TABLE_TableIndirection["v78%0"][v244] = TABLE_TableIndirection["v78%0"][v244](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v244 + 1, TABLE_TableIndirection["v80%0"][3]));
									TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
									TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
									TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]]];
									TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
									TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
									if (TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] == TABLE_TableIndirection["v80%0"][4]) then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
									else
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
									end
								else
									TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]]];
								end
							elseif (TABLE_TableIndirection["v81%0"] <= 35) then
								if (TABLE_TableIndirection["v81%0"] <= 33) then
									TABLE_TableIndirection["v127%0"] = TABLE_TableIndirection["v80%0"][2];
									local v128, v129 = TABLE_TableIndirection["v71%0"](TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v127%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v127%0"] + 1, TABLE_TableIndirection["v80%0"][3])));
									TABLE_TableIndirection["v73%0"] = (v129 + TABLE_TableIndirection["v127%0"]) - 1;
									TABLE_TableIndirection["v130%0"] = 0;
									for v145 = TABLE_TableIndirection["v127%0"], TABLE_TableIndirection["v73%0"] do
										TABLE_TableIndirection["v130%0"] = TABLE_TableIndirection["v130%0"] + 1;
										TABLE_TableIndirection["v78%0"][v145] = v128[TABLE_TableIndirection["v130%0"]];
									end
								elseif (TABLE_TableIndirection["v81%0"] == 34) then
									TABLE_TableIndirection["v253%0"] = TABLE_TableIndirection["v69%0"][TABLE_TableIndirection["v80%0"][3]];
									TABLE_TableIndirection["v254%0"] = nil;
									TABLE_TableIndirection["v255%0"] = {};
									v254 = TABLE_TableIndirection["v10%0"]({}, {__index=function(v293, v294)
										TABLE_TableIndirection["v295%0"] = TABLE_TableIndirection["v255%0"][v294];
										return TABLE_TableIndirection["v295%0"][1][TABLE_TableIndirection["v295%0"][2]];
									end,__newindex=function(v296, v297, v298)
										TABLE_TableIndirection["v299%0"] = TABLE_TableIndirection["v255%0"][v297];
										TABLE_TableIndirection["v299%0"][1][TABLE_TableIndirection["v299%0"][2]] = v298;
									end});
									for v301 = 1, TABLE_TableIndirection["v80%0"][4] do
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v302%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										if (TABLE_TableIndirection["v302%0"][1] == 15) then
											TABLE_TableIndirection["v255%0"][v301 - 1] = {TABLE_TableIndirection["v78%0"],TABLE_TableIndirection["v302%0"][3]};
										else
											TABLE_TableIndirection["v255%0"][v301 - 1] = {v58,TABLE_TableIndirection["v302%0"][3]};
										end
										TABLE_TableIndirection["v77%0"][#TABLE_TableIndirection["v77%0"] + 1] = TABLE_TableIndirection["v255%0"];
									end
									TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v30%0"](TABLE_TableIndirection["v253%0"], v254, v59);
								else
									TABLE_TableIndirection["v257%0"] = 0;
									TABLE_TableIndirection["v258%0"] = nil;
									while true do
										if (0 == TABLE_TableIndirection["v257%0"]) then
											TABLE_TableIndirection["v258%0"] = TABLE_TableIndirection["v80%0"][2];
											TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v258%0"]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v258%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v258%0"] + 1, TABLE_TableIndirection["v80%0"][3]));
											break;
										end
									end
								end
							elseif (TABLE_TableIndirection["v81%0"] <= 37) then
								if (TABLE_TableIndirection["v81%0"] == 36) then
									TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = #TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
								else
									TABLE_TableIndirection["v260%0"] = TABLE_TableIndirection["v80%0"][2];
									TABLE_TableIndirection["v261%0"] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
									TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v260%0"] + 1] = TABLE_TableIndirection["v261%0"];
									TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v260%0"]] = TABLE_TableIndirection["v261%0"][TABLE_TableIndirection["v80%0"][4]];
								end
							elseif (TABLE_TableIndirection["v81%0"] > 38) then
								TABLE_TableIndirection["v265%0"] = 0;
								TABLE_TableIndirection["v266%0"] = nil;
								while true do
									if (TABLE_TableIndirection["v265%0"] == 6) then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v59[TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v265%0"] = 7;
									end
									if (TABLE_TableIndirection["v265%0"] == 4) then
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = {};
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v265%0"] = 5;
									end
									if (TABLE_TableIndirection["v265%0"] == 3) then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										v59[TABLE_TableIndirection["v80%0"][3]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v265%0"] = 4;
									end
									if (TABLE_TableIndirection["v265%0"] == 0) then
										TABLE_TableIndirection["v266%0"] = nil;
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v265%0"] = 1;
									end
									if (TABLE_TableIndirection["v265%0"] == 5) then
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v59[TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v80%0"][4]];
										TABLE_TableIndirection["v265%0"] = 6;
									end
									if (TABLE_TableIndirection["v265%0"] == 7) then
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]][TABLE_TableIndirection["v80%0"][4]];
										break;
									end
									if (2 == TABLE_TableIndirection["v265%0"]) then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v266%0"] = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v266%0"]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v266%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v266%0"] + 1, TABLE_TableIndirection["v80%0"][3]));
										TABLE_TableIndirection["v265%0"] = 3;
									end
									if (TABLE_TableIndirection["v265%0"] == 1) then
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3];
										TABLE_TableIndirection["v265%0"] = 2;
									end
								end
							elseif (TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] == TABLE_TableIndirection["v80%0"][4]) then
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
							else
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
							end
						elseif (TABLE_TableIndirection["v81%0"] <= 46) then
							if (TABLE_TableIndirection["v81%0"] <= 42) then
								if (TABLE_TableIndirection["v81%0"] <= 40) then
									TABLE_TableIndirection["v131%0"] = 0;
									TABLE_TableIndirection["v132%0"] = nil;
									while true do
										if (TABLE_TableIndirection["v131%0"] == 0) then
											TABLE_TableIndirection["v132%0"] = TABLE_TableIndirection["v80%0"][2];
											TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v132%0"]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v132%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v132%0"] + 1, TABLE_TableIndirection["v73%0"]));
											break;
										end
									end
								elseif (TABLE_TableIndirection["v81%0"] == 41) then
									if (TABLE_TableIndirection["v80%0"][2] == TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]]) then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
									else
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
									end
								else
									TABLE_TableIndirection["v267%0"] = TABLE_TableIndirection["v80%0"][2];
									TABLE_TableIndirection["v268%0"] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v267%0"]];
									TABLE_TableIndirection["v269%0"] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v267%0"] + 2];
									if (TABLE_TableIndirection["v269%0"] > 0) then
										if (TABLE_TableIndirection["v268%0"] > TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v267%0"] + 1]) then
											TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
										else
											TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v267%0"] + 3] = TABLE_TableIndirection["v268%0"];
										end
									elseif (TABLE_TableIndirection["v268%0"] < TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v267%0"] + 1]) then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
									else
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v267%0"] + 3] = TABLE_TableIndirection["v268%0"];
									end
								end
							elseif (TABLE_TableIndirection["v81%0"] <= 44) then
								if (TABLE_TableIndirection["v81%0"] > 43) then
									if TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
									else
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
									end
								else
									TABLE_TableIndirection["v270%0"] = TABLE_TableIndirection["v80%0"][2];
									local v271, v272 = TABLE_TableIndirection["v71%0"](TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v270%0"]](TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v270%0"] + 1]));
									TABLE_TableIndirection["v73%0"] = (v272 + TABLE_TableIndirection["v270%0"]) - 1;
									TABLE_TableIndirection["v273%0"] = 0;
									for v306 = TABLE_TableIndirection["v270%0"], TABLE_TableIndirection["v73%0"] do
										TABLE_TableIndirection["v307%0"] = 0;
										while true do
											if (TABLE_TableIndirection["v307%0"] == 0) then
												TABLE_TableIndirection["v273%0"] = TABLE_TableIndirection["v273%0"] + 1;
												TABLE_TableIndirection["v78%0"][v306] = v271[TABLE_TableIndirection["v273%0"]];
												break;
											end
										end
									end
								end
							elseif (TABLE_TableIndirection["v81%0"] > 45) then
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
							else
								TABLE_TableIndirection["v275%0"] = 0;
								TABLE_TableIndirection["v276%0"] = nil;
								TABLE_TableIndirection["v277%0"] = nil;
								TABLE_TableIndirection["v278%0"] = nil;
								TABLE_TableIndirection["v279%0"] = nil;
								while true do
									if (0 == TABLE_TableIndirection["v275%0"]) then
										TABLE_TableIndirection["v276%0"] = nil;
										TABLE_TableIndirection["v277%0"], TABLE_TableIndirection["v278%0"] = nil;
										TABLE_TableIndirection["v279%0"] = nil;
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v275%0"] = 1;
									end
									if (TABLE_TableIndirection["v275%0"] == 1) then
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v58[TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v58[TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v275%0"] = 2;
									end
									if (TABLE_TableIndirection["v275%0"] == 3) then
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v275%0"] = 4;
									end
									if (TABLE_TableIndirection["v275%0"] == 15) then
										TABLE_TableIndirection["v277%0"], TABLE_TableIndirection["v278%0"] = TABLE_TableIndirection["v71%0"](TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v279%0"]](TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v279%0"] + 1]));
										TABLE_TableIndirection["v73%0"] = (TABLE_TableIndirection["v278%0"] + TABLE_TableIndirection["v279%0"]) - 1;
										TABLE_TableIndirection["v276%0"] = 0;
										for v472 = TABLE_TableIndirection["v279%0"], TABLE_TableIndirection["v73%0"] do
											TABLE_TableIndirection["v276%0"] = TABLE_TableIndirection["v276%0"] + 1;
											TABLE_TableIndirection["v78%0"][v472] = TABLE_TableIndirection["v277%0"][TABLE_TableIndirection["v276%0"]];
										end
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v275%0"] = 16;
									end
									if (TABLE_TableIndirection["v275%0"] == 2) then
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v58[TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v58[TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v275%0"] = 3;
									end
									if (TABLE_TableIndirection["v275%0"] == 7) then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = #TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v275%0"] = 8;
									end
									if (TABLE_TableIndirection["v275%0"] == 11) then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v279%0"] = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v277%0"], TABLE_TableIndirection["v278%0"] = TABLE_TableIndirection["v71%0"](TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v279%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v279%0"] + 1, TABLE_TableIndirection["v80%0"][3])));
										TABLE_TableIndirection["v73%0"] = (TABLE_TableIndirection["v278%0"] + TABLE_TableIndirection["v279%0"]) - 1;
										TABLE_TableIndirection["v276%0"] = 0;
										TABLE_TableIndirection["v275%0"] = 12;
									end
									if (TABLE_TableIndirection["v275%0"] == 13) then
										TABLE_TableIndirection["v276%0"] = 0;
										for v475 = TABLE_TableIndirection["v279%0"], TABLE_TableIndirection["v73%0"] do
											TABLE_TableIndirection["v476%0"] = 0;
											while true do
												if (0 == TABLE_TableIndirection["v476%0"]) then
													TABLE_TableIndirection["v276%0"] = TABLE_TableIndirection["v276%0"] + 1;
													TABLE_TableIndirection["v78%0"][v475] = TABLE_TableIndirection["v277%0"][TABLE_TableIndirection["v276%0"]];
													break;
												end
											end
										end
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v279%0"] = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v279%0"]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v279%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v279%0"] + 1, TABLE_TableIndirection["v73%0"]));
										TABLE_TableIndirection["v275%0"] = 14;
									end
									if (TABLE_TableIndirection["v275%0"] == 12) then
										for v477 = TABLE_TableIndirection["v279%0"], TABLE_TableIndirection["v73%0"] do
											TABLE_TableIndirection["v276%0"] = TABLE_TableIndirection["v276%0"] + 1;
											TABLE_TableIndirection["v78%0"][v477] = TABLE_TableIndirection["v277%0"][TABLE_TableIndirection["v276%0"]];
										end
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v279%0"] = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v277%0"], TABLE_TableIndirection["v278%0"] = TABLE_TableIndirection["v71%0"](TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v279%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v279%0"] + 1, TABLE_TableIndirection["v73%0"])));
										TABLE_TableIndirection["v73%0"] = (TABLE_TableIndirection["v278%0"] + TABLE_TableIndirection["v279%0"]) - 1;
										TABLE_TableIndirection["v275%0"] = 13;
									end
									if (TABLE_TableIndirection["v275%0"] == 14) then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]] % TABLE_TableIndirection["v80%0"][4];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v279%0"] = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v275%0"] = 15;
									end
									if (TABLE_TableIndirection["v275%0"] == 5) then
										TABLE_TableIndirection["v276%0"] = 0;
										for v480 = TABLE_TableIndirection["v279%0"], TABLE_TableIndirection["v73%0"] do
											TABLE_TableIndirection["v276%0"] = TABLE_TableIndirection["v276%0"] + 1;
											TABLE_TableIndirection["v78%0"][v480] = TABLE_TableIndirection["v277%0"][TABLE_TableIndirection["v276%0"]];
										end
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v279%0"] = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v279%0"]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v279%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v279%0"] + 1, TABLE_TableIndirection["v73%0"]));
										TABLE_TableIndirection["v275%0"] = 6;
									end
									if (TABLE_TableIndirection["v275%0"] == 9) then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = #TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]] % TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]];
										TABLE_TableIndirection["v275%0"] = 10;
									end
									if (TABLE_TableIndirection["v275%0"] == 8) then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]] % TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3] + TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]];
										TABLE_TableIndirection["v275%0"] = 9;
									end
									if (6 == TABLE_TableIndirection["v275%0"]) then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v58[TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v58[TABLE_TableIndirection["v80%0"][3]];
										TABLE_TableIndirection["v275%0"] = 7;
									end
									if (TABLE_TableIndirection["v275%0"] == 10) then
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3] + TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]] + TABLE_TableIndirection["v80%0"][4];
										TABLE_TableIndirection["v275%0"] = 11;
									end
									if (4 == TABLE_TableIndirection["v275%0"]) then
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]] + TABLE_TableIndirection["v80%0"][4];
										TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
										TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
										TABLE_TableIndirection["v279%0"] = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v277%0"], TABLE_TableIndirection["v278%0"] = TABLE_TableIndirection["v71%0"](TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v279%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v279%0"] + 1, TABLE_TableIndirection["v80%0"][3])));
										TABLE_TableIndirection["v73%0"] = (TABLE_TableIndirection["v278%0"] + TABLE_TableIndirection["v279%0"]) - 1;
										TABLE_TableIndirection["v275%0"] = 5;
									end
									if (TABLE_TableIndirection["v275%0"] == 16) then
										TABLE_TableIndirection["v279%0"] = TABLE_TableIndirection["v80%0"][2];
										TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v279%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v279%0"] + 1, TABLE_TableIndirection["v73%0"]));
										break;
									end
								end
							end
						elseif (TABLE_TableIndirection["v81%0"] <= 49) then
							if (TABLE_TableIndirection["v81%0"] <= 47) then
								TABLE_TableIndirection["v133%0"] = nil;
								local v134, v135;
								TABLE_TableIndirection["v136%0"] = nil;
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v58[TABLE_TableIndirection["v80%0"][3]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v58[TABLE_TableIndirection["v80%0"][3]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v58[TABLE_TableIndirection["v80%0"][3]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v58[TABLE_TableIndirection["v80%0"][3]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]] + TABLE_TableIndirection["v80%0"][4];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								v136 = TABLE_TableIndirection["v80%0"][2];
								v134, v135 = TABLE_TableIndirection["v71%0"](TABLE_TableIndirection["v78%0"][v136](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v136 + 1, TABLE_TableIndirection["v80%0"][3])));
								TABLE_TableIndirection["v73%0"] = (v135 + v136) - 1;
								v133 = 0;
								for v148 = v136, TABLE_TableIndirection["v73%0"] do
									TABLE_TableIndirection["v149%0"] = 0;
									while true do
										if (TABLE_TableIndirection["v149%0"] == 0) then
											v133 = v133 + 1;
											TABLE_TableIndirection["v78%0"][v148] = v134[v133];
											break;
										end
									end
								end
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								v136 = TABLE_TableIndirection["v80%0"][2];
								TABLE_TableIndirection["v78%0"][v136] = TABLE_TableIndirection["v78%0"][v136](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v136 + 1, TABLE_TableIndirection["v73%0"]));
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v58[TABLE_TableIndirection["v80%0"][3]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = v58[TABLE_TableIndirection["v80%0"][3]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = #TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]] % TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3] + TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = #TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]] % TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3] + TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]] + TABLE_TableIndirection["v80%0"][4];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								v136 = TABLE_TableIndirection["v80%0"][2];
								v134, v135 = TABLE_TableIndirection["v71%0"](TABLE_TableIndirection["v78%0"][v136](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v136 + 1, TABLE_TableIndirection["v80%0"][3])));
								TABLE_TableIndirection["v73%0"] = (v135 + v136) - 1;
								v133 = 0;
								for v150 = v136, TABLE_TableIndirection["v73%0"] do
									v133 = v133 + 1;
									TABLE_TableIndirection["v78%0"][v150] = v134[v133];
								end
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								v136 = TABLE_TableIndirection["v80%0"][2];
								v134, v135 = TABLE_TableIndirection["v71%0"](TABLE_TableIndirection["v78%0"][v136](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v136 + 1, TABLE_TableIndirection["v73%0"])));
								TABLE_TableIndirection["v73%0"] = (v135 + v136) - 1;
								v133 = 0;
								for v153 = v136, TABLE_TableIndirection["v73%0"] do
									v133 = v133 + 1;
									TABLE_TableIndirection["v78%0"][v153] = v134[v133];
								end
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								v136 = TABLE_TableIndirection["v80%0"][2];
								TABLE_TableIndirection["v78%0"][v136] = TABLE_TableIndirection["v78%0"][v136](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v136 + 1, TABLE_TableIndirection["v73%0"]));
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]] % TABLE_TableIndirection["v80%0"][4];
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								v136 = TABLE_TableIndirection["v80%0"][2];
								v134, v135 = TABLE_TableIndirection["v71%0"](TABLE_TableIndirection["v78%0"][v136](TABLE_TableIndirection["v78%0"][v136 + 1]));
								TABLE_TableIndirection["v73%0"] = (v135 + v136) - 1;
								v133 = 0;
								for v156 = v136, TABLE_TableIndirection["v73%0"] do
									v133 = v133 + 1;
									TABLE_TableIndirection["v78%0"][v156] = v134[v133];
								end
								TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								TABLE_TableIndirection["v80%0"] = TABLE_TableIndirection["v68%0"][TABLE_TableIndirection["v72%0"]];
								v136 = TABLE_TableIndirection["v80%0"][2];
								TABLE_TableIndirection["v78%0"][v136](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], v136 + 1, TABLE_TableIndirection["v73%0"]));
							elseif (TABLE_TableIndirection["v81%0"] == 48) then
								if not TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] then
									TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
								else
									TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v80%0"][3];
								end
							else
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v80%0"][3] + TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][4]];
							end
						elseif (TABLE_TableIndirection["v81%0"] <= 51) then
							if (TABLE_TableIndirection["v81%0"] == 50) then
								TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]] % TABLE_TableIndirection["v80%0"][4];
							else
								v59[TABLE_TableIndirection["v80%0"][3]] = TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]];
							end
						elseif (TABLE_TableIndirection["v81%0"] == 52) then
							TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][2]][TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v80%0"][3]]] = TABLE_TableIndirection["v80%0"][4];
						else
							TABLE_TableIndirection["v286%0"] = TABLE_TableIndirection["v80%0"][2];
							TABLE_TableIndirection["v78%0"][TABLE_TableIndirection["v286%0"]](TABLE_TableIndirection["v13%0"](TABLE_TableIndirection["v78%0"], TABLE_TableIndirection["v286%0"] + 1, TABLE_TableIndirection["v80%0"][3]));
						end
						TABLE_TableIndirection["v72%0"] = TABLE_TableIndirection["v72%0"] + 1;
					end
				end;
			end;
			return TABLE_TableIndirection["v30%0"](TABLE_TableIndirection["v29%0"](), {}, v17)(...);
		end
		if (TABLE_TableIndirection["v18%0"] == 1) then
			TABLE_TableIndirection["v21%0"] = nil;
			TABLE_TableIndirection["v21%0"] = function(v63, v64, v65)
				if v65 then
					TABLE_TableIndirection["v88%0"] = (v63 / ((1 + 1) ^ (v64 - (2 - 1)))) % ((2 + 0) ^ (((v65 - (1 + 0)) - (v64 - 1)) + (2 - 1)));
					return TABLE_TableIndirection["v88%0"] - (TABLE_TableIndirection["v88%0"] % (2 - (378 - (142 + 235))));
				else
					TABLE_TableIndirection["v89%0"] = (1553 - (1126 + 425)) ^ (v64 - (406 - (118 + 287)));
					return (((v63 % (TABLE_TableIndirection["v89%0"] + TABLE_TableIndirection["v89%0"])) >= TABLE_TableIndirection["v89%0"]) and (3 - 2)) or ((5085 - 3964) - (118 + 1003));
				end
			end;
			TABLE_TableIndirection["v22%0"] = nil;
			TABLE_TableIndirection["v18%0"] = 2;
		end
	end
end
return v15("LOL!463O0003063O00737472696E6703043O006368617203043O00627974652O033O0073756203053O0062697433322O033O0062697403043O0062786F7203053O007461626C6503063O00636F6E63617403063O00696E73657274030A3O007363726970745F6B657903083O00FAE6E21ACE9EF53B03083O007EB1A3BB4586DBA7028O00026O00F03F03113O00E3DF47209E4D2FCBC7796DE26A0BE6961603073O004AA5B32654D72903043O00307EBB0003063O00DC464E9E30760003043O00C0AAEE7403053O0072B69BCB4403113O0055A9BFEC6F3276ABAAC71F6350849DBD1603063O005613C5DE982603043O0067616D6503073O00D4546CF55A432203073O00569C2018851D26030A3O006C6F6164737472696E6703073O00482O747047657403043O007631253003043O00482O54502O033O0080A07703073O0037C7E523C81D1C2O033O0047455403113O0052F6DD203A70FFD2202C2DAFFF153031AA03053O0073149ABC5403113O0070245E2C0C5AFD583C6061707DD9756D0F03073O009836483F58453E03043O00C78FC87C03063O00DFB1BFED4CE103013O002F03043O004098E56A03073O00DB36A9C05A305003053O00415614355A03043O004529226003013O003A03043O00AA93925A03063O004BDCA3B76A6203043O0014EACE6703053O00B962DAEB57030D3O00C72926E9DCACDE2F24E7CAA5D903063O00CAAB5C4786BE03043O0067C2238503043O00E849A14C03043O00AD89070D03053O007EDBB9223D03073O001FCD4C7B6E63E003083O00876CAE3E121E179303043O00A0B96F9B03083O00A7D6894AAB78CE5303023O009DA103063O00C7EB90523D9803043O001146FC7B03043O004B6776D903043O00D104354403063O007EA7341074D9030C3O00CB262593A00AE8CD2F2C85A603073O009CA84E40E0D47903093O004ABAF09F49E2B0CF1F03043O00AE678EC500FD3O00120E3O00013O00206O000200122O000100013O00202O00010001000300122O000200013O00202O00020002000400122O000300053O00062O0003000A0001000100042E3O000A000100120A000300063O00200300040003000700120A000500083O00200300050005000900120A000600083O00200300060006000A00062200073O000100062O000F3O00054O000F3O00064O000F8O000F3O00044O000F3O00014O000F3O00024O0027000800073O00122O0009000C3O00122O000A000D6O0008000A000200122O0008000B6O00085O00122O000900013O00202O00090009000200122O000A00013O00202O000A000A000300120A000B00013O002003000B000B000400120A000C00053O000630000C00260001000100042E3O0026000100120A000C00063O002003000D000C000700120A000E00083O002003000E000E000900120A000F00083O002003000F000F000A00062200100001000100062O000F3O000E4O000F3O000F4O000F3O00094O000F3O000D4O000F3O000A4O000F3O000B3O0012190011000E6O001200123O002O26001100340001000E00042E3O003400010012190012000E3O002O260012004C0001000E00042E3O004C00010012190013000E3O002O260013003E0001000F00042E3O003E00010012190012000F3O00042E3O004C0001002O260013003A0001000E00042E3O003A00012O000F001400103O001211001500103O00122O001600116O00140016000200202O00080014000E4O001400103O00122O001500123O00122O001600136O00140016000200202O00080014001400122O0013000F3O00042E3O003A0001002O26001200370001000F00042E3O003700012O000F001300103O001219001400153O001219001500164O00230013001500020020340008001300142O000F001300103O001220001400173O00122O001500186O0013001500024O00130008001300262O0013007E0001000F00042E3O007E000100120A001300193O00062C0013006D00013O00042E3O006D000100120A001300194O0009001400103O00122O0015001A3O00122O0016001B6O0014001600024O00130013001400062O0013006D00013O00042E3O006D000100120A0013001C3O001213001400193O00202O00140014001D00202O00160008001E4O001400166O00133O00024O00130001000100044O00FB000100120A0013001F3O00062C001300FB00013O00042E3O00FB000100120A0013001F4O0009001400103O00122O001500203O00122O001600216O0014001600024O00130013001400062O001300FB00013O00042E3O00FB000100120A0013001F3O00202500130013002200200300150008001E00020C001600024O003500130016000100042E3O00FB00012O000F001300103O001220001400233O00122O001500246O0013001500024O00130008001300262O001300530001000E00042E3O005300010012190013000E6O001400153O002O260013008C0001000E00042E3O008C00010012190014000E6O001500153O0012190013000F3O002O26001300870001000F00042E3O00870001002O260014008E0001000E00042E3O008E00010012190015000E3O002O26001500990001000F00042E3O009900012O000F001600103O00120D001700253O00122O001800266O00160018000200202O00080016000F00044O00530001002O26001500910001000E00042E3O009100010012190016000E6O001700173O002O260016009D0001000E00042E3O009D00010012190017000E3O000E29000E00EA0001001700042E3O00EA00012O000F001800103O001204001900273O00122O001A00286O0018001A000200202O0008001800294O001800103O00122O0019002A3O00122O001A002B6O0018001A00024O001900103O00122O001A002C3O00122O001B002D6O0019001B000200122O001A002E6O001B00103O00122O001C002F3O00122O001D00306O001B001D00024O001B0008001B4O001C00103O00122O001D00313O00122O001E00326O001C001E00024O001C0008001C4O001D00103O00122O001E00333O00122O001F00346O001D001F00024O001E00103O00122O001F00353O00122O002000366O001E002000024O001F00103O00122O002000373O00122O002100386O001F002100024O001F0008001F4O002000103O00122O002100393O00122O0022003A6O0020002200024O002100103O00122O0022003B3O00122O0023003C6O0021002300024O0021000800214O002200103O00122O0023003D3O00122O0024003E6O0022002400024O002300103O00122O0024003F3O00122O002500406O0023002500024O00230008002300122O0024000B6O002500103O00122O002600413O00122O002700426O0025002700024O0025000800254O002600103O00122O002700433O00122O002800446O0026002800024O002700103O00122O002800453O00122O002900466O0027002900024O0019001900274O00080018001900122O0017000F3O002O26001700A00001000F00042E3O00A000010012190015000F3O00042E3O0091000100042E3O00A0000100042E3O0091000100042E3O009D000100042E3O0091000100042E3O0053000100042E3O008E000100042E3O0053000100042E3O0087000100042E3O0053000100042E3O00FB000100042E3O0037000100042E3O00FB000100042E3O003400012O00168O00063O00013O00033O00033O00028O00026O00F03F026O007040022F3O001219000200016O000300033O000E29000200080001000200042E3O000800012O001700046O000F000500034O001A000400054O001200045O002O26000200020001000100042E3O000200012O001500046O0010000300043O00122O000400026O00055O00122O000600023O00042O0004002C00012O0017000800014O002F000900036O000A00026O000B00036O000C00046O000D00056O000E8O000F00073O00202O0010000700024O000D00106O000C3O00024O000D00046O000E00056O000F00016O001000016O00100007001000102O0010000200104O001100016O00110007001100102O00110002001100202O0011001100024O000E00116O000D8O000B3O000200202O000B000B00034O000A000B6O00083O0001000414000400100001001219000200023O00042E3O000200012O00063O00017O00033O00028O00026O00F03F026O007040023C3O001219000200016O000300033O001219000400013O002O26000400030001000100042E3O00030001002O260002000B0001000200042E3O000B00012O001700056O000F000600034O001A000500064O001200055O002O26000200020001000100042E3O00020001001219000500013O002O26000500120001000200042E3O00120001001219000200023O00042E3O00020001002O260005000E0001000100042E3O000E00012O001500066O0010000300063O00122O000600026O00075O00122O000800023O00042O0006003600012O0017000A00014O002F000B00036O000C00026O000D00036O000E00046O000F00056O00108O001100093O00202O0012000900024O000F00126O000E3O00024O000F00046O001000056O001100016O001200016O00120009001200102O0012000200124O001300016O00130009001300102O00130002001300202O0013001300024O001000136O000F8O000D3O000200202O000D000D00034O000C000D6O000A3O00010004140006001A0001001219000500023O00042E3O000E000100042E3O0002000100042E3O0003000100042E3O000200012O00063O00017O00023O00026O006940030A3O006C6F6164737472696E6702073O002O263O00060001000100042E3O0006000100120A000200024O000F000300014O00070002000200022O00050002000100012O00063O00017O00", TABLE_TableIndirection["v9%0"](), ...);
