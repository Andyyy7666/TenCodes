------------------------------------------------------------------------
------------------------------------------------------------------------
--			DO NOT EDIT IF YOU DON'T KNOW WHAT YOU'RE DOING			  --
--     							 									  --
--	   For support join my discord: https://discord.gg/Z9Mxu72zZ6	  --
------------------------------------------------------------------------
------------------------------------------------------------------------

-- variables
local display = false
local pageNumber = 1
local MaxPages = 3

-- Key mapping
RegisterCommand('+TenCodesOpen', function()
    SetDisplay(not display)
    SendNUIMessage({
        page = "page" .. pageNumber
    })
end, false)
RegisterKeyMapping('+TenCodesOpen', '10 Codes | Open', 'keyboard', 'down')

RegisterCommand('+TenCodesPreviousPage', function()
    if pageNumber == 1 then
        pageNumber = pageNumber + MaxPages - 1
        SendNUIMessage({
            page = "page" .. pageNumber
        })
    else
        pageNumber = pageNumber - 1
        SendNUIMessage({
            page = "page" .. pageNumber
        })
    end
end, false)
RegisterKeyMapping('+TenCodesPreviousPage', '10 Codes | Previous page', 'keyboard', 'left')

RegisterCommand('+TenCodesNextPage', function()
    if pageNumber == MaxPages then
        pageNumber = pageNumber - MaxPages + 1
        SendNUIMessage({
            page = "page" .. pageNumber
        })
    else
        pageNumber = pageNumber + 1
        SendNUIMessage({
            page = "page" .. pageNumber
        })
    end
end, false)
RegisterKeyMapping('+TenCodesNextPage', '10 Codes | Next page', 'keyboard', 'right')

-- Close when NUI callback is close.
RegisterNUICallback("close", function(data)
    SetDisplay(false)
end)

-- Functions
function SetDisplay(bool)
    display = bool
    SendNUIMessage({
        type = "open",
        status = bool
    })
end