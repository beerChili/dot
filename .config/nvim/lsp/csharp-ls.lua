return {
    cmd = { "csharp-ls" },
    filetypes = { "cs" },
    root_markers = { "Directory.Build.props", ".git" },
    init_options = {
        AutomaticWorkspaceInit = true,
    },
    get_language_id = function(_, filetype)
        if filetype == "cs" then
            return "csharp"
        end
        return filetype
    end,
}
