
function ming.nvim{
    param(
    [Parameter(Position=0)]
    [string[]]$gs)
    &"neovide" "--multigrid" $gs
}
