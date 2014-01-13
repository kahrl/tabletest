-- tabletest mod
-- Minetest mod for testing formspec tables
--
-- Copyright © 2013 Kahrl <kahrl@gmx.net>
-- This work is free. You can redistribute it and/or modify it under the
-- terms of the Do What The Fuck You Want To Public License, Version 2,
-- as published by Sam Hocevar. See the COPYING file for more details.
--

function tabletest_formspec(selected)
	local buttons = {
		{"btn_reset", "Reset"},
		{"btn_simple", "Simple"},
		{"btn_align", "Align"},
		{"btn_image", "Image"},
		{"btn_color", "Color"},
		{"btn_indent", "Indent"},
		{"btn_tree", "Tree"},
		{"btn_inline", "Inline"},
		{"btn_inlineimg", "Inline img"},
		{"btn_exit", "Close"},
	}
	local formspec = "size[12,10]"
	for i,button in ipairs(buttons) do
		local buttonname = button[1]
		local buttontext = button[2]
		local buttontype = "button"
		if buttonname == selected then
			buttontext = "*" .. buttontext .. "*"
		end
		if buttonname == "btn_exit" then
			buttontype = "button_exit"
		end
		local x = 0.5 + 2.1 * ((i-1) % 5)
		local y = 0.5 + 1.1 * math.floor((i-1) / 5)
		formspec = formspec .. buttontype .. "[" .. x .. "," .. y ..
			";2,1;" .. buttonname .. ";" .. buttontext .. "]"
	end

	if selected == "btn_simple" then
		-- Simple
		formspec = formspec ..
			"tablecolumns[text]" ..
			"table[0.5,2.7;9.4,6.8;mytable;" ..
			"Lorem ipsum dolor sit amet\\, consectetur adipiscing elit.," ..
			"Donec a diam lectus.," ..
			"Sed sit amet ipsum mauris.," ..
			"Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.," ..
			"Donec et mollis dolor.," ..
			"Praesent et diam eget libero egestas mattis sit amet vitae augue.," ..
			"Nam tincidunt congue enim\\, ut porta lorem lacinia consectetur.," ..
			"Donec ut libero sed arcu vehicula ultricies a non tortor.," ..
			"Lorem ipsum dolor sit amet\\, consectetur adipiscing elit.," ..
			"Aenean ut gravida lorem.," ..
			"Ut turpis felis\\, pulvinar a semper sed\\, adipiscing id dolor.," ..
			"Pellentesque auctor nisi id magna consequat sagittis.," ..
			"Curabitur dapibus enim sit amet elit pharetra tincidunt feugiat nisl imperdiet.," ..
			"Ut convallis libero in urna ultrices accumsan.," ..
			"Donec sed odio eros.," ..
			"Donec viverra mi quis quam pulvinar at malesuada arcu rhoncus.," ..
			"Cum sociis natoque penatibus et magnis dis parturient montes\\, nascetur ridiculus mus.," ..
			"In rutrum accumsan ultricies.," ..
			"Mauris vitae nisi at sem facilisis semper ac in est." ..
			";0]"

	elseif selected == "btn_align" then
		-- Align
		formspec = formspec ..
			"tablecolumns[" ..
			"text,align=left;" ..
			"text,align=center;" ..
			"text,align=right]" ..
			"table[0.5,2.7;9.4,6.8;mytable;" ..
			"Top left,Top center,Top right," ..
			"Mid left,Mid center,Mid right," ..
			"Bottom left,Bottom center,Bottom right" ..
			";2]"

	elseif selected == "btn_image" then
		-- Image
		local img1 = minetest.formspec_escape("tabletest.png")
		local img2 = minetest.formspec_escape("default_wood.png^[brighten")
		formspec = formspec ..
			"tablecolumns[" ..
			"image,1="..img1..",2="..img2..";" ..
			"text]" ..
			"table[0.5,2.7;9.4,6.8;mytable;" ..
			",Row without image," ..
			"1,Row with tabletest image," ..
			"2,Row with bright wood image," ..
			"1,Row with tabletest image," ..
			",Row without image]"

	elseif selected == "btn_color" then
		-- Color
		formspec = formspec ..
			"tableoptions[" ..
			"color=#ff8000;" ..
			"background=#0368;" ..
			"border=true;" ..
			"highlight=#00008040;" ..
			"highlight_text=#7fffff]" ..
			"tablecolumns[" ..
			"color;" ..
			"text,width=5;" ..
			"color,span=4;" ..
			"text,width=5;" ..
			"color,span=1;" ..
			"text,width=5;" ..
			"text,width=5;" ..
			"text,width=5]" ..
			"table[0.5,2.7;9.4,6.8;mytable;" ..
			"#f00,Red,#ff0,Yellow,#fff,White,Yellow,Red," ..
			",This,,row,,uses,tableoptions,color," ..
			"#00f,This,,row,,is,all,blue]"

	elseif selected == "btn_indent" then
		-- Indent
		formspec = formspec ..
			"tablecolumns[indent;text;indent,width=0.1;text]" ..
			"table[0.5,2.7;9.4,6.8;mytable;" ..
			"0,Indent 0,0,Small indent width test," ..
			"1,Indent 1,1,Indent 1," ..
			"1,Indent 1 again,1,Indent 1 again," ..
			"2,Indent 2,2,Indent 2," ..
			"4,Indent 4,4,Indent 4," ..
			"4,Indent 4 again,4,Indent 4 again," ..
			"1,Indent 1 yet again,1,Indent 1 yet again," ..
			"1,Indent 1 too often,1,Indent 1 too often," ..
			"2,Indent 2 again,2,Indent 2 again," ..
			"3,Indent 3,3,Indent 3;4]"

	elseif selected == "btn_tree" then
		-- Tree
		formspec = formspec ..
			"tableoptions[opendepth=2]" ..
			"tablecolumns[tree;text;tree,width=0.1;text]" ..
			"table[0.5,2.7;9.4,6.8;mytable;" ..
			"0,Indent 0,0,Small indent width test," ..
			"1,Indent 1,1,Indent 1," ..
			"1,Indent 1 again,1,Indent 1 again," ..
			"2,Indent 2,2,Indent 2," ..
			"4,Indent 4,4,Indent 4," ..
			"4,Indent 4 again,4,Indent 4 again," ..
			"1,Indent 1 yet again,1,Indent 1 yet again," ..
			"1,Indent 1 too often,1,Indent 1 too often," ..
			"2,Indent 2 again,2,Indent 2 again," ..
			"3,Indent 3,3,Indent 3;4]"

	elseif selected == "btn_inline" then
		-- Inline
		formspec = formspec ..
			"tablecolumns[" ..
			"text,align=inline;" ..
			"color,span=1;" ..
			"text,align=inline,padding=0;" ..
			"text,align=inline,padding=0]" ..
			"table[0.5,2.7;9.4,6.8;mytable;" ..
			"Roses are ,#b22,red,.," ..
			"Violets are ,#22b,blue,.," ..
			",#403818,Onions, stink.," ..
			"And so do you.;4]"

	elseif selected == "btn_inlineimg" then
		-- Inline image
		local img1 = minetest.formspec_escape("tabletest.png")
		local img2 = minetest.formspec_escape("default_wood.png^[brighten")
		formspec = formspec ..
			"tablecolumns[tree;" ..
			"image,align=inline,1="..img1..",2="..img2 ..
				",tooltip=An inline image;" ..
			"text;tree,width=0.1;text]" ..
			"table[0.5,2.7;9.4,6.8;mytable;" ..
			"0,0,Indent 0,0,Small indent width test," ..
			"1,1,Indent 1,1,Indent 1," ..
			"1,2,Indent 1 again,1,Indent 1 again," ..
			"2,0,Indent 2,2,Indent 2," ..
			"4,1,Indent 4,4,Indent 4," ..
			"4,2,Indent 4 again,4,Indent 4 again," ..
			"1,0,Indent 1 yet again,1,Indent 1 yet again," ..
			"1,1,Indent 1 too often,1,Indent 1 too often," ..
			"2,2,Indent 2 again,2,Indent 2 again," ..
			"3,0,Indent 3,3,Indent 3;4]"

	end

	return formspec
end

minetest.register_node("tabletest:tabletest", {
	description = "Tabletest",
	tiles = {"tabletest.png"},
	groups = {choppy=2,oddly_breakable_by_hand=3},

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Tabletest")
		meta:set_string("formspec", tabletest_formspec("btn_reset"))
	end,

	on_receive_fields = function(pos, formname, fields, sender)
		local selected = ""
		for fieldname, value in pairs(fields) do
			if fieldname:sub(1,4) == "btn_" then
				selected = fieldname
			end
		end
		if selected ~= "" and selected ~= "btn_exit" then
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", tabletest_formspec(selected))
		end
		if fields["mytable"] ~= nil then
			local evt = fields["mytable"]
			minetest.debug("Tabletest: Got event: \"" .. evt .. "\"")
			minetest.debug(dump(minetest.explode_table_event(evt)))
		end
	end,
})

minetest.register_craft({
	output = "tabletest:tabletest",
	recipe = {
		{"",           "group:wood", ""          },
		{"group:wood", "group:wood", "group:wood"},
		{"",           "group:wood", ""          },
	}
})
