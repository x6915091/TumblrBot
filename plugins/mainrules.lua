do
local rlz

local function update_global_rules(textrules)
    if not _config.grules then
        _config.grules = ""
    end
    _config.grules = textrules
    rlz = textrules
    save_config()
end

local function init_global_rules()
    if not _config.grules then
        textrules = ""
        update_global_rules(textrules)
    else
        rlz = _config.grules
    end
    
end
    
local function run(msg,matches)
    init_global_rules()
    if msg.from.type == "user" then
        if matches[1]:lower() == "mainrules" then
            if rlz == "" then
                return "rules not available yet"
            end
            return rlz
        end
        
        if matches[1]:lower() == "setmainrules" and is_sudo(msg) then
            if not matches[2] then
                return "missing rules argument"
            end
            local textrules = matches[2]
            update_global_rules(textrules)
            return "rules updated :3"
        end
        
    end
    return "only in pvt!"
end

return {
    patterns = {
        "^/([Mm]ainrules)",
        "^/([Ss]etmainrules) (.+)$"
    },
    run = run
}

end