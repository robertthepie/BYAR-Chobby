--[[ -- example
    {
        Header = "bla",
        Text = "bla",
        Url = "https://www.beyondallreason.info",
        UrlText = "Beyond All Reason Website",
        Image = "LuaMenu/configs/gameConfig/byar/images/bla.png",
        Time = "2023-05-06T14:00:00", -- needs to be in UTC and is converted to user's local timezone, shows the time difference
    }
]]

local welcomePanelItems = {
    {
        Header = "Welcome to Beyond All Reason",
        Text = "Welcome back Commander. We hope you are ready for epic Singleplayer and Multiplayer battles. Check out our Discord and join the community!\n",
    },

    {
        Header = "The Lightbringer Update is Here!",
        Text = "Commanders, after two weeks of a testing run for the Lightbringer Update, we are thrilled to announce the merge went without any major issues. This update represents the largest visual overhaul we have ever attempted. Enjoy BAR battles being more lit than ever!" .. " \n" .. " \n" .. "We have prepared a detailed post about the update and a Cinematic Highlights Video, check it out!",
	    Image = "LuaMenu/images/welcomepanel/lightbringerbox.png",
        Url = "https://www.beyondallreason.info/news/lightbringer-update",
        UrlText = "Read the Full Changes",
    },

    {
        Header = "Nation Wars #4 – Registration Open",
        Text = "The 4th edition of our friendly competition to find out which nation is the best at BAR is coming in hot this June!\nWill the United States defend their title, or will YOU claim it and bolster your flag's pride?".." \n".." \n".."Join the Nation Wars Discord, rally your fellows, and form a team of 4 to 6 players to represent your nation!\nIf more than 2 teams register for the same nation, they will play national qualifiers to determine the best 2 to enter the main event.".." \n".." \n".."You have until June 6 to sign up, before battling it out in 4v4 against the other nations on the weekends of June 14/15 and June 21/22.\nFull rules / format / map pool / schedule available on the Nation Wars Discord.",
        Image = "LuaMenu/images/nation_wars.png",
        Url = "https://discord.gg/qurXWcjmNN",
        UrlText = "Nation Wars Discord",
    },

    {
        Header = "Upcoming Events",
    },

    {
        Header = "Factory Costs Modoption Test Lobby",
        Text = "We will be testing the new modoption which reduces the cost of T2 factories. Join in on the fun and help find the most broken new strategies!",
        Time = "2025-06-04T17:00:00",
        Url = "https://discord.com/channels/549281623154229250/1378679303595888710",
        UrlText = "Join the Discussion",
    },

    {
        Header = "Discord Wars - 5v5 Tournament",
        Text = "A few of the National BAR discords have teamed up to host a 5v5 tournament this Friday." .. " \n" .. " \n" .. "All are welcome, no matter your skill. Teams will be balanced for an even playing field.  No team? No problem! Sign up and you'll be paired with your dream team!",
        Time = "2025-06-06T18:00:00",
        Url = "https://challonge.com/DiscordWars",
        UrlText = "Sign Up",
    },

    {
        Header = "Now Available: BAR Guides",
        Text = "New to Beyond All Reason? Check out these new Guides on Discord written by Zeteo!" .. " \n" .. " \n",
        Url = "https://discord.com/channels/549281623154229250/1303141562120929320/1303141562120929320",
        UrlText = "Read the new Guides",
    },

    {
        Header = "BAR is accepting donations again! ",
        Text = "Dear Commanders, we are delighted to announce the reopening of our donation platform after a longer-than-expected hiatus." .. " \n" .. " \n" .. "As we've been hard at work refining BAR to ensure maximum enjoyment for our ever-expanding community, we repeatedly placed donation efforts on hold to focus on other priorities." .. " \n" .. " \n" .. "Support BAR with our newly reopened donation platform!" .. " \n",
        Image = "LuaMenu/images/donate.png",
        Url = "https://www.beyondallreason.info/news/support-bar-with-our-newly-reopened-donation-platform",
        UrlText = "Read Announcement",
    },

    --{
    --    Header = "Please help us test new engines!",
    --    Text = "Just select [Engine Test] in the launcher dropdown, and then play Skirmish and Multiplayer games. AMD testers especially needed. Report anything out of the ordinary to Discord!\n",
    --    UrlText = "BAR #engine channel on Discord"
    --},

    {
        Header = "Steam release roadmap",
        Url = "https://www.beyondallreason.info/development/steam-release",
        Text = "We've published our Steam Release roadmap, check it out on the website!",
        UrlText = "Roadmap Link"
    },

    --[[
    {
        Header = "New engine release",
        Text = "We've just released a new engine update. Be sure to report any issues to #bugreports on the discord and thank you for bearing with us through any teething problems with it.."
    },
    --]]

    {
        Header = "Play with your friends: use our servers!",
        Text = "Join any empty (blue), or waiting (green) battle to start playing, or host your own public or private battle by clicking the Host Game button in the Multiplayer Battle List",
    },

    {
        Header = "Useful commands in Multiplayer!",
        Text = "!boss [nickname] \n" ..
            "Boss someone (or yourself) in your battleroom so that person can set all the settings up without voting. You automatically become a boss of a room that you Host yourself.\n" ..
            " \n" ..
            "!forcestart \n" ..
            "If your game is stuck because of some AFK player that refuses to load or press ready, or you encountered a bug that prevents your game from starting, or you set up weird teams, !forcestart is your savior.\n" ..
            " \n" ..
            "!stop \n" ..
            "If you need to terminate the game you're currently playing for whatever reason, !stop will happily do it for you.\n" ..
            " \n" ..
            "!promote \n"  ..
            "Sends a little message on ingame main chat that your room is waiting for people to join.\n" ..
            " \n" ..
            "$rename [name] \n"  ..
            "Renames the battleroom you're currently in. Requires you to be the !boss of the battleroom to do so.\n" ..
            " \n" ..
            "$setratinglevels [min] [max] \n"  ..
            "Sets minimum and maximum skill rating allowed in the room.\n" ..
            " \n" ..
            "$resetratinglevels\n"  ..
            "Removes skill rating limits from the room.\n" ..
            " \n" ..
            "$explain \n" ..
            "Gives you a nice breakdown of how the autobalance works in your current battleroom.\n" ..
            " \n" ..
            "For a full list of commands, use !help and $help in any multiplayer room." ..
            " \n" ..
            " \b",
    },
}

return welcomePanelItems
